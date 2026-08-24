# ============================================================
# Formality — equivalência RTL (golden) x netlist (revision)
# com guidance do SVF gerado pelo Design Compiler.
#
# Uso:
#   FORMALITY_MODE=no_autoungroup fm_shell -f fm/formality.tcl
#   FORMALITY_MODE=autoungroup    fm_shell -f fm/formality.tcl
#
# Opcional, se restarem unmatched points após o guidance:
#   FORMALITY_MATCH_CERTAIN=1 FORMALITY_MODE=... fm_shell -f fm/formality.tcl
# ============================================================

set FM_DIR [file dirname [file normalize [info script]]]
set PROJECT_ROOT [file normalize [file join $FM_DIR ..]]
set SYNTH_DIR [file join $PROJECT_ROOT synth]
set RTL_DIR [file join $PROJECT_ROOT rtl]

proc fm_fatal {msg} {
  puts "============================================================"
  puts "ERRO (Formality): $msg"
  puts "============================================================"
  exit 1
}

set MODE no_autoungroup
if {[info exists ::env(FORMALITY_MODE)] && $::env(FORMALITY_MODE) ne ""} {
  set MODE [string trim $::env(FORMALITY_MODE)]
}
if {$MODE ne "no_autoungroup" && $MODE ne "autoungroup"} {
  fm_fatal "FORMALITY_MODE inválido: '$MODE'."
}

set RUN_CERTAIN false
if {[info exists ::env(FORMALITY_MATCH_CERTAIN)] && $::env(FORMALITY_MATCH_CERTAIN) ne ""} {
  set _v [string tolower [string trim $::env(FORMALITY_MATCH_CERTAIN)]]
  if {$_v eq "1" || $_v eq "true" || $_v eq "yes"} { set RUN_CERTAIN true }
}

if {[info exists ::env(SAED32_TARGET_LIB)] && $::env(SAED32_TARGET_LIB) ne ""} {
  set TARGET_DB [file normalize $::env(SAED32_TARGET_LIB)]
} else {
  set TARGET_DB [file normalize [file join $SYNTH_DIR libs saed32rvt_tt1p05v25c.db]]
}

if {$MODE eq "no_autoungroup"} {
  # Sign-off principal: reabre exatamente o default.svf gerado pelo DC.
  set SVF_FILE [file normalize [file join $SYNTH_DIR reports default.svf]]
  set NETLIST_FILE [file normalize [file join $SYNTH_DIR vending_top_netlist.v]]
} else {
  set SVF_FILE [file normalize [file join $SYNTH_DIR reports default_ungrouped.svf]]
  set NETLIST_FILE [file normalize [file join $SYNTH_DIR vending_top_netlist_ungrouped.v]]
}

set REPORT_DIR [file join $FM_DIR reports $MODE]
file mkdir $REPORT_DIR

foreach req [list $TARGET_DB $SVF_FILE $NETLIST_FILE] {
  if {![file exists $req]} { fm_fatal "arquivo obrigatório não encontrado: $req" }
}

set START_MS [clock milliseconds]

puts "============================================================"
puts "FORMALITY CONFIGURATION"
puts "MODE       : $MODE"
puts "TARGET_DB  : $TARGET_DB"
puts "SVF        : $SVF_FILE"
puts "REVISION   : $NETLIST_FILE"
puts "REPORTS    : $REPORT_DIR"
puts "MATCH_CERT : $RUN_CERTAIN"
puts "============================================================"

# 1) Mesma biblioteca de células usada pelo Design Compiler.
if {[catch {read_db $TARGET_DB} msg]} {
  fm_fatal "read_db falhou: $msg"
}

# 2) Habilita o setup automático ANTES de carregar o SVF.
# Formality X-2025.06-SP3 exige esta ordem; caso contrário, emite CMD-013.
set synopsys_auto_setup true

# 3) Guidance: ainda deve ser carregado ANTES de read_sverilog/set_top.
if {[catch {set_svf $SVF_FILE} msg]} {
  fm_fatal "set_svf falhou: $msg"
}

