read_liberty $::env(LIB_FILE)
read_verilog /work/digitalclk_sky130.v
link_design digitalclk
read_sdc /work/digitalclk.sdc

puts "\n===== DESIGN CHECK ====="
check_setup

puts "\n===== WNS: WORST MAXIMUM SLACK ====="
report_worst_slack -max

puts "\n===== TNS: TOTAL NEGATIVE MAXIMUM SLACK ====="
report_tns -max

puts "\n===== WORST MINIMUM SLACK ====="
report_worst_slack -min

puts "\n===== TNS: TOTAL NEGATIVE MINIMUM SLACK ====="
report_tns -min
