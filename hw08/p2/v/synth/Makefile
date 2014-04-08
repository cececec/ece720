
MODNAME = i_ahb_DW_ahb
#MODNAME = CORTEXM0DS
RTL_DIR = ../src/rtl
GATE_DIR = ../src/gate
PR_DIR = ../../pr

$(GATE_DIR)/$(MODNAME)_final.v: $(RTL_DIR)/$(MODNAME).v
	tcsh -c "add synopsys2013 ; \
	dc_shell-t -f run_synth.tcl |& tee run_synth.log"

.PHONY: pt ptsi

pt:
	tcsh -c "add synopsys2013 ; \
	pt_shell -f run_pt.tcl |& tee run_pt.log"

ptsi:
	tcsh -c "add synopsys2013 ; \
	pt_shell -f run_ptsi.tcl |& tee run_ptsi.log"

ptpx:
	tcsh -c "add synopsys2013 ; \
	pt_shell -f run_ptpx.tcl |& tee run_ptpx.log"


clean:
	-rm default.svf
	-rm fixed_names_init
	-rm $(MODNAME)_init.v
	-rm $(GATE_DIR)/$(MODNAME)_final.v
	-rm *.log
	-rm *.sdf
	-rm *.rpt
