## Generated SDC file "DE10_LITE_Golden_Top.sdc"

## Copyright (C) 2024  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition"

## DATE    "Fri Jan  3 17:52:36 2025"

##
## DEVICE  "10M50DAF484C6GES"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clock} -period 20.000 -waveform { 0.000 10.000 } [get_ports {MAX10_CLK1_50}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {div_clock} -source [get_ports {MAX10_CLK1_50}] -divide_by 2 -master_clock {clock} [get_registers {maze:game|clock_divider:div1|div_clk}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {KEY[0]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {KEY[1]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {SW[0]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {SW[1]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {SW[2]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {SW[3]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {SW[4]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {SW[5]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {SW[6]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {SW[7]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {SW[8]}]
set_input_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {SW[9]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX0[0]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX0[1]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX0[2]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX0[3]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX0[4]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX0[5]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX0[6]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX0[7]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX1[0]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX1[1]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX1[2]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX1[3]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX1[4]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX1[5]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX1[6]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX1[7]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX2[0]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX2[1]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX2[2]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX2[3]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX2[4]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX2[5]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX2[6]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX2[7]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX3[0]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX3[1]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX3[2]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX3[3]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX3[4]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX3[5]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX3[6]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX3[7]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX4[0]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX4[1]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX4[2]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX4[3]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX4[4]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX4[5]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX4[6]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX4[7]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX5[0]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX5[1]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX5[2]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX5[3]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX5[4]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX5[5]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX5[6]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {HEX5[7]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {LEDR[0]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {LEDR[1]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {LEDR[2]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {LEDR[3]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {LEDR[4]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {LEDR[5]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {LEDR[6]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {LEDR[7]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {LEDR[8]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {LEDR[9]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {VGA_B[0]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {VGA_B[1]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {VGA_B[2]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {VGA_B[3]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {VGA_G[0]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {VGA_G[1]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {VGA_G[2]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {VGA_G[3]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {VGA_HS}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {VGA_R[0]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {VGA_R[1]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {VGA_R[2]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {VGA_R[3]}]
set_output_delay -add_delay  -clock [get_clocks {clock}]  2.000 [get_ports {VGA_VS}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

set_false_path  -from  [get_clocks {clock}]  -to  [get_clocks {div_clock}]
set_false_path  -from  [get_clocks {div_clock}]  -to  [get_clocks {div_clock}]
set_false_path  -from  [get_clocks {div_clock}]  -to  [get_clocks {clock}]
set_false_path  -from  [get_clocks {clock}]  -to  [get_clocks {clock}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

