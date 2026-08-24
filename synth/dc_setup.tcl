# ============================================================
# Compatibilidade com scripts antigos:
#   source synth/dc_setup.tcl
#
# Carrega toda a infraestrutura mínima necessária para que o
# arquivo de tecnologia possa usar feature_on/synth_fatal.
# Novos fluxos devem preferir flow.tcl ou sweep.tcl.
# ============================================================
set _dc_setup_dir [file dirname [file normalize [info script]]]
source [file join $_dc_setup_dir config.tcl]
source [file join $_dc_setup_dir lib flow_utils.tcl]
source $PRESETS_FILE

if {[catch {apply_synth_preset $SYNTH_PRESET} _preset_msg]} {
  synth_fatal $_preset_msg
}

if {![file exists $FEATURES_FILE]} {
  synth_fatal "arquivo de features/overrides não encontrado: $FEATURES_FILE"
}
source $FEATURES_FILE
validate_features
source $TECH_SETUP_FILE
