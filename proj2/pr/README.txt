Cadence Encounter Place & Route Tutorial #2
(c) 4/26/2011 W. Rhett Davis (rhett_davis@ncsu.edu)
updated 4/18/2012, 4/8/2013, 3/28/2014

This tutorial introduces clock-tree synthesis and repeater insertion
with Cadence Encounter and Synopsys PrimeTime at NC State University.
It also includes the files necessary to run Signal Integrity and Power
Estimation using Synopsys PrimeTime-SI, PrimeTime-PX and Mentor
Graphics Questa/Modelsim.  It is assumed that you have already worked
through Place & Route Tutorial #1 and know how to perform the
base-line physical design flow.

1) Log in to a Linux Lab Machine

2) Synthesize the netlist file

(copy the v/sim and v/src/rtl direcotries from the cortexmods.tar.gz
distribution into this directory tree)
cd v/synth
make

Ensure that the file .synopsys_dc.setup exists in this directory,
or the target will not be made successfully.

3) Place & Route the design 

When modifying this tutorial for another design, remember that you
will probably need to make the following changes:
 design.conf - ui_netlist & ui_topcell
 design.tc - timing constraint
 setup.tcl - modname & topmetal
 Makefile - MODNAME

Use the following commands to run through the complete tutorial.
Refer to the pr_tut1.pdf file for a more detailed explanation.

cd ../../pr
make cts
cp clock.tmpl clock.ctstch
make trialroute
make route

Note that each of the targets listed above creates a log file called
run_[target].log.  Look in these files for more information.

If execution fails on any one target, you will likely need to manually
enter the command "exit" followed by return.  Then you should be able to 
examine the log file to debug the problem.

Finally, note the dependencies for each target, as defined in the Makefile:
- init: depends on verilog netlist, design.conf and design.tc files
- place: depends on init target, and the optional io.place file, if it exists.
    Making this target without io.place will cause IO pins/cells to be placed
    randomly, with the result saved in io.tmpl.  Copy this file to io.place
    and re-make the target to use pre-defined IO locaitons. 
- cts: depends on place target, and the optional clock.ctstch file, if it 
    exists.  Making this target without clock.ctstch will skip clock-tree
    synthesis and dump a file called clock.tmpl.  Copy this file to
    clock.ctstch and re-make the target to synthesize a clock-tree.
- trialroute: depends on place target, and optionally the cts target, if it
    exists.  Making this target will skip cts, unless it is run explicitly
- route: depends on place target, and optionally the cts target, if it
    exists.  Making this target will skip cts, unless it is run explicitly

4) Verify the Timing

When modifying this tutorial for another design, remember that you
will probably need to modify the parameters at the beginning of 
the files run_pt.tcl, run_ptsi.tcl, and Makefile.

make pt
make ptsi

5) Optimize the design

See notes in the accompanying PDF file

6) Capture the Swithcing Activity

Open a new shell window, and set up the environment with these commands:
    cd v/sim
    source setup.csh
Make the following changes to the code:
  - tb.v file: add the following lines:
      initial begin
        $dumpfile("waves.vcd");
        $dumpvars;
      end
  - Makefile: Add the variable $(STDCELLSRC) to all "vlog" commands 
      and define the variable as follows (all on one line):

STDCELLSRC  = /afs/eos.ncsu.edu/lockers/research/ece/wdavis/tech/nangate/NangateOpenCellLibrary_PDKv1_2_v2008_10/verilog/NangateOpenCellLibrary_PDKv1_2_v2008_10_typical_conditional.v

(the following line creates a "waves.vcd" file that is about 55 MB)
make sim

7) Estimate the power

When modifying this tutorial for another design, remember that you
will probably need to modify the parameters at the beginning of the
run_ptpx.tcl file.  You will likely also need to modify the -instance
argument to vcd2saif command and that strip_path argument to the
read_saif command (in run_ptpx.tcl) to match the hierarchical instance
name of the simulated module.

from your original shell window, which has the PrimeTime environment,
change to the v/sim directory and execute the following command:
(creates a "waves.saif" file that is about 630 KB)

vcd2saif -input waves.vcd -instance cortexm0ds_tb/u_cortexm0ds -output waves.saif

Next, change back to the v/synth directory and estimate the power with
the following command:

make ptpx

8) Analyze the Power and Ground Rails

When modifying this tutorial for another design, remember that you
will probably need to make the follwoing changes to files in the pr directory:
 VDD.ppl - power-pad location file for VDD rail
 VSS.ppl - power-pad location file for VSS rail

Use the following command to analyze the power rails:  

make eps

Simple reports of the results will be in the files 
PDCore_25C_avg_1/VDD/results and PDCore_25C_avg_1/VSS/results.


