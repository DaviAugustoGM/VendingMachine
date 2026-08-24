# ============================================================
# Lista de RTL do projeto
#
# Ao reutilizar o fluxo em outro projeto, normalmente basta
# trocar esta lista e o TOP em config.tcl.
# ============================================================

set RTL_FILES [list \
  [file join $PROJECT_ROOT rtl vending_pkg.sv] \
  [file join $PROJECT_ROOT rtl credit_reg.sv] \
  [file join $PROJECT_ROOT rtl memory.sv] \
  [file join $PROJECT_ROOT rtl comparator.sv] \
  [file join $PROJECT_ROOT rtl subtractor.sv] \
  [file join $PROJECT_ROOT rtl control_unit.sv] \
  [file join $PROJECT_ROOT rtl vending_top.sv] \
]
