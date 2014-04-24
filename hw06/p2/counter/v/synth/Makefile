
MODNAME = counter
RTL_DIR = ../src/rtl
GATE_DIR = ../src/gate

$(GATE_DIR)/$(MODNAME)_final.v: $(RTL_DIR)/$(MODNAME).v
	tcsh -c "add synopsys2013 ; \
	dc_shell-t -f run_synth.tcl |& tee run_synth.log"

clean:
	-rm default.svf
	-rm fixed_names_init
	-rm $(MODNAME)_init.v
	-rm $(GATE_DIR)/$(MODNAME)_final.v
	-rm *.log
	-rm *.sdf
	-rm *.rpt
