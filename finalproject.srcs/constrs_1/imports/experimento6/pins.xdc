
## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Switches
set_property PACKAGE_PIN V17 [get_ports {COIN_IN[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {COIN_IN[0]}]
set_property PACKAGE_PIN V16 [get_ports {COIN_IN[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {COIN_IN[1]}]



## LEDs
set_property PACKAGE_PIN U16 [get_ports {return_nickel}]
	set_property IOSTANDARD LVCMOS33 [get_ports {return_nickel}]
set_property PACKAGE_PIN E19 [get_ports {drop_pop}]
	set_property IOSTANDARD LVCMOS33 [get_ports {drop_pop}]


##Buttons
set_property PACKAGE_PIN U18 [get_ports clr]
	set_property IOSTANDARD LVCMOS33 [get_ports clr]
set_property PACKAGE_PIN T18 [get_ports REFRI_RET]
	set_property IOSTANDARD LVCMOS33 [get_ports REFRI_RET]
set_property PACKAGE_PIN W19 [get_ports MOEDA_RET]
	set_property IOSTANDARD LVCMOS33 [get_ports MOEDA_RET]
set_property PACKAGE_PIN T17 [get_ports {MOEDA_ACK}]
	set_property IOSTANDARD LVCMOS33 [get_ports {MOEDA_ACK}]

##display
set_property PACKAGE_PIN W7 [get_ports {output_7seg[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {output_7seg[6]}]
set_property PACKAGE_PIN W6 [get_ports {output_7seg[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {output_7seg[5]}]
set_property PACKAGE_PIN U8 [get_ports {output_7seg[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {output_7seg[4]}]
set_property PACKAGE_PIN V8 [get_ports {output_7seg[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {output_7seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {output_7seg[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {output_7seg[2]}]
set_property PACKAGE_PIN V5 [get_ports {output_7seg[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {output_7seg[1]}]
set_property PACKAGE_PIN U7 [get_ports {output_7seg[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {output_7seg[0]}]
	
set_property PACKAGE_PIN U2 [get_ports {output_an[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {output_an[0]}]
set_property PACKAGE_PIN U4 [get_ports {output_an[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {output_an[1]}]
set_property PACKAGE_PIN V4 [get_ports {output_an[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {output_an[2]}]
set_property PACKAGE_PIN W4 [get_ports {output_an[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {output_an[3]}]