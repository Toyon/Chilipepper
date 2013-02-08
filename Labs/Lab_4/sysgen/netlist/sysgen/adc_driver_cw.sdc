
define_attribute {clk} syn_maxfan {1000000}
define_attribute {n:default_clock_driver.xlclockdriver_2.ce_vec*} syn_keep {true}
define_attribute {n:default_clock_driver.xlclockdriver_2.ce_vec*} max_fanout {"REDUCE"}

define_scope_collection ce_2_365eec2f_group \
  {find -seq * -in [ expand -hier -from {n:ce_2_sg_x0} ]}

define_multicycle_path -from {$ce_2_365eec2f_group} \
  -to {$ce_2_365eec2f_group} 2
