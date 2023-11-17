# Vivado does not support old UCF syntax
# must use XDC syntax

set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [ get_ports { sign_mad[0] } ] ;
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [ get_ports { sign_mad[1] } ] ;
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [ get_ports { sign_mad[2] } ] ;
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [ get_ports { sign_mad[3] } ] ;
set_property -dict { PACKAGE_PIN V15 IOSTANDARD LVCMOS33 } [ get_ports { twos_comp[0] } ] ;
set_property -dict { PACKAGE_PIN V14 IOSTANDARD LVCMOS33 } [ get_ports { twos_comp[1] } ] ;
set_property -dict { PACKAGE_PIN V12 IOSTANDARD LVCMOS33 } [ get_ports { twos_comp[2] } ] ;
set_property -dict { PACKAGE_PIN V11 IOSTANDARD LVCMOS33 } [ get_ports { twos_comp[3] } ] ;
