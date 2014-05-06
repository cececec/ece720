# set variable "modname" to the name of topmost module in design
set modname cortex_soc

# set variable "topmetal" to the highest usable metal layer
set topmetal 8

# set variable "holdslack 0.15
set holdslack 0.15

# Define a helpful function for printing out time strings
proc timef {sec} {
  set hrs [expr $sec/3600]
  set sec [expr $sec-($hrs*3600)]
  set min [expr $sec/60]
  set sec [expr $sec-($min*60)]
  return "${hrs}h ${min}m ${sec}s"
}

