# ============================================================
# Síntese dedicada à equivalência formal (Formality)
#
# Gera um par NETLIST + SVF da MESMA rodada de compile_ultra.
# Não reutiliza o DDC do sweep: o SVF precisa registrar de forma
# contínua as transformações do RTL original até a netlist final.
#
# Uso:
#   FORMALITY_MODE=no_autoungroup dc_shell -f synth/formality_synth.tcl
#   FORMALITY_MODE=autoungroup    dc_shell -f synth/formality_synth.tcl
# ============================================================

set SYNTH_DIR [file dirname [file normalize [info script]]]
set PROJECT_ROOT [file normalize [file join $SYNTH_DIR ..]]
set TOP vending_top

proc formal_synth_fatal {msg} {
  puts "============================================================"
  puts "ERRO (síntese para Formality): $msg"
  puts "============================================================"
  exit 1
}

# Modo solicitado.
set MODE no_autoungroup
if {[info exists ::env(FORMALITY_MODE)] && $::env(FORMALITY_MODE) ne ""} {
  set MODE [string trim $::env(FORMALITY_MODE)]
}
if {$MODE ne "no_autoungroup" && $MODE ne "autoungroup"} {
  formal_synth_fatal "FORMALITY_MODE inválido: '$MODE'. Use no_autoungroup ou autoungroup."
}

# Biblioteca: exatamente a mesma tecnologia usada na síntese anterior.
if {[info exists ::env(SAED32_TARGET_LIB)] && $::env(SAED32_TARGET_LIB) ne ""} {
  set TARGET_DB [file normalize $::env(SAED32_TARGET_LIB)]
} else {
  set TARGET_DB [file normalize [file join $SYNTH_DIR libs saed32rvt_tt1p05v25c.db]]
}
if {![file exists $TARGET_DB]} {
  formal_synth_fatal "biblioteca SAED32 não encontrada: $TARGET_DB"
}

set_app_var search_path [concat [get_app_var search_path] [list \
  $PROJECT_ROOT \
  [file join $PROJECT_ROOT rtl] \
  $SYNTH_DIR \
  [file dirname $TARGET_DB] \
]]
set_app_var target_library [list $TARGET_DB]
set_app_var synthetic_library [list dw_foundation.sldb]
set_app_var link_library [concat "*" [list $TARGET_DB] [list dw_foundation.sldb]]

# WORK separado do fluxo normal para não misturar checkpoints.
set FORMAL_WORK [file join $SYNTH_DIR work_formality $MODE]
file delete -force $FORMAL_WORK
file mkdir $FORMAL_WORK
define_design_lib WORK -path $FORMAL_WORK

set RTL_FILES [list \
  [file join $PROJECT_ROOT rtl vending_pkg.sv] \
  [file join $PROJECT_ROOT rtl credit_reg.sv] \
  [file join $PROJECT_ROOT rtl memory.sv] \
  [file join $PROJECT_ROOT rtl comparator.sv] \
  [file join $PROJECT_ROOT rtl subtractor.sv] \
  [file join $PROJECT_ROOT rtl control_unit.sv] \
  [file join $PROJECT_ROOT rtl vending_top.sv] \
]

# Artefatos específicos de cada rodada, conforme o roteiro.
set REPORT_DIR [file join $SYNTH_DIR reports formality_synth $MODE]
file mkdir $REPORT_DIR

if {$MODE eq "no_autoungroup"} {
  # Rodada principal: usa exatamente os nomes-base exigidos pelo roteiro.
  # Depois da geração criamos também aliases *_grouped para facilitar a comparação.
  set SVF_FILE     [file join $SYNTH_DIR reports default.svf]
  set NETLIST_FILE [file join $SYNTH_DIR vending_top_netlist.v]
} else {
  # Ungroup automático habilitado.
  set SVF_FILE     [file join $SYNTH_DIR reports default_ungrouped.svf]
  set NETLIST_FILE [file join $SYNTH_DIR vending_top_netlist_ungrouped.v]
}

# Evita usar por engano um SVF/netlist de rodada anterior.
file delete -force $SVF_FILE
file delete -force $NETLIST_FILE

puts "============================================================"
puts "Síntese para Formality"
puts "MODE       : $MODE"
puts "TARGET_DB  : $TARGET_DB"
puts "SVF        : $SVF_FILE"
puts "NETLIST    : $NETLIST_FILE"
puts "============================================================"

