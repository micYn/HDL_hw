###################################################################

# Created by write_sdc on Fri Sep 27 16:16:28 2024

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max ss0p72vm40c -max_library                         \
N16ADFP_StdCellss0p72vm40c_ccs\
                         -min ff0p88v125c -min_library                         \
N16ADFP_StdCellff0p88v125c_ccs
set_wire_load_mode top
set_wire_load_model -name ZeroWireload -library N16ADFP_StdCellss0p72vm40c_ccs
set_max_area 0
create_clock -name clk  -period 0.086346  -waveform {0 0.043173}
set_max_delay 0.086346  -from [list [get_ports {a[31]}] [get_ports {a[30]}] [get_ports {a[29]}]       \
[get_ports {a[28]}] [get_ports {a[27]}] [get_ports {a[26]}] [get_ports         \
{a[25]}] [get_ports {a[24]}] [get_ports {a[23]}] [get_ports {a[22]}]           \
[get_ports {a[21]}] [get_ports {a[20]}] [get_ports {a[19]}] [get_ports         \
{a[18]}] [get_ports {a[17]}] [get_ports {a[16]}] [get_ports {a[15]}]           \
[get_ports {a[14]}] [get_ports {a[13]}] [get_ports {a[12]}] [get_ports         \
{a[11]}] [get_ports {a[10]}] [get_ports {a[9]}] [get_ports {a[8]}] [get_ports  \
{a[7]}] [get_ports {a[6]}] [get_ports {a[5]}] [get_ports {a[4]}] [get_ports    \
{a[3]}] [get_ports {a[2]}] [get_ports {a[1]}] [get_ports {a[0]}] [get_ports    \
{b[31]}] [get_ports {b[30]}] [get_ports {b[29]}] [get_ports {b[28]}]           \
[get_ports {b[27]}] [get_ports {b[26]}] [get_ports {b[25]}] [get_ports         \
{b[24]}] [get_ports {b[23]}] [get_ports {b[22]}] [get_ports {b[21]}]           \
[get_ports {b[20]}] [get_ports {b[19]}] [get_ports {b[18]}] [get_ports         \
{b[17]}] [get_ports {b[16]}] [get_ports {b[15]}] [get_ports {b[14]}]           \
[get_ports {b[13]}] [get_ports {b[12]}] [get_ports {b[11]}] [get_ports         \
{b[10]}] [get_ports {b[9]}] [get_ports {b[8]}] [get_ports {b[7]}] [get_ports   \
{b[6]}] [get_ports {b[5]}] [get_ports {b[4]}] [get_ports {b[3]}] [get_ports    \
{b[2]}] [get_ports {b[1]}] [get_ports {b[0]}] [get_ports ci]]  -to [list [get_ports {co_s[32]}] [get_ports {co_s[31]}] [get_ports            \
{co_s[30]}] [get_ports {co_s[29]}] [get_ports {co_s[28]}] [get_ports           \
{co_s[27]}] [get_ports {co_s[26]}] [get_ports {co_s[25]}] [get_ports           \
{co_s[24]}] [get_ports {co_s[23]}] [get_ports {co_s[22]}] [get_ports           \
{co_s[21]}] [get_ports {co_s[20]}] [get_ports {co_s[19]}] [get_ports           \
{co_s[18]}] [get_ports {co_s[17]}] [get_ports {co_s[16]}] [get_ports           \
{co_s[15]}] [get_ports {co_s[14]}] [get_ports {co_s[13]}] [get_ports           \
{co_s[12]}] [get_ports {co_s[11]}] [get_ports {co_s[10]}] [get_ports           \
{co_s[9]}] [get_ports {co_s[8]}] [get_ports {co_s[7]}] [get_ports {co_s[6]}]   \
[get_ports {co_s[5]}] [get_ports {co_s[4]}] [get_ports {co_s[3]}] [get_ports   \
{co_s[2]}] [get_ports {co_s[1]}] [get_ports {co_s[0]}]]
set_input_delay -clock clk  0  [get_ports {a[31]}]
set_input_delay -clock clk  0  [get_ports {a[30]}]
set_input_delay -clock clk  0  [get_ports {a[29]}]
set_input_delay -clock clk  0  [get_ports {a[28]}]
set_input_delay -clock clk  0  [get_ports {a[27]}]
set_input_delay -clock clk  0  [get_ports {a[26]}]
set_input_delay -clock clk  0  [get_ports {a[25]}]
set_input_delay -clock clk  0  [get_ports {a[24]}]
set_input_delay -clock clk  0  [get_ports {a[23]}]
set_input_delay -clock clk  0  [get_ports {a[22]}]
set_input_delay -clock clk  0  [get_ports {a[21]}]
set_input_delay -clock clk  0  [get_ports {a[20]}]
set_input_delay -clock clk  0  [get_ports {a[19]}]
set_input_delay -clock clk  0  [get_ports {a[18]}]
set_input_delay -clock clk  0  [get_ports {a[17]}]
set_input_delay -clock clk  0  [get_ports {a[16]}]
set_input_delay -clock clk  0  [get_ports {a[15]}]
set_input_delay -clock clk  0  [get_ports {a[14]}]
set_input_delay -clock clk  0  [get_ports {a[13]}]
set_input_delay -clock clk  0  [get_ports {a[12]}]
set_input_delay -clock clk  0  [get_ports {a[11]}]
set_input_delay -clock clk  0  [get_ports {a[10]}]
set_input_delay -clock clk  0  [get_ports {a[9]}]
set_input_delay -clock clk  0  [get_ports {a[8]}]
set_input_delay -clock clk  0  [get_ports {a[7]}]
set_input_delay -clock clk  0  [get_ports {a[6]}]
set_input_delay -clock clk  0  [get_ports {a[5]}]
set_input_delay -clock clk  0  [get_ports {a[4]}]
set_input_delay -clock clk  0  [get_ports {a[3]}]
set_input_delay -clock clk  0  [get_ports {a[2]}]
set_input_delay -clock clk  0  [get_ports {a[1]}]
set_input_delay -clock clk  0  [get_ports {a[0]}]
set_input_delay -clock clk  0  [get_ports {b[31]}]
set_input_delay -clock clk  0  [get_ports {b[30]}]
set_input_delay -clock clk  0  [get_ports {b[29]}]
set_input_delay -clock clk  0  [get_ports {b[28]}]
set_input_delay -clock clk  0  [get_ports {b[27]}]
set_input_delay -clock clk  0  [get_ports {b[26]}]
set_input_delay -clock clk  0  [get_ports {b[25]}]
set_input_delay -clock clk  0  [get_ports {b[24]}]
set_input_delay -clock clk  0  [get_ports {b[23]}]
set_input_delay -clock clk  0  [get_ports {b[22]}]
set_input_delay -clock clk  0  [get_ports {b[21]}]
set_input_delay -clock clk  0  [get_ports {b[20]}]
set_input_delay -clock clk  0  [get_ports {b[19]}]
set_input_delay -clock clk  0  [get_ports {b[18]}]
set_input_delay -clock clk  0  [get_ports {b[17]}]
set_input_delay -clock clk  0  [get_ports {b[16]}]
set_input_delay -clock clk  0  [get_ports {b[15]}]
set_input_delay -clock clk  0  [get_ports {b[14]}]
set_input_delay -clock clk  0  [get_ports {b[13]}]
set_input_delay -clock clk  0  [get_ports {b[12]}]
set_input_delay -clock clk  0  [get_ports {b[11]}]
set_input_delay -clock clk  0  [get_ports {b[10]}]
set_input_delay -clock clk  0  [get_ports {b[9]}]
set_input_delay -clock clk  0  [get_ports {b[8]}]
set_input_delay -clock clk  0  [get_ports {b[7]}]
set_input_delay -clock clk  0  [get_ports {b[6]}]
set_input_delay -clock clk  0  [get_ports {b[5]}]
set_input_delay -clock clk  0  [get_ports {b[4]}]
set_input_delay -clock clk  0  [get_ports {b[3]}]
set_input_delay -clock clk  0  [get_ports {b[2]}]
set_input_delay -clock clk  0  [get_ports {b[1]}]
set_input_delay -clock clk  0  [get_ports {b[0]}]
set_input_delay -clock clk  0  [get_ports ci]
set_output_delay -clock clk  0  [get_ports {co_s[32]}]
set_output_delay -clock clk  0  [get_ports {co_s[31]}]
set_output_delay -clock clk  0  [get_ports {co_s[30]}]
set_output_delay -clock clk  0  [get_ports {co_s[29]}]
set_output_delay -clock clk  0  [get_ports {co_s[28]}]
set_output_delay -clock clk  0  [get_ports {co_s[27]}]
set_output_delay -clock clk  0  [get_ports {co_s[26]}]
set_output_delay -clock clk  0  [get_ports {co_s[25]}]
set_output_delay -clock clk  0  [get_ports {co_s[24]}]
set_output_delay -clock clk  0  [get_ports {co_s[23]}]
set_output_delay -clock clk  0  [get_ports {co_s[22]}]
set_output_delay -clock clk  0  [get_ports {co_s[21]}]
set_output_delay -clock clk  0  [get_ports {co_s[20]}]
set_output_delay -clock clk  0  [get_ports {co_s[19]}]
set_output_delay -clock clk  0  [get_ports {co_s[18]}]
set_output_delay -clock clk  0  [get_ports {co_s[17]}]
set_output_delay -clock clk  0  [get_ports {co_s[16]}]
set_output_delay -clock clk  0  [get_ports {co_s[15]}]
set_output_delay -clock clk  0  [get_ports {co_s[14]}]
set_output_delay -clock clk  0  [get_ports {co_s[13]}]
set_output_delay -clock clk  0  [get_ports {co_s[12]}]
set_output_delay -clock clk  0  [get_ports {co_s[11]}]
set_output_delay -clock clk  0  [get_ports {co_s[10]}]
set_output_delay -clock clk  0  [get_ports {co_s[9]}]
set_output_delay -clock clk  0  [get_ports {co_s[8]}]
set_output_delay -clock clk  0  [get_ports {co_s[7]}]
set_output_delay -clock clk  0  [get_ports {co_s[6]}]
set_output_delay -clock clk  0  [get_ports {co_s[5]}]
set_output_delay -clock clk  0  [get_ports {co_s[4]}]
set_output_delay -clock clk  0  [get_ports {co_s[3]}]
set_output_delay -clock clk  0  [get_ports {co_s[2]}]
set_output_delay -clock clk  0  [get_ports {co_s[1]}]
set_output_delay -clock clk  0  [get_ports {co_s[0]}]
