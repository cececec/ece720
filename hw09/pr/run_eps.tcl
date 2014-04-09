###################################################
#
# run_eps.tcl
#
# 4/17/2012 Rhett Davis (rhett_davis@ncsu.edu)
#
#####################################################

source setup.tcl
set begintime [clock seconds]

read_design -physical_data ${modname}_routed.enc
read_spef ${modname}_routed.spef
set_power_analysis_mode -method static -create_binary_db true -write_static_currents true
if ![file exists waves.tcf] {
  read_activity_file -format VCD -vcd_scope cortexm0ds_tb/u_cortexm0ds ../v/sim/waves.vcd
  write_tcf waves.tcf
} else {
  read_activity_file -format TCF -vcd_scope cortexm0ds_tb/u_cortexm0ds waves.tcf
}
set_power_output_dir static_power_max
report_power -outfile design.rpt

if ![file exists fast_allcells.cl] {
  set_power_library_mode -accuracy fast -celltype allcells -extraction_tech_file /afs/eos.ncsu.edu/lockers/research/ece/wdavis/tech/FreePDK45/ncsu_basekit/techfile/qrc/qrc.tch -lef_layermap lefdef.layermap -generic_power_names {VDD 0.95} -generic_ground_names VSS -input_type pr_lef
  characterize_power_library -filler_cells FILL* -defaultcap 0.100
}

set_rail_analysis_mode -method static -power_switch_eco false -accuracy fast -power_grid_library fast_allcells.cl -vsrc_search_distance 50 -report_via_current_direction false
set_pg_nets -net VDD -voltage 0.95 -threshold 0.855 -tolerance 0.3
set_pg_nets -net VSS -voltage 0 -threshold 0.095 -tolerance 0.3
set_rail_analysis_domain -name PDCore -pwrnets VDD -gndnets VSS
set_power_data -reset
set_power_data -format current -scale 1 {static_power_max/static_VDD.ptiavg static_power_max/static_VSS.ptiavg}

set_power_pads -reset
set_power_pads -net VSS -format xy -file VSS.ppl
set_power_pads -net VDD -format xy -file VDD.ppl
set_net_group -reset
set_advanced_rail_options -reset
analyze_rail -type domain -results_directory ./ PDCore

set endtime [clock seconds]
set timestr [timef [expr $endtime-$begintime]]
puts "run_eps.tcl completed successfully (elapsed time: $timestr actual)"
exit
