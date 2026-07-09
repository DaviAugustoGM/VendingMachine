# ============================================================
# Projeto: Vending Machine em SystemVerilog
# Top de simulação: tb_vending
# Top de síntese:    vending_top
# ============================================================

RTL_DIR   := rtl
SIM_DIR   := sim
SYNTH_DIR := synth
DOCS_DIR  := docs

PKG_FILES := $(RTL_DIR)/vending_pkg.sv

RTL_FILES := \
	$(RTL_DIR)/credit_reg.sv \
	$(RTL_DIR)/memory.sv \
	$(RTL_DIR)/comparator.sv \
	$(RTL_DIR)/subtractor.sv \
	$(RTL_DIR)/control_unit.sv \
	$(RTL_DIR)/vending_top.sv

TB_FILES := $(SIM_DIR)/tb_vending.sv

SIM_TOP := tb_vending
TIMESCALE := 1ns/1ps

VLOGAN_FLAGS := -full64 \
	-sverilog \
	-kdb

VCS_FLAGS := -full64 \
	-timescale=$(TIMESCALE) \
	-debug_access+all \
	-kdb

# ------------------------------------------------------------
# Simulação com VCS
# ------------------------------------------------------------
syntax:
	vlogan $(VLOGAN_FLAGS) \
		$(PKG_FILES) \
		$(RTL_FILES) \
		$(TB_FILES)

compile: syntax
	vcs $(VCS_FLAGS) -top $(SIM_TOP) -o simv

run: compile
	./simv

wave:
	verdi -ssf waves.fsdb &

# ------------------------------------------------------------
# Síntese com Synopsys Design Compiler
# ------------------------------------------------------------
synth:
	dc_shell -f $(SYNTH_DIR)/synth.tcl

# ------------------------------------------------------------
# Limpeza
# ------------------------------------------------------------
clean_sim:
	rm -rf csrc simv simv.daidir AN.DB DVEfiles work.lib++ alib-52
	rm -rf novas* verdi* ucli.key *.key *.log .vlogan* *.fsdb *.vcd

clean_synth:
	rm -rf work command.log default.svf filenames.log
	rm -rf $(SYNTH_DIR)/work
	rm -rf $(SYNTH_DIR)/reports/* $(SYNTH_DIR)/results/*
	touch $(SYNTH_DIR)/reports/.gitkeep $(SYNTH_DIR)/results/.gitkeep

clean: clean_sim clean_synth

.PHONY: syntax compile run wave synth clean clean_sim clean_synth
