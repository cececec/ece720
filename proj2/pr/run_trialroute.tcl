###################################################
#
# run_trialroute.tcl
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
    trialroute -maxRouteLayer $topmetal -guide cts.rguide
} else {
    puts "Restoring design ./${modname}_placed.enc"
    restoreDesign ./${modname}_placed.enc.dat $modname
    trialroute -maxRouteLayer $topmetal
}

# Save SPEF value for analyzing effects of parasitics
setExtractRCMode -engine preRoute -effortLevel medium -assumeMetFill
setDesignMode -process 45
extractRC

saveNetlist -excludeLeafCell ${modname}_trialrouted.v
rcOut -spef ${modname}_trialrouted.spef

setAnalysisMode -checkType setup -asyncChecks async -skew true -clockPropagation autoDetectClockTree
buildTimingGraph
setCteReport
timeDesign -reportonly -numPaths  10 -prefix ${modname}_postTrial


saveDesign ./${modname}_trialrouted.enc

set endtime [clock seconds]
set timestr [timef [expr $endtime-$begintime]]
puts "run_trialroute.tcl completed successfully (elapsed time: $timestr actual)"
exit
