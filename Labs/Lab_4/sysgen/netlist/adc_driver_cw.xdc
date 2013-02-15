

# Global period constraint
create_clock -name clk -period 10.0 [get_ports clk]

# ce_2_365eec2f_group and inner group constraint
set_property DONT_TOUCH true [get_nets ce_2_sg_x0]
set enCellsFrom [get_cells -of [get_pins -leaf -filter is_enable -of [get_nets ce_2_sg_x0]]]
set enCellsTo [get_cells -of [get_pins -leaf -filter is_enable -of [get_nets ce_2_sg_x0]]]
set_multicycle_path -from $enCellsFrom -to $enCellsTo -setup 2
set_multicycle_path -from $enCellsFrom -to $enCellsTo -hold 1

