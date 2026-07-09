# ============================================================
# Script de síntese - Vending Machine
# Top: vending_top
#
# Execute a partir da raiz do projeto:
#   dc_shell -f synth/synth.tcl
# ============================================================

set TOP vending_top

# ------------------------------------------------------------
# Configuração de bibliotecas
# ------------------------------------------------------------
source synth/dc_setup.tcl

# ------------------------------------------------------------
# Diretórios de saída
# ------------------------------------------------------------
file mkdir synth/reports
file mkdir synth/results

# ------------------------------------------------------------
# Lista de arquivos RTL
# ------------------------------------------------------------
set RTL_FILES [list \
  rtl/vending_pkg.sv \
  rtl/credit_reg.sv \
  rtl/memory.sv \
  rtl/comparator.sv \
  rtl/subtractor.sv \
  rtl/control_unit.sv \
  rtl/vending_top.sv \
]

# ------------------------------------------------------------
# Leitura e elaboração do RTL
# ------------------------------------------------------------
analyze -format sverilog $RTL_FILES

elaborate $TOP
current_design $TOP
link

# ------------------------------------------------------------
# Constraints
# ------------------------------------------------------------
read_sdc synth/vending.sdc

# ------------------------------------------------------------
# Verificação pré-síntese
# ------------------------------------------------------------
redirect synth/reports/check_design.rpt {
  check_design
}

redirect synth/reports/check_timing_pre.rpt {
  check_timing
}

# ------------------------------------------------------------
# Síntese lógica
# ------------------------------------------------------------
compile_ultra -no_autoungroup

# ------------------------------------------------------------
# Relatórios pós-síntese
# ------------------------------------------------------------
redirect synth/reports/area.rpt {
  report_area -hierarchy
}

redirect synth/reports/timing.rpt {
  report_timing -max_paths 10 -delay_type max
}

redirect synth/reports/power.rpt {
  report_power
}

redirect synth/reports/constraints.rpt {
  report_constraint -all_violators
}

redirect synth/reports/qor.rpt {
  report_qor
}

# ------------------------------------------------------------
# Exportação dos resultados
# ------------------------------------------------------------
write -format verilog -hierarchy -output synth/results/${TOP}_netlist.v
write -format ddc     -hierarchy -output synth/results/${TOP}.ddc
write_sdc synth/results/${TOP}.sdc

puts "============================================================"
puts "SÍNTESE CONCLUÍDA"
puts "Relatórios em: synth/reports/"
puts "Resultados em: synth/results/"
puts "Top sintetizado: $TOP"
puts "============================================================"

quit
