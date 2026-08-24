# Equivalência formal — Synopsys Formality

Esta pasta complementa o fluxo de síntese da Vending Machine com equivalência formal **RTL (golden) × netlist (revision)** usando o **SVF da mesma rodada de `compile_ultra` como guidance**.

## Por que existe uma síntese dedicada para Formality?

O sweep anterior pode reutilizar um DDC unmapped para acelerar várias sínteses. Isso é ótimo para exploração de timing/área, mas para o sign-off formal o roteiro exige que **cada netlist seja verificada com o seu próprio SVF, produzido na mesma rodada de síntese a partir do RTL**. Por isso `synth/formality_synth.tcl` sempre relê o RTL e cria um par inseparável `netlist + SVF`.

## 1. Gerar os dois pares de síntese

```bash
make formal_synth
```

Isso gera a rodada principal com `-no_autoungroup` nos nomes-base pedidos pelo roteiro:

- `synth/vending_top_netlist.v`
- `synth/reports/default.svf`

E também preserva aliases para a comparação lado a lado:

- `synth/vending_top_netlist_grouped.v`
- `synth/reports/default_grouped.svf`
- `synth/vending_top_netlist_ungrouped.v`
- `synth/reports/default_ungrouped.svf`

O Formality usa `default.svf` diretamente no sign-off principal, de modo que o mesmo arquivo aberto pelo Design Compiler é reaberto como guidance, formando o trilho de auditoria contínuo pedido no roteiro.

**Não misture SVF de uma rodada com netlist de outra.**

## 2. Conferência automática opcional do setup

O utilitário `fm_mk_script` roda no shell do sistema, fora do `fm_shell`:

```bash
make formal_mk_scripts
```

Compare os scripts gerados em `fm/auto/` com `fm/formality.tcl`. Eles são apenas um segundo par de olhos; o fluxo final continua em `fm/formality.tcl`.

## 3. Rodar Formality para a hierarquia preservada

```bash
make formal_no_autoungroup
```

Relatórios em:

```text
fm/reports/no_autoungroup/
```

O principal é `formality_status.rpt`. Para sign-off, procure **SUCCEEDED** e ausência de failing points relevantes.

## 4. Rodar Formality para autoungroup

```bash
make formal_autoungroup
```

Relatórios em:

```text
fm/reports/autoungroup/
```

## 5. Rodar tudo

```bash
make formal
```

Esse alvo faz as duas sínteses formais e depois as duas verificações.

## 6. Se restarem unmatched points

Primeiro examine:

- `formality_unmatched_after_guidance.rpt`
- `formality_svf_accepted.rpt`
- `formality_svf_rejected.rpt`

Só depois tente a segunda passada sugerida no roteiro:

```bash
FORMALITY_MATCH_CERTAIN=1 make formal_no_autoungroup
```

ou

```bash
FORMALITY_MATCH_CERTAIN=1 make formal_autoungroup
```

Se houver `FAILED` ou `INCONCLUSIVE`, não force matches manualmente antes de entender a causa. Preserve os reports e use `analyze_points` no ponto problemático.

## 7. Arquivos que entram no complemento do relatório

Para cada modo, preserve:

- `formality_status.rpt`
- `formality_passing.rpt`
- `formality_failing.rpt`
- `formality_unmatched.rpt`
- `formality_svf_accepted.rpt`
- `formality_svf_rejected.rpt`
- `runtime.txt`

Também mostre no relatório os trechos de `synth/formality_synth.tcl` com `set_svf` antes de `compile_ultra` e de `fm/formality.tcl` com `set_svf` seguido de `set synopsys_auto_setup true` antes do `read_verilog`.
