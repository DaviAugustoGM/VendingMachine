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
│   ├── dc_setup.tcl
│   ├── .synopsys_dc.setup
│   ├── vending.sdc
│   ├── synth.tcl
│   ├── reports/
│   ├── results/
│   └── libs/
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

## Síntese

Antes de rodar a síntese, coloque a biblioteca `saed32rvt_tt1p05v25c.db` em uma destas pastas:

```text
libs/
synth/libs/
```

Depois execute, a partir da raiz do projeto:

```bash
make synth
```

Os relatórios serão gerados em:

```text
synth/reports/
```

A netlist e arquivos exportados serão gerados em:

```text
synth/results/
```

## Observações

- Arquivos gerados por simulação/síntese, como `work.lib++`, `alib-*`, `simv`, `*.fsdb` e `*.vcd`, foram removidos da entrega limpa.
- O arquivo `docs/diagramas.rtlex` foi mantido como material de apoio dos diagramas.
