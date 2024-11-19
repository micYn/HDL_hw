#!/bin/tcsh

vcs -R -error=noMPD -debug_access+all \
/home/B103040009_HDL/HW1/post_sim/post_sim_tb.v \
/home/B103040009_HDL/HW1/gate_level/adder_behavior/time_opt/adder_behavior.v \
/home/B103040009_HDL/HW1/gate_level/adder_behavior_reg/time_opt/adder_behavior_reg.v \
/home/B103040009_HDL/HW1/gate_level/adder_dataflow/time_opt/adder_dataflow.v \
/home/B103040009_HDL/HW1/gate_level/adder_dataflow_reg/time_opt/adder_dataflow_reg.v \
/home/B103040009_HDL/HW1/gate_level/adder_structure/time_opt/adder_structure.v \
/home/B103040009_HDL/HW1/gate_level/adder_structure_reg/time_opt/adder_structure_reg.v \
/cad/CBDK/ADFP/Executable_Package/Collaterals/IP/stdcell/N16ADFP_StdCell/VERILOG/N16ADFP_StdCell.v \
+full64 \
+access+r +vcs+fsdbon +fsdb+mda +fsdbfile+6adder.fsdb +neg_tchk