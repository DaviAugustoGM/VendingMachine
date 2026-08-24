# Vending Machine em SystemVerilog

Projeto de controlador digital de uma vending machine com separação entre **unidade de controle** e **datapath**.

## Estrutura

```text
grupo_NN_vending/
├── rtl/
│   ├── vending_pkg.sv
│   ├── credit_reg.sv
│   ├── memory.sv
│   ├── comparator.sv
│   ├── subtractor.sv
│   ├── control_unit.sv
│   └── vending_top.sv
├── sim/
│   ├── tb_vending.sv
│   └── run_vcs.sh
├── synth/
│   ├── config.tcl
│   ├── features.tcl
│   ├── rtl_files.tcl
│   ├── constraints.tcl
│   ├── flow.tcl
│   ├── sweep.tcl
│   ├── tech/
│   ├── lib/
│   ├── scripts/
│   ├── reports/
│   ├── results/
│   └── runs/
├── docs/
│   └── diagramas.rtlex
├── Makefile
└── README.md
```

## Módulos RTL

- `vending_pkg.sv`: package com encoding dos estados e constantes das moedas.
- `credit_reg.sv`: registrador síncrono de crédito.
- `memory.sv`: memória 4×16 bits com preço e estoque dos produtos.
- `comparator.sv`: calcula `can_sell = (credit >= price) && (stock > 0)`.
- `subtractor.sv`: calcula `change = credit - price`.
- `control_unit.sv`: FSM de controle com os estados `IDLE`, `COLLECT`, `CHECK`, `DISPENSE`, `CHANGE` e `ERROR`.
- `vending_top.sv`: módulo top-level que instancia e conecta todos os blocos.

## Simulação

Execute na raiz do projeto:

```bash
make clean
make run
```

Também é possível simular entrando em `sim/`:

```bash
cd sim
./run_vcs.sh
```

A simulação gera `waves.fsdb`, que pode ser aberto com:

```bash
make wave
```

## Síntese lógica

Antes de rodar a síntese, coloque a biblioteca `saed32rvt_tt1p05v25c.db` em uma destas pastas:

```text
libs/
synth/libs/
```

Depois execute, a partir da raiz do projeto:

```bash
make synth
```

As opções avançadas de síntese lógica podem ser ligadas/desligadas em `synth/features.tcl` usando `true`/`false`, ou selecionadas por presets.

Para experimentar outro período sem editar Tcl:

```bash
make synth PERIOD=8
```

Também é possível usar uma cópia de configuração de features:

```bash
make synth FEATURES=synth/features_timing.tcl
```

Para executar a exploração automática de períodos e modos:

```bash
make sweep
```

Os relatórios da síntese única são gerados em `synth/reports/` e os resultados em `synth/results/`. O sweep cria uma pasta por execução em `synth/runs/` e gera `synth/runs/summary.csv` com setup, hold, área, power, runtime e status de QoR.

A organização completa e as instruções para reutilizar o fluxo em outros projetos estão em `synth/README.md`.

## Observações

- Arquivos gerados por simulação/síntese, como `work.lib++`, `alib-*`, `simv`, `*.fsdb` e `*.vcd`, foram removidos da entrega limpa.
- O arquivo `docs/diagramas.rtlex` foi mantido como material de apoio dos diagramas.

## Presets de síntese

O fluxo de síntese lógica oferece presets configuráveis. Exemplos:

```bash
make presets
make synth PRESET=timing
make synth PRESET=aggressive_timing PERIOD=8 MODE=autoungroup
make sweep PRESET=area
make synth PRESET=power
```

Os presets ficam em `synth/presets.tcl`. Overrides manuais `true`/`false` podem ser feitos em `synth/features.tcl` e têm prioridade sobre o preset.


### Sweep, power e min/max

```bash
make sweep PRESET=timing PERIODS="20 16 12 8 6" MODES="no_autoungroup"
make synth PRESET=power SAIF=sim/vending.saif SAIF_INSTANCE=tb_vending/dut
```

O sweep reutiliza um DDC unmapped por padrão para não repetir `analyze/elaborate` a cada clock. O CSV consolidado inclui timing, área, power e runtime. Para análise min/max, consulte `synth/README.md`.

## Verificação de equivalência formal (Formality)

O projeto agora possui um fluxo dedicado de sign-off formal com SVF. Veja `fm/README.md`.

Comandos principais:

```bash
make formal_synth          # gera as duas netlists e seus SVFs correspondentes
make formal_no_autoungroup # verifica a rodada com -no_autoungroup
make formal_autoungroup    # verifica a rodada com autoungroup
# ou:
make formal                # executa tudo em sequência
```
