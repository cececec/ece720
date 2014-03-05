Cadence Encounter Place & Route Tutorial #1
(c) 3/28/2011 W. Rhett Davis (rhett_davis@ncsu.edu)
updated 3/11/2012, 3/13/2013, 3/5/2014

This tutorial introduces place & route (physical design)
with Cadence Encounter at NC State University.  It is assumed that you
already know how to synthesize standard-cell netlists with Synopsys
Design Compiler.

1) Log in to a Linux Lab Machine

2) Synthesize the netlist file

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


