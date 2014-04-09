###################################################
#
# run_cts.tcl
#
# 3/28/2011 Rhett Davis (rhett_davis@ncsu.edu)
#
#####################################################

source setup.tcl
set begintime [clock seconds]

restoreDesign ./${modname}_placed.enc.dat $modname
loadTimingCon design.tc

optDesign -preCTS

# Load the Clock-Tree Specification file, if it exists
if [file exists clock.ctstch] {
    puts "Reading Clock-Tree Specification file: clock.ctstch"
    specifyClockTree -clkfile clock.ctstch
    ckSynthesis -rguide cts.rguide -report clock.ctsrpt
    saveClockNets -output clock.ctsntf
} else {
    puts "Clock-Tree Specification file (clock.ctstch) not found, saving template in (clock.tmpl)"
    puts "Suggest modifying clock.tmpl and saving as clock.ctstch"
    createClockTreeSpec -output clock.tmpl
}

# Optional: insert repeaters
insertRepeater -rule repeater.rule -minLenFix 0.95

setOptMode -holdTargetSlack $holdslack
optDesign -postCTS
optDesign -postCTS -hold

saveDesign ./${modname}_cts.enc

set endtime [clock seconds]
set timestr [timef [expr $endtime-$begintime]]
puts "run_cts.tcl completed successfully (elapsed time: $timestr actual)"
exit

