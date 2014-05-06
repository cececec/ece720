#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Mon May  5 20:07:08 2014                #
#                                                     #
#######################################################

#@(#)CDS: Encounter Power System v09.11-s082_1 (32bit) 03/08/2010 17:32 (Linux 2.6)
#@(#)CDS: CeltIC v09.11-s011_1 (32bit) 03/04/2010 09:23:40 (Linux 2.6.9-78.0.25.ELsmp)
#@(#)CDS: CTE 09.11-s015_1 (32bit) Mar  4 2010 03:21:19 (Linux 2.6.9-78.0.25.ELsmp)
#@(#)CDS: CPE v09.11-s023

read_design -physical_data cortex_soc_routed.enc
read_spef cortex_soc_routed.spef
set_power_analysis_mode -method static -create_binary_db true -write_static_currents true
read_activity_file -format TCF -vcd_scope cortexm0ds_tb/u_cortexm0ds waves.tcf
set_power_output_dir static_power_max
report_power -outfile design.rpt
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
exit
