create_clock -name clk -period 10.0 [get_ports clk]

set_input_delay 1.0 -clock clk [get_ports {enter password[0] password[1] password[2] password[3]}]
set_input_delay 1.0 -clock clk [get_ports rst]
set_output_delay 1.0 -clock clk [get_ports {unlock locked error}]

set_input_transition 0.1 [get_ports {rst enter password[0] password[1] password[2] password[3]}]

set_load 0.01 [get_ports {unlock locked error}]





