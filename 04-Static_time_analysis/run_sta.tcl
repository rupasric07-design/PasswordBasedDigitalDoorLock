read_liberty /libs/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog /work/digitalclk_sky130.v
link_design digitalclk
read_sdc /work/digitalclk.sdc

puts "\n===== DESIGN CHECK ====="
check_setup

puts "\n===== CRITICAL MAXIMUM-DELAY PATHS ====="
report_checks -path_delay max -format full_clock_expanded -fields {slew cap fanout input_pins} -group_path_count 5

puts "\n===== MINIMUM-DELAY PATHS ====="
report_checks -path_delay min -format full_clock_expanded -fields {slew cap fanout input_pins} -group_path_count 5

puts "\n===== WORST SLACK ====="
report_worst_slack -max
report_worst_slack -min
