#!/bin/tcsh

vcs -R -debug_access+all \
/home/B103040009_HDL/HW1/pre_sim/pre_sim_tb.v \
/home/B103040009_HDL/HW1/rtl/D_FF.v \
/home/B103040009_HDL/HW1/rtl/FA.v \
/home/B103040009_HDL/HW1/rtl/adder_structure.v \
/home/B103040009_HDL/HW1/rtl/adder_structure_reg.v \
/home/B103040009_HDL/HW1/rtl/adder_dataflow.v \
/home/B103040009_HDL/HW1/rtl/adder_dataflow_reg.v \
/home/B103040009_HDL/HW1/rtl/adder_behavior.v \
/home/B103040009_HDL/HW1/rtl/adder_behavior_reg.v \
+full64 \
+access+r +vcs+fsdbon +fsdb+mda +fsdbfile+6adder.fsdb +v2k