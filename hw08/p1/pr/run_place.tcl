###################################################
#
# run_place.tcl
#
# 3/28/2011 Rhett Davis (rhett_davis@ncsu.edu)
#
#####################################################

source setup.tcl
set begintime [clock seconds]

restoreDesign ./${modname}_init.enc.dat $modname
loadTimingCon design.tc

# Load the IO Constraint file, if it exists
if [file exists io.place] {
    puts "Reading IO Constraint file: io.place"
    loadIoFile io.place
    set save_io 0
} else {
    puts "IO Constraint file (io.place) not found, saving template in (io.tmpl)"
    puts "Suggest modifying io.tmpl and saving as io.place"
    set save_io 1
}

# Place
placeDesign -prePlaceOpt

# Save the IO Constraint Template
if $save_io {
    saveIoFile io.tmpl
}

saveDesign ./${modname}_placed.enc

set endtime [clock seconds]
set timestr [timef [expr $endtime-$begintime]]
puts "run_place.tcl completed successfully (elapsed time: $timestr actual)"
exit

