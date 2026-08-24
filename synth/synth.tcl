# Compatibilidade com o comando antigo.
# O fluxo real e reutilizável está em synth/flow.tcl.
set _dir [file dirname [file normalize [info script]]]
source [file join $_dir flow.tcl]
