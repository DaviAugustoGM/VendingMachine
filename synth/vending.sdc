# ============================================================
# Constraints da Vending Machine — versão SDC autocontida
# Usada pelo fluxo de referência da atividade e pela síntese
# dedicada à equivalência formal.
# ============================================================

create_clock -name clk -period 20.0 [get_ports clk]
set_clock_uncertainty 0.5 [get_clocks clk]

set data_inputs [remove_from_collection [all_inputs] [get_ports clk]]
if {[sizeof_collection $data_inputs] > 0} {
  set_input_delay 3.0 -clock [get_clocks clk] $data_inputs

  # Biblioteca SAED32 usada no laboratório. Fallback mantido para
  # ambientes que usem o nome curto da célula.
  if {[catch {set_driving_cell -lib_cell INVX1_RVT $data_inputs}]} {
    catch {set_driving_cell -lib_cell INVX1 $data_inputs}
  }
}

if {[sizeof_collection [all_outputs]] > 0} {
  set_output_delay 3.0 -clock [get_clocks clk] [all_outputs]
  set_load 0.05 [all_outputs]
}
