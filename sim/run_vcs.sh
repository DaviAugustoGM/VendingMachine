#!/bin/bash
set -e

# Execute este script dentro da pasta sim/:
#   cd sim
#   ./run_vcs.sh

vcs -full64 -sverilog -timescale=1ns/1ps -debug_access+all -kdb \
  ../rtl/vending_pkg.sv \
  ../rtl/credit_reg.sv \
  ../rtl/memory.sv \
  ../rtl/comparator.sv \
  ../rtl/subtractor.sv \
  ../rtl/control_unit.sv \
  ../rtl/vending_top.sv \
  tb_vending.sv \
  -o simv

./simv
