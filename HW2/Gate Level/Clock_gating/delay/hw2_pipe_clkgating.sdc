###################################################################

# Created by write_sdc on Thu Oct 17 18:38:04 2024

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max ss0p72vm40c -max_library                         \
N16ADFP_StdCellss0p72vm40c_ccs\
                         -min ff0p88v125c -min_library                         \
N16ADFP_StdCellff0p88v125c_ccs
set_wire_load_mode top
set_wire_load_model -name ZeroWireload -library N16ADFP_StdCellss0p72vm40c_ccs
set_ideal_network [get_ports clk]
create_clock [get_ports clk]  -period 0.24  -waveform {0 0.12}
set_input_delay -clock clk  0  [get_ports {a[7]}]
set_input_delay -clock clk  0  [get_ports {a[6]}]
set_input_delay -clock clk  0  [get_ports {a[5]}]
set_input_delay -clock clk  0  [get_ports {a[4]}]
set_input_delay -clock clk  0  [get_ports {a[3]}]
set_input_delay -clock clk  0  [get_ports {a[2]}]
set_input_delay -clock clk  0  [get_ports {a[1]}]
set_input_delay -clock clk  0  [get_ports {a[0]}]
set_input_delay -clock clk  0  [get_ports {b[7]}]
set_input_delay -clock clk  0  [get_ports {b[6]}]
set_input_delay -clock clk  0  [get_ports {b[5]}]
set_input_delay -clock clk  0  [get_ports {b[4]}]
set_input_delay -clock clk  0  [get_ports {b[3]}]
set_input_delay -clock clk  0  [get_ports {b[2]}]
set_input_delay -clock clk  0  [get_ports {b[1]}]
set_input_delay -clock clk  0  [get_ports {b[0]}]
set_input_delay -clock clk  0  [get_ports {c[7]}]
set_input_delay -clock clk  0  [get_ports {c[6]}]
set_input_delay -clock clk  0  [get_ports {c[5]}]
set_input_delay -clock clk  0  [get_ports {c[4]}]
set_input_delay -clock clk  0  [get_ports {c[3]}]
set_input_delay -clock clk  0  [get_ports {c[2]}]
set_input_delay -clock clk  0  [get_ports {c[1]}]
set_input_delay -clock clk  0  [get_ports {c[0]}]
set_input_delay -clock clk  0  [get_ports s]
set_input_delay -clock clk  0  [get_ports reset]
set_output_delay -clock clk  0  [get_ports {second_stage_result[15]}]
set_output_delay -clock clk  0  [get_ports {second_stage_result[14]}]
set_output_delay -clock clk  0  [get_ports {second_stage_result[13]}]
set_output_delay -clock clk  0  [get_ports {second_stage_result[12]}]
set_output_delay -clock clk  0  [get_ports {second_stage_result[11]}]
set_output_delay -clock clk  0  [get_ports {second_stage_result[10]}]
set_output_delay -clock clk  0  [get_ports {second_stage_result[9]}]
set_output_delay -clock clk  0  [get_ports {second_stage_result[8]}]
set_output_delay -clock clk  0  [get_ports {second_stage_result[7]}]
set_output_delay -clock clk  0  [get_ports {second_stage_result[6]}]
set_output_delay -clock clk  0  [get_ports {second_stage_result[5]}]
set_output_delay -clock clk  0  [get_ports {second_stage_result[4]}]
set_output_delay -clock clk  0  [get_ports {second_stage_result[3]}]
set_output_delay -clock clk  0  [get_ports {second_stage_result[2]}]
set_output_delay -clock clk  0  [get_ports {second_stage_result[1]}]
set_output_delay -clock clk  0  [get_ports {second_stage_result[0]}]
