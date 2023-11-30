
create_clock -period 10.000 -name sys_clock_pin -waveform {0.000 5.000} -add [get_ports clock]
set_property PACKAGE_PIN Y9 [get_ports clock]


set_property PACKAGE_PIN Y21 [get_ports {blue[0]}]
set_property PACKAGE_PIN Y20 [get_ports {blue[1]}]
set_property PACKAGE_PIN AB20 [get_ports {blue[2]}]
set_property PACKAGE_PIN AB19 [get_ports {blue[3]}]
set_property PACKAGE_PIN AB22 [get_ports {green[0]}]
set_property PACKAGE_PIN AA22 [get_ports {green[1]}]
set_property PACKAGE_PIN AB21 [get_ports {green[2]}]
set_property PACKAGE_PIN AA21 [get_ports {green[3]}]
set_property PACKAGE_PIN AA19 [get_ports hsync]
set_property PACKAGE_PIN V20 [get_ports {red[0]}]
set_property PACKAGE_PIN U20 [get_ports {red[1]}]
set_property PACKAGE_PIN V19 [get_ports {red[2]}]
set_property PACKAGE_PIN V18 [get_ports {red[3]}]
set_property PACKAGE_PIN Y19 [get_ports vsync]



set_property IOSTANDARD LVCMOS33 [get_ports {blue[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports hsync]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports vsync]

set_property PACKAGE_PIN F22 [get_ports reset]



set_property IOSTANDARD LVCMOS33 [get_ports {sel[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sel[0]}]
set_property PACKAGE_PIN H22 [get_ports {sel[1]}]
set_property PACKAGE_PIN G22 [get_ports {sel[0]}]


#PR region constraints

create_pblock pblock_im1
add_cells_to_pblock [get_pblocks pblock_im1] [get_cells -quiet [list im1]]
resize_pblock [get_pblocks pblock_im1] -add {SLICE_X54Y103:SLICE_X111Y147}
resize_pblock [get_pblocks pblock_im1] -add {DSP48_X3Y42:DSP48_X4Y57}
resize_pblock [get_pblocks pblock_im1] -add {RAMB18_X4Y42:RAMB18_X5Y57}
resize_pblock [get_pblocks pblock_im1] -add {RAMB36_X4Y21:RAMB36_X5Y28}
set_property RESET_AFTER_RECONFIG true [get_pblocks pblock_im1]
set_property SNAPPING_MODE ON [get_pblocks pblock_im1]
create_pblock pblock_im2
add_cells_to_pblock [get_pblocks pblock_im2] [get_cells -quiet [list im2]]
resize_pblock [get_pblocks pblock_im2] -add {SLICE_X52Y54:SLICE_X113Y97}
resize_pblock [get_pblocks pblock_im2] -add {DSP48_X3Y22:DSP48_X4Y37}
resize_pblock [get_pblocks pblock_im2] -add {RAMB18_X3Y22:RAMB18_X5Y37}
resize_pblock [get_pblocks pblock_im2] -add {RAMB36_X3Y11:RAMB36_X5Y18}
set_property RESET_AFTER_RECONFIG true [get_pblocks pblock_im2]
set_property SNAPPING_MODE ON [get_pblocks pblock_im2]
create_pblock pblock_im3
add_cells_to_pblock [get_pblocks pblock_im3] [get_cells -quiet [list im3]]
resize_pblock [get_pblocks pblock_im3] -add {SLICE_X54Y3:SLICE_X113Y47}
resize_pblock [get_pblocks pblock_im3] -add {DSP48_X3Y2:DSP48_X4Y17}
resize_pblock [get_pblocks pblock_im3] -add {RAMB18_X4Y2:RAMB18_X5Y17}
resize_pblock [get_pblocks pblock_im3] -add {RAMB36_X4Y1:RAMB36_X5Y8}
set_property RESET_AFTER_RECONFIG true [get_pblocks pblock_im3]
set_property SNAPPING_MODE ON [get_pblocks pblock_im3]
