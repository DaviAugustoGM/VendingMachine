# Compatibilidade com o comando antigo.
# O sweep real e reutilizável está em synth/sweep.tcl.
set _dir [file dirname [file normalize [info script]]]
source [file join $_dir sweep.tcl]
