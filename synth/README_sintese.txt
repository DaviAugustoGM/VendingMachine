Arquivos corrigidos para síntese da Vending Machine

Coloque a pasta synth/ na raiz do projeto, ficando assim:

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
└── synth/
    ├── dc_setup.tcl
    ├── .synopsys_dc.setup
    ├── vending.sdc
    ├── synth.tcl
    ├── reports/
    ├── results/
    └── libs/

Como rodar:

1) Coloque a biblioteca saed32rvt_tt1p05v25c.db em:
   - grupo_NN_vending/libs/
   ou
   - grupo_NN_vending/synth/libs/

2) Execute a partir da raiz do projeto:

   dc_shell -f synth/synth.tcl

Observação:
- Use synth/synth.tcl.
- Não use synthesize.tcl antigo, porque ele estava configurado para outro projeto.
- O arquivo vending.sdc usa clock inicial de 20 ns, uncertainty de 0,5 ns e delays de 3 ns, como a atividade pede.
