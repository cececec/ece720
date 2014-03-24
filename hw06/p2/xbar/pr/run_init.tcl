###################################################
#
# run_init.tcl
#
# 3/28/2011 Rhett Davis (rhett_davis@ncsu.edu)
#
#####################################################

source setup.tcl
set begintime [clock seconds]

# Load the Setup File
loadConfig design.conf
#commitConfig

# Create Initial Floorplan
#floorplan -s 10 10 40 40 40 40
floorplan -su 1.0 0.5 40 40 40 40

# Create Power structures

addRing -spacing_bottom 10 -width_left 10 -width_bottom 10 -width_top 10 -spacing_top 10 -layer_bottom metal5 -width_right 10 -around core -center 1 -layer_top metal5 -spacing_right 10 -spacing_left 10 -layer_right metal6 -layer_left metal6 -nets { VSS VDD }

addStripe  -set_to_set_distance 40 -spacing 5 -xleft_offset 20 -layer metal6 -width 5 -nets { VSS VDD }

setAnalysisMode -checkType setup -asyncChecks async -skew true -clockPropagation autoDetectClockTree
buildTimingGraph
setCteReport
timeDesign -prePlace -numPaths  10 -prefix ${modname}_prePlace


saveDesign ./${modname}_init.enc

set endtime [clock seconds]
set timestr [timef [expr $endtime-$begintime]]
puts "run_init.tcl completed successfully (elapsed time: $timestr actual)"
exit

