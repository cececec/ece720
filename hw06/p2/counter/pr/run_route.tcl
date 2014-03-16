###################################################
#
# run_route.tcl
#
# 3/28/2011 Rhett Davis (rhett_davis@ncsu.edu)
#
#####################################################

source setup.tcl
set begintime [clock seconds]

# Load the Clock-Tree Specification file, if it exists
if [file exists ./${modname}_cts.enc] {
    puts "Restoring design ./${modname}_cts.enc"
    restoreDesign ./${modname}_cts.enc.dat $modname
} else {
    puts "Restoring design ./${modname}_placed.enc"
    restoreDesign ./${modname}_placed.enc.dat $modname
}

# May want to run on-chip-variation checks eventually.
# These two lines from Russell Deans suggest how we might do that.
#set_analysis_view -hold {default_view_hold} -setup {default_view_setup}
#setAnalysisMode -cppr both -analysisType onChipVariation

# Route power nets
sroute -noBlockPins -noPadRings


addFiller -cell {FILLCELL_X32 FILLCELL_X16 FILLCELL_X8 FILLCELL_X4 FILLCELL_X2 FILLCELL_X1} -prefix FILL -fillBoundary

setNanoRouteMode -quiet -routeBottomRoutingLayer 0
setNanoRouteMode -quiet -routeTopRoutingLayer $topmetal
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail -wireOpt

setOptMode -holdTargetSlack $holdslack
optDesign -postRoute
optDesign -postRoute -hold

checkplace
checkroute



# Save SPEF value for analyzing effects of parasitics
setDesignMode -process 45
setQRCTechfile /afs/eos.ncsu.edu/lockers/research/ece/wdavis/tech/FreePDK45/ncsu_basekit/techfile/qrc/qrc.tch
# Extraction mode (use the first line for Encounter extraction and the 
# second for QRC extraction)
setExtractRCMode -engine postRoute -effortLevel low -assumeMetFill -coupled
#setExtractRCMode -effortLevel signoff -engine postRoute -coupled
extractRC

saveNetlist -excludeLeafCell ${modname}_routed.v
rcOut -spef ${modname}_routed.spef

setAnalysisMode -checkType setup -asyncChecks async -skew true -clockPropagation autoDetectClockTree
buildTimingGraph
setCteReport
timeDesign -reportonly -numPaths  10 -prefix ${modname}_postRoute
timeDesign -reportonly -hold -numPaths  10 -prefix ${modname}_postRoute


saveDesign ./${modname}_routed.enc

global dbgLefDefOutVersion
set dbgLefDefOutVersion 5.7
defOut -floorplan -unplaced -netlist -scanChain -routing -trialRoute ./${modname}_routed.def



set endtime [clock seconds]
set timestr [timef [expr $endtime-$begintime]]
puts "run_route.tcl completed successfully (elapsed time: $timestr actual)"
exit
