# ============================================================
# Script automático de exploração de síntese
# Projeto: Vending Machine
# Top: vending_top
#
# Execute a partir da raiz do projeto:
#   dc_shell -f synth/synth_sweep.tcl
#
# Saídas:
#   synth/runs/P20_no_autoungroup/
#   synth/runs/P20_autoungroup/
#   ...
#   synth/runs/summary.csv
# ============================================================

set TOP vending_top

# ------------------------------------------------------------
# Configuração de bibliotecas
# ------------------------------------------------------------
source synth/dc_setup.tcl

# ------------------------------------------------------------
# Arquivos RTL
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
# Períodos de clock a testar, em ns
# Edite esta lista se quiser testar mais ou menos pontos.
# ------------------------------------------------------------
set PERIODS [list 20 18 16 14 12 10 8 6 4 2]

# Modos:
#   no_autoungroup -> compile_ultra -no_autoungroup
#   autoungroup    -> compile_ultra
set MODES [list no_autoungroup autoungroup]

# ------------------------------------------------------------
# Diretórios gerais
# ------------------------------------------------------------
file mkdir synth/runs

set summary_file "synth/runs/summary.csv"
set fp [open $summary_file "w"]
puts $fp "period_ns,frequency_mhz,mode,slack_ns,area,timing_status"
close $fp

# ------------------------------------------------------------
# Procedimento: aplica constraints para cada período
# ------------------------------------------------------------
proc apply_constraints {period} {
  # Remove clocks anteriores, caso existam.
  catch {remove_clock [all_clocks]}

  create_clock -name clk -period $period [get_ports clk]

  set_clock_uncertainty 0.5 [get_clocks clk]

  set input_ports [remove_from_collection [all_inputs] [get_ports clk]]

  set_input_delay 3.0 -clock [get_clocks clk] $input_ports
  set_output_delay 3.0 -clock [get_clocks clk] [all_outputs]

  set_load 0.05 [all_outputs]

  # Ajuste o nome da célula caso a biblioteca do laboratório use outro.
  if {[sizeof_collection $input_ports] > 0} {
    if {[catch {set_driving_cell -lib_cell INVX1_RVT $input_ports} msg]} {
      puts "AVISO: INVX1_RVT não encontrada para set_driving_cell."
      puts "Tentando INVX1..."
      catch {set_driving_cell -lib_cell INVX1 $input_ports}
    }
  }
}

# ------------------------------------------------------------
# Procedimento: roda uma síntese completa
# ------------------------------------------------------------
proc run_one_synthesis {period mode rtl_files top} {
  puts "============================================================"
  puts "Rodando síntese: período=${period} ns | modo=${mode}"
  puts "============================================================"

  set period_name [string map {. p} $period]
  set run_dir "synth/runs/P${period_name}_${mode}"

  file mkdir $run_dir
  file mkdir $run_dir/reports
  file mkdir $run_dir/results

  # Começa cada caso do zero, evitando reaproveitar otimizações anteriores.
  catch {remove_design -all}

  analyze -format sverilog $rtl_files

  elaborate $top
  current_design $top
  link

  apply_constraints $period

  redirect $run_dir/reports/check_design.rpt {
    check_design
  }

  redirect $run_dir/reports/check_timing_pre.rpt {
    check_timing
  }

  if {$mode == "no_autoungroup"} {
    compile_ultra -no_autoungroup
  } else {
    compile_ultra
  }

  redirect $run_dir/reports/area.rpt {
    report_area -hierarchy
  }

  redirect $run_dir/reports/timing.rpt {
    report_timing -max_paths 10 -delay_type max
  }

  redirect $run_dir/reports/power.rpt {
    report_power
  }

  redirect $run_dir/reports/constraints.rpt {
    report_constraint -all_violators
  }

  redirect $run_dir/reports/qor.rpt {
    report_qor
  }

  write -format verilog -hierarchy -output $run_dir/results/${top}_netlist.v
  write -format ddc     -hierarchy -output $run_dir/results/${top}.ddc
  write_sdc $run_dir/results/${top}.sdc

  # Coleta automática do slack e da área para tabela CSV.
  set paths [get_timing_paths -max_paths 1 -delay_type max]
  if {[sizeof_collection $paths] > 0} {
    set slack [get_attribute $paths slack]
  } else {
    set slack "NA"
  }

  set area [get_attribute [current_design] area]

  set frequency [expr {1000.0 / $period}]

  if {$slack == "NA"} {
    set timing_status "UNKNOWN"
  } elseif {$slack >= 0} {
    set timing_status "OK"
  } else {
    set timing_status "VIOLATED"
  }

  set fp [open "synth/runs/summary.csv" "a"]
  puts $fp "$period,$frequency,$mode,$slack,$area,$timing_status"
  close $fp

  puts "Resultado: período=${period} ns | freq=${frequency} MHz | mode=${mode} | slack=${slack} ns | área=${area} | ${timing_status}"
}

# ------------------------------------------------------------
# Loop principal
# ------------------------------------------------------------
foreach mode $MODES {
  foreach period $PERIODS {
    run_one_synthesis $period $mode $RTL_FILES $TOP
  }
}

puts "============================================================"
puts "EXPLORAÇÃO CONCLUÍDA"
puts "Resumo CSV: synth/runs/summary.csv"
puts "Relatórios: synth/runs/P<periodo>_<modo>/reports/"
puts "============================================================"

quit