# 1) Golden RTL usado para produzir esta revision.
if {[catch {analyze -format sverilog $RTL_FILES} msg]} {
  formal_synth_fatal "analyze falhou: $msg"
}
if {[catch {elaborate $TOP} msg]} {
  formal_synth_fatal "elaborate falhou: $msg"
}
current_design $TOP
if {[catch {set link_ok [link]} msg] || !$link_ok} {
  formal_synth_fatal "link falhou: $msg"
}

# 2) Constraints da atividade original.
if {[catch {read_sdc [file join $SYNTH_DIR vending.sdc]} msg]} {
  formal_synth_fatal "read_sdc vending.sdc falhou: $msg"
}

# 3) Sanidade antes da otimização.
set ::formal_check_ok 1
if {[catch {
  redirect [file join $REPORT_DIR check_design_pre.rpt] { set ::formal_check_ok [check_design] }
} msg]} {
  formal_synth_fatal "check_design falhou: $msg"
}
if {!$::formal_check_ok} {
  formal_synth_fatal "check_design encontrou erros; veja $REPORT_DIR/check_design_pre.rpt"
}
unset ::formal_check_ok

# Compatibilidade da netlist Verilog, igual ao fluxo anterior.
set_fix_multiple_port_nets -all -buffer_constants

# ============================================================
# PONTO-CHAVE DA ATIVIDADE FORMAL:
# set_svf precisa estar ANTES de compile_ultra e permanecer ativo
# até a netlist final ser produzida, para registrar as transformações.
# ============================================================
if {[catch {set_svf $SVF_FILE} msg]} {
  formal_synth_fatal "set_svf falhou: $msg"
}

if {$MODE eq "no_autoungroup"} {
  if {[catch {compile_ultra -no_autoungroup} msg]} {
    catch {set_svf -off}
    formal_synth_fatal "compile_ultra -no_autoungroup falhou: $msg"
  }
} else {
  if {[catch {compile_ultra} msg]} {
    catch {set_svf -off}
    formal_synth_fatal "compile_ultra falhou: $msg"
  }
}

# Mudança de nomes também acontece com o SVF ainda ativo.
if {[catch {change_names -rules verilog -hierarchy} msg]} {
  catch {set_svf -off}
  formal_synth_fatal "change_names falhou: $msg"
}

# Reports da rodada que gerou exatamente este SVF/netlist.
redirect [file join $REPORT_DIR area.rpt]        { report_area -hierarchy }
redirect [file join $REPORT_DIR timing.rpt]      { report_timing -delay_type max -max_paths 10 }
redirect [file join $REPORT_DIR power.rpt]       { report_power }
redirect [file join $REPORT_DIR constraints.rpt] { report_constraint -all_violators }
redirect [file join $REPORT_DIR design.rpt]      { report_design }

if {[catch {write -format verilog -hierarchy -output $NETLIST_FILE} msg]} {
  catch {set_svf -off}
  formal_synth_fatal "write netlist falhou: $msg"
}

# O SVF só é fechado depois da geração da revision.
catch {set_svf -off}

# Alias da rodada principal para a nomenclatura da comparação da seção 11.
# O sign-off principal usa default.svf + vending_top_netlist.v diretamente,
# preservando o "único trilho de auditoria" pedido pelo roteiro.
if {$MODE eq "no_autoungroup"} {
  file copy -force $SVF_FILE [file join $SYNTH_DIR reports default_grouped.svf]
  file copy -force $NETLIST_FILE [file join $SYNTH_DIR vending_top_netlist_grouped.v]
}

# Metadados simples para provar que cada par pertence à mesma rodada.
set META_FILE [file join $REPORT_DIR pair_metadata.txt]
set fp [open $META_FILE w]
puts $fp "mode=$MODE"
puts $fp "top=$TOP"
puts $fp "target_db=$TARGET_DB"
puts $fp "svf=[file normalize $SVF_FILE]"
puts $fp "netlist=[file normalize $NETLIST_FILE]"
puts $fp "generated_at=[clock format [clock seconds] -format {%Y-%m-%d %H:%M:%S}]"
close $fp

puts "============================================================"
puts "PAR FORMAL GERADO COM SUCESSO"
puts "SVF     : $SVF_FILE"
puts "NETLIST : $NETLIST_FILE"
puts "REPORTS : $REPORT_DIR"
puts "============================================================"
quit
