puts "getting in indelay.tcl..."
set_input_delay 0.319640 -clock $clkname [get_port HRDATA] 
set_input_delay 0.459692 -clock $clkname [get_port HREADY] 
set_input_delay 0.336361 -clock $clkname [get_port HRESP] 
puts "leaving indelay.tcl..."
