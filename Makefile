# ============================================================
# Projeto: Vending Machine em SystemVerilog
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

VLOGAN_FLAGS := -full64 -sverilog -kdb
VCS_FLAGS := -full64 -timescale=$(TIMESCALE) -debug_access+all -kdb

syntax:
	vlogan $(VLOGAN_FLAGS) $(PKG_FILES) $(RTL_FILES) $(TB_FILES)

compile: syntax
	vcs $(VCS_FLAGS) -top $(SIM_TOP) -o simv

run: compile
	./simv

wave:
	verdi -ssf waves.fsdb &

# ------------------------------------------------------------
# Síntese lógica com Synopsys Design Compiler
# ------------------------------------------------------------
# Exemplos:
#   make synth PERIOD=8 PRESET=timing
#   make synth PRESET=power SAIF=sim/vending.saif SAIF_INSTANCE=tb_vending/dut
#   make sweep PRESET=timing PERIODS="20 16 12 8 6" MODES="no_autoungroup"
#   SAED32_MIN_LIB=/path/fast.db make synth MAX_OPCOND=WORST MIN_OPCOND=BEST
PERIOD ?=
MODE ?=
PERIODS ?=
MODES ?=
FEATURES ?=
PRESET ?=
SAIF ?=
SAIF_INSTANCE ?=
MAX_OPCOND ?=
MIN_OPCOND ?=

synth:
	SYNTH_PERIOD="$(PERIOD)" \
	SYNTH_MODE="$(MODE)" \
	SYNTH_PRESET="$(PRESET)" \
	SYNTH_FEATURES_FILE="$(FEATURES)" \
	SYNTH_SAIF_FILE="$(SAIF)" \
	SYNTH_SAIF_INSTANCE="$(SAIF_INSTANCE)" \
	SYNTH_MAX_OPCOND="$(MAX_OPCOND)" \
	SYNTH_MIN_OPCOND="$(MIN_OPCOND)" \
	dc_shell -f $(SYNTH_DIR)/flow.tcl
	python3 $(SYNTH_DIR)/scripts/collect_results.py --input $(SYNTH_DIR) --output $(SYNTH_DIR)/summary.csv

sweep:
	SYNTH_PRESET="$(PRESET)" \
	SYNTH_FEATURES_FILE="$(FEATURES)" \
	SYNTH_SWEEP_PERIODS="$(PERIODS)" \
	SYNTH_SWEEP_MODES="$(MODES)" \
	SYNTH_SAIF_FILE="$(SAIF)" \
	SYNTH_SAIF_INSTANCE="$(SAIF_INSTANCE)" \
	SYNTH_MAX_OPCOND="$(MAX_OPCOND)" \
	SYNTH_MIN_OPCOND="$(MIN_OPCOND)" \
	dc_shell -f $(SYNTH_DIR)/sweep.tcl
	python3 $(SYNTH_DIR)/scripts/collect_results.py --input $(SYNTH_DIR)/runs --output $(SYNTH_DIR)/runs/summary.csv

presets:
	tclsh $(SYNTH_DIR)/list_presets.tcl

collect_synth:
	python3 $(SYNTH_DIR)/scripts/collect_results.py --input $(SYNTH_DIR)/runs --output $(SYNTH_DIR)/runs/summary.csv

clean_sim:
	rm -rf csrc simv simv.daidir AN.DB DVEfiles work.lib++ alib-52
	rm -rf novas* verdi* ucli.key *.key *.log .vlogan* *.fsdb *.vcd

clean_synth:
	rm -rf work command.log default.svf filenames.log
	rm -rf $(SYNTH_DIR)/work $(SYNTH_DIR)/summary.csv $(SYNTH_DIR)/run_metadata.txt
	rm -rf $(SYNTH_DIR)/reports/* $(SYNTH_DIR)/results/* $(SYNTH_DIR)/runs/*
	mkdir -p $(SYNTH_DIR)/work $(SYNTH_DIR)/reports $(SYNTH_DIR)/results $(SYNTH_DIR)/runs
	touch $(SYNTH_DIR)/reports/.gitkeep $(SYNTH_DIR)/results/.gitkeep $(SYNTH_DIR)/runs/.gitkeep

clean: clean_sim clean_synth

.PHONY: syntax compile run wave synth sweep presets collect_synth clean clean_sim clean_synth

# ------------------------------------------------------------
# Equivalência formal com Synopsys Formality + guidance SVF
# ------------------------------------------------------------
# Cada revision é gerada junto com o seu próprio SVF.
formal_synth_no_autoungroup:
	FORMALITY_MODE=no_autoungroup dc_shell -f $(SYNTH_DIR)/formality_synth.tcl

formal_synth_autoungroup:
	FORMALITY_MODE=autoungroup dc_shell -f $(SYNTH_DIR)/formality_synth.tcl

formal_synth: formal_synth_no_autoungroup formal_synth_autoungroup

formal_no_autoungroup:
	FORMALITY_MODE=no_autoungroup fm_shell -f fm/formality.tcl

formal_autoungroup:
	FORMALITY_MODE=autoungroup fm_shell -f fm/formality.tcl

formal_verify: formal_no_autoungroup formal_autoungroup

formal: formal_synth formal_verify

formal_mk_scripts:
	mkdir -p fm/auto
	fm_mk_script $(SYNTH_DIR)/reports/default.svf -output fm/auto/formality_auto_grouped.tcl
	fm_mk_script $(SYNTH_DIR)/reports/default_ungrouped.svf -output fm/auto/formality_auto_ungrouped.tcl

clean_formal:
	rm -rf fm/reports/no_autoungroup/* fm/reports/autoungroup/* fm/auto
	rm -rf $(SYNTH_DIR)/work_formality
	rm -rf $(SYNTH_DIR)/reports/formality_synth
	rm -f $(SYNTH_DIR)/reports/default.svf \
	      $(SYNTH_DIR)/reports/default_grouped.svf \
	      $(SYNTH_DIR)/reports/default_ungrouped.svf
	rm -f $(SYNTH_DIR)/vending_top_netlist.v \
	      $(SYNTH_DIR)/vending_top_netlist_grouped.v \
	      $(SYNTH_DIR)/vending_top_netlist_ungrouped.v
	rm -f default.svf
	mkdir -p fm/reports/no_autoungroup fm/reports/autoungroup
	touch fm/reports/no_autoungroup/.gitkeep fm/reports/autoungroup/.gitkeep

.PHONY: formal_synth_no_autoungroup formal_synth_autoungroup formal_synth \
        formal_no_autoungroup formal_autoungroup formal_verify formal \
        formal_mk_scripts clean_formal
