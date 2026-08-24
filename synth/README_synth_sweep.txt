Sweep de síntese lógica reutilizável.

Documentação principal:
  synth/README.md

Exemplo de 5 sínteses:
  make sweep PRESET=timing PERIODS="20 16 12 8 6" MODES="no_autoungroup"

Por default ENABLE_SWEEP_DDC_REUSE=true:
  1) analyze/elaborate/link/check_design uma vez
  2) salva synth/work/sweep_cache/<preset>/<top>_unmapped.ddc
  3) cada ponto usa read_ddc + novas constraints + compile

Para desabilitar o reuso, sobrescreva em features.tcl:
  set ENABLE_SWEEP_DDC_REUSE false

Power com atividade real:
  make sweep PRESET=power PERIODS="20 16 12 8 6" \
    MODES="no_autoungroup" SAIF=sim/vending.saif SAIF_INSTANCE=tb_vending/dut

Cada run:
  synth/runs/<preset>/P<periodo>_<modo>/

O summary.csv consolida setup, hold, área, potência, runtime, DRC e QoR status.
O arquivo synth/synth_sweep.tcl é somente wrapper de compatibilidade.
