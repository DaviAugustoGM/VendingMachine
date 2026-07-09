# ============================================================
# Constraints do projeto Vending Machine
# Top: vending_top
# ============================================================

# Clock principal: período inicial de 20 ns = 50 MHz
create_clock -name clk -period 20.0 [get_ports clk]

# Incerteza de clock pedida na atividade
set_clock_uncertainty 0.5 [get_clocks clk]

# Entradas, exceto clock
set input_ports [remove_from_collection [all_inputs] [get_ports clk]]

# Atraso de entrada pedido na atividade
set_input_delay 3.0 -clock [get_clocks clk] $input_ports

# Atraso de saída pedido na atividade
set_output_delay 3.0 -clock [get_clocks clk] [all_outputs]

# Carga das saídas.
# O valor pode ser ajustado conforme a biblioteca do laboratório.
set_load 0.05 [all_outputs]

# Célula que modela quem dirige as entradas.
# Em muitas bibliotecas SAED32, o nome é INVX1_RVT.
# Caso sua biblioteca use outro nome, troque aqui.
if {[sizeof_collection $input_ports] > 0} {
  if {[catch {set_driving_cell -lib_cell INVX1_RVT $input_ports} msg]} {
    puts "AVISO: não foi possível usar INVX1_RVT em set_driving_cell."
    puts "Mensagem do DC: $msg"
    puts "Tentando INVX1..."
    if {[catch {set_driving_cell -lib_cell INVX1 $input_ports} msg2]} {
      puts "AVISO: também não foi possível usar INVX1."
      puts "Mensagem do DC: $msg2"
      puts "Ajuste manualmente o nome da célula em synth/vending.sdc."
    }
  }
}