# 4) Golden = exatamente o RTL que alimentou a síntese.
set RTL_FILES [list \
  [file join $RTL_DIR vending_pkg.sv] \
  [file join $RTL_DIR credit_reg.sv] \
  [file join $RTL_DIR memory.sv] \
  [file join $RTL_DIR comparator.sv] \
  [file join $RTL_DIR subtractor.sv] \
  [file join $RTL_DIR control_unit.sv] \
  [file join $RTL_DIR vending_top.sv] \
]

# O golden usa recursos de SystemVerilog (package/typedef/enum).
# Na versão X-2025.06-SP3, read_verilog tratou vending_pkg.sv como Verilog comum
# e falhou em "package vending_pkg;". Portanto, use explicitamente read_sverilog.
read_sverilog -r $RTL_FILES

if {[catch {set_top r:/WORK/vending_top} msg]} {
  fm_fatal "set_top do golden falhou: $msg"
}

# 5) Revision = netlist da MESMA rodada que gerou o SVF acima.
if {[catch {read_verilog -i $NETLIST_FILE} msg]} {
  fm_fatal "read_verilog da revision falhou: $msg"
}
if {[catch {set_top i:/WORK/vending_top} msg]} {
  fm_fatal "set_top da revision falhou: $msg"
}

# 6) MATCH guiado pelo SVF.
if {[catch {match} msg]} {
  fm_fatal "match falhou: $msg"
}

# Evidências logo após o guidance, antes de qualquer segunda passada.
catch {redirect [file join $REPORT_DIR formality_svf_accepted.rpt] { report_svf_operation -status accepted }}
catch {redirect [file join $REPORT_DIR formality_svf_rejected.rpt] { report_svf_operation -status rejected }}
catch {redirect [file join $REPORT_DIR formality_matched_after_guidance.rpt] { report_matched_points }}
catch {redirect [file join $REPORT_DIR formality_unmatched_after_guidance.rpt] { report_unmatched_points }}

# Segunda passada opcional somente para investigar unmatched remanescentes.
if {$RUN_CERTAIN} {
  puts "INFO: executando match -certain como segunda passada."
  if {[catch {match -certain} msg]} {
    puts "AVISO: match -certain falhou/não está disponível nesta versão: $msg"
  }
}

catch {redirect [file join $REPORT_DIR formality_matched.rpt] { report_matched_points }}
catch {redirect [file join $REPORT_DIR formality_unmatched.rpt] { report_unmatched_points }}

# 7) VERIFY: prova de equivalência ponto a ponto.
if {[catch {verify} msg]} {
  # Não aborta antes dos relatórios: um FAILED/INCONCLUSIVE precisa ser documentado.
  puts "AVISO: verify retornou: $msg"
}

catch {redirect [file join $REPORT_DIR formality_status.rpt] { report_status }}
catch {redirect [file join $REPORT_DIR formality_passing.rpt] { report_passing_points }}
catch {redirect [file join $REPORT_DIR formality_failing.rpt] { report_failing_points }}
catch {redirect [file join $REPORT_DIR formality_unmatched.rpt] { report_unmatched_points }}

set END_MS [clock milliseconds]
set RUNTIME_FILE [file join $REPORT_DIR runtime.txt]
set fp [open $RUNTIME_FILE w]
puts $fp "mode=$MODE"
puts $fp "svf=$SVF_FILE"
puts $fp "netlist=$NETLIST_FILE"
puts $fp "match_certain=$RUN_CERTAIN"
puts $fp "elapsed_seconds=[format %.3f [expr {($END_MS - $START_MS) / 1000.0}]]"
close $fp

puts "============================================================"
puts "FORMALITY FINALIZADO"
puts "Veja principalmente: $REPORT_DIR/formality_status.rpt"
puts "SVF accepted/rejected: $REPORT_DIR/formality_svf_*.rpt"
puts "Unmatched: $REPORT_DIR/formality_unmatched.rpt"
puts "Runtime: $RUNTIME_FILE"
puts "============================================================"

# Não use "set_svf -off": essa opção não existe no Formality X-2025.06-SP3.
# A sessão termina imediatamente, portanto basta sair.
exit
