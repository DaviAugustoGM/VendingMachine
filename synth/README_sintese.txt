A síntese lógica foi reorganizada como framework reutilizável.

Documentação principal:
  synth/README.md

Comandos recomendados:
  make presets
  make synth
  make synth PRESET=timing PERIOD=8
  make synth PRESET=aggressive_timing PERIOD=8
  make synth PRESET=area
  make synth PRESET=power
  make synth PRESET=power SAIF=sim/vending.saif SAIF_INSTANCE=tb_vending/dut

Min/max opcional:
  # em features.tcl: ENABLE_MIN_MAX_LIBS=true
  SAED32_MIN_LIB=/path/fast.db make synth MAX_OPCOND=WORST MIN_OPCOND=BEST

Fluxo real:
  synth/flow.tcl

Presets:
  default, fast, timing, aggressive_timing, area, power

Overrides manuais:
  synth/features.tcl

O aggressive_timing executa -retime exatamente uma vez por run e exige SVF.
O arquivo synth/synth.tcl é somente wrapper de compatibilidade.
