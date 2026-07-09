Automação da síntese

Arquivo principal:
  synth/synth_sweep.tcl

Como usar:
  1) Copie synth_sweep.tcl para a pasta synth/ do projeto.
  2) Garanta que synth/dc_setup.tcl exista.
  3) Rode a partir da raiz do projeto:

     dc_shell -f synth/synth_sweep.tcl

O script testa:
  - Períodos: 20, 18, 16, 14, 12, 10, 8, 6, 4 e 2 ns.
  - Modo 1: compile_ultra -no_autoungroup.
  - Modo 2: compile_ultra.

Resultados:
  synth/runs/summary.csv
  synth/runs/P20_no_autoungroup/reports/
  synth/runs/P20_autoungroup/reports/
  etc.

O CSV traz:
  period_ns, frequency_mhz, mode, slack_ns, area, timing_status
