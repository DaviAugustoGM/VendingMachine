# ============================================================
# Configuração do Synopsys Design Compiler para SAED32
# Projeto: Vending Machine
#
# Use este arquivo sendo chamado por:
#   source synth/dc_setup.tcl
# ============================================================

# Pastas onde o Design Compiler irá procurar RTL e bibliotecas.
# Coloque saed32rvt_tt1p05v25c.db em ./libs ou ./synth/libs,
# ou ajuste o caminho abaixo para o local usado no laboratório.
set search_path [concat $search_path [list . ./rtl ./synth ./libs ./synth/libs]]

# Biblioteca alvo do laboratório.
set target_library [list saed32rvt_tt1p05v25c.db]

# Biblioteca DesignWare.
set synthetic_library [list dw_foundation.sldb]

# Bibliotecas usadas para link.
set link_library [concat "*" $target_library $synthetic_library]

# Biblioteca de trabalho.
file mkdir work
define_design_lib WORK -path ./work

# Opções úteis para SystemVerilog / RTL.
set hdlin_enable_rtl_for_iq 1
set hdlin_check_no_latch true

puts "============================================================"
puts "Configuração SAED32 carregada para o projeto vending_top"
puts "============================================================"
