# Vivado does not support old UCF syntax
# must use XDC syntax


set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 }   [ get_ports { carry_in }       ] ;
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 }   [ get_ports { input1 }    ] ;
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 }   [ get_ports { input2 }  ] ;
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 }   [ get_ports { carry_out }    ] ;
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 }   [ get_ports { sum_out }    ] ;
