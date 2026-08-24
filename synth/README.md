# Framework reutilizável de síntese lógica — Design Compiler

Este diretório implementa um fluxo Tcl reutilizável para **síntese lógica**. O objetivo é manter o algoritmo do fluxo genérico e mover o que muda entre projetos para arquivos pequenos de configuração.

## Estrutura

```text
synth/
├── config.tcl          # parâmetros do projeto
├── features.tcl        # overrides true/false
├── presets.tcl         # default/fast/timing/aggressive_timing/area/power
├── rtl_files.tcl       # lista de RTL
├── constraints.tcl     # clock, I/O e DRC opcionais
├── flow.tcl            # síntese única
├── sweep.tcl           # exploração de períodos/modos
├── tech/saed32.tcl     # biblioteca/tecnologia
├── lib/flow_utils.tcl  # funções genéricas
├── scripts/collect_results.py
├── reports/
├── results/
└── runs/
```

## Fluxo base

```text
analyze -> elaborate -> current_design -> link -> check_design
        -> checkpoint unmapped DDC
        -> operating conditions + constraints + atividade de power
        -> check_timing
        -> compile_ultra
        -> segundo passe opcional / area recovery
        -> check_design pós-compile
        -> reports
        -> change_names
        -> netlist + mapped DDC + SDC + SDF + SVF
```

`check_design` pré-compile é obrigatório. O check pós-compile é habilitado por default (`ENABLE_CHECK_DESIGN_POST=true`).

## Configuração e presets

```bash
make presets
make synth PRESET=default
make synth PRESET=timing PERIOD=8
make synth PRESET=area
make synth PRESET=power
```

`features.tcl` é uma camada de override. Exemplo:

```tcl
set ENABLE_RETIMING false
set ENABLE_REPORT_POWER true
set ENABLE_MULTICORE true
```

## Sweep com reuso de DDC

Por default `ENABLE_SWEEP_DDC_REUSE=true`. O sweep faz `analyze/elaborate/link/check_design` **uma única vez**, salva um DDC unmapped interno e recarrega esse checkpoint em cada combinação de clock/modo. Assim, mudar apenas constraints/opções não repete a tradução RTL.

```bash
make sweep PRESET=timing PERIODS="20 16 12 8 6" MODES="no_autoungroup"
```

Para comparar também auto-ungroup:

```bash
make sweep PERIODS="20 16 12 8 6" MODES="no_autoungroup autoungroup"
```

O cache temporário fica em `synth/work/sweep_cache/` e é recriado em cada sweep. Se quiser o comportamento antigo:

```tcl
set ENABLE_SWEEP_DDC_REUSE false
```

## Retiming e SVF

`ENABLE_RETIMING=true` exige `ENABLE_WRITE_SVF=true`. O framework executa `-retime` **exatamente uma vez por run**:

- sem segundo passe: retiming no compile inicial;
- com auto path groups/incremental: compile inicial sem retime e retiming apenas no segundo passe.

Na síntese única, o SVF cobre RTL -> netlist mapeada. No sweep com DDC reuse são gerados dois níveis de guidance:

```text
synth/work/sweep_cache/<preset>/<top>_rtl_to_unmapped.svf
synth/runs/<preset>/P.../results/<top>_unmapped_to_mapped.svf
```

Isso deixa explícita a fronteira RTL -> DDC base -> netlist de cada experimento.

## Min/max e hold

A min library é associada com `set_min_library`; ela **não** é adicionada à target/link library. Para usar min/max:

```tcl
# features.tcl
set ENABLE_MIN_MAX_LIBS true
set ENABLE_FIX_HOLD true   ;# opcional
```

Execute informando a biblioteca mínima e as operating conditions existentes nas bibliotecas:

```bash
SAED32_MIN_LIB=/path/fast.db \
make synth \
  MAX_OPCOND=WORST \
  MIN_OPCOND=BEST
```

O fluxo aplica:

```tcl
set_min_library <max.db> -min_version <min.db>
set_operating_conditions -max <MAX> -min <MIN>
```

`ENABLE_FIX_HOLD=true` só é aceito quando essa configuração min/max está completa.

## Power e SAIF

Sem SAIF:

```bash
make synth PRESET=power
```

usa clock gating (`compile_ultra -gate_clock`) e gera os reports de potência. Para otimização dinâmica baseada em atividade:

```bash
make synth \
  PRESET=power \
  SAIF=sim/vending.saif \
  SAIF_INSTANCE=tb_vending/dut
```

Quando `SAIF` é informado, o preset ativa automaticamente:

```text
ENABLE_READ_SAIF=true
ENABLE_DYNAMIC_POWER_OPTIMIZATION=true
ENABLE_REPORT_SAIF=true
```

O fluxo executa `set_dynamic_optimization true`, `read_saif ...`, compila e gera `power.rpt`/`saif.rpt`. Se a hierarquia usada para gerar o SAIF for diferente, ajuste `SAIF_INSTANCE`.

## Resultados consolidados

Depois de `make synth` ou `make sweep`, `collect_results.py` gera CSV com:

```text
setup WNS/TNS/violations
hold WNS/TNS/violations
cell/design area
dynamic power (uW)
leakage power (uW)
total power (uW)
compile CPU/wall time
DRC violating nets
preset / mode / input_source / retiming_pass / power_activity
```

O status de timing só é `PASS` quando setup e hold têm WNS >= 0. Caso os reports necessários estejam desabilitados, fica `UNKNOWN`.

## O que este fluxo não é

Este template é de **síntese lógica**. Ele não ativa automaticamente topographical/physical synthesis (`-spg`), NDM/Milkyway, TLU+, floorplan ou placement. Esses dados pertencem a uma etapa física separada.
