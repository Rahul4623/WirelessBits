## ============================================================
## Boolean Board Constraint File -- UART Transmitter Design
## Top module ports: clk, sw[7:0], btn0 (reset), btn1 (transmit)
##                   TxD, TxD_debug, transmit_debug,
##                   button_debug, clk_debug
## ============================================================

## ------------------------------------------------------------
## Clock Signal -- 100 MHz onboard oscillator
## ------------------------------------------------------------
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]

## ------------------------------------------------------------
## Switches -- sw[7:0] carry the 8-bit data to be transmitted
## ------------------------------------------------------------
set_property PACKAGE_PIN V17 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]

set_property PACKAGE_PIN V16 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]

set_property PACKAGE_PIN W16 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]

set_property PACKAGE_PIN W17 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]

set_property PACKAGE_PIN W15 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]

set_property PACKAGE_PIN V15 [get_ports {sw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]

set_property PACKAGE_PIN W14 [get_ports {sw[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]

set_property PACKAGE_PIN W13 [get_ports {sw[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]

## ------------------------------------------------------------
## Buttons
##   btn0 -- reset
##   btn1 -- transmit trigger (debounced)
## ------------------------------------------------------------
set_property PACKAGE_PIN U18 [get_ports btn0]
set_property IOSTANDARD LVCMOS33 [get_ports btn0]

set_property PACKAGE_PIN T18 [get_ports btn1]
set_property IOSTANDARD LVCMOS33 [get_ports btn1]

## ------------------------------------------------------------
## USB-RS232 Interface -- TxD to PC via USB-UART bridge
##   Connect TxD here for Tera Term on PC
## ------------------------------------------------------------
set_property PACKAGE_PIN A18 [get_ports TxD]
set_property IOSTANDARD LVCMOS33 [get_ports TxD]

## ------------------------------------------------------------
## Pmod Header JA -- Debug signals
##   JA1 (pin J1) -- TxD_debug     : mirror of UART TxD line
##   JA2 (pin L2) -- transmit_debug: debounced transmit pulse
##   JA3 (pin J2) -- button_debug  : raw btn1 signal
##   JA4 (pin G2) -- clk_debug     : 100 MHz clock probe
## ------------------------------------------------------------
set_property PACKAGE_PIN J1 [get_ports TxD_debug]
set_property IOSTANDARD LVCMOS33 [get_ports TxD_debug]

set_property PACKAGE_PIN L2 [get_ports transmit_debug]
set_property IOSTANDARD LVCMOS33 [get_ports transmit_debug]

set_property PACKAGE_PIN J2 [get_ports button_debug]
set_property IOSTANDARD LVCMOS33 [get_ports button_debug]

set_property PACKAGE_PIN G2 [get_ports clk_debug]
set_property IOSTANDARD LVCMOS33 [get_ports clk_debug]

## ------------------------------------------------------------
## Bitstream / Configuration Properties
## ------------------------------------------------------------
set_property BITSTREAM.STARTUP.STARTUPCLK JTAGCLK [current_design]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
