`timescale 1ns/1ps
module post_sim_tb;
    parameter width = 32;

    //Inputs:
    reg[width-1:0] A,B;
    reg C_IN;
    //--//
    reg CLK;

    //Outputs:
    wire[width:0] CO_S_STRUCTURE;
    wire[width:0] CO_S_DATAFLOW;
    wire[width:0] CO_S_BEHAVIORAL;
    //--//
    wire[width:0] Q_STRUCTURE;
    wire [width:0] Q_DATAFLOW;
    wire[width:0] Q_BEHAVIORAL;

    //Expected answer:
    reg [width:0] EXPECTED_ANS;

    integer i,file;

    adder_behavior behavior(CO_S_BEHAVIORAL, A,B,C_IN);
    adder_behavior_reg behavior_reg(Q_BEHAVIORAL, A,B,C_IN,CLK);
    adder_dataflow dataflow(CO_S_DATAFLOW, A,B,C_IN);
    adder_dataflow_reg dataflow_reg(Q_DATAFLOW, A,B,C_IN,CLK);
    adder_structure structure(CO_S_STRUCTURE, A,B,C_IN);
    adder_structure_reg structure_reg(Q_STRUCTURE, A,B,C_IN,CLK);

    initial $sdf_annotate("/home/B103040009_HDL/HW1/gate_level/adder_behavior/time_opt/adder_behavior.sdf",behavior);
    initial $sdf_annotate("/home/B103040009_HDL/HW1/gate_level/adder_behavior_reg/time_opt/adder_behavior_reg.sdf",behavior_reg);
    initial $sdf_annotate("/home/B103040009_HDL/HW1/gate_level/adder_dataflow/time_opt/adder_dataflow.sdf",dataflow);
    initial $sdf_annotate("/home/B103040009_HDL/HW1/gate_level/adder_dataflow_reg/time_opt/adder_dataflow_reg.sdf",dataflow_reg);
    initial $sdf_annotate("/home/B103040009_HDL/HW1/gate_level/adder_structure/time_opt/adder_structure.sdf",structure);
    initial $sdf_annotate("/home/B103040009_HDL/HW1/gate_level/adder_structure_reg/time_opt/adder_structure_reg.sdf",structure_reg);

    initial begin : my_monitor
        $monitor($time, "------CO_S_STRUCTURE=%3d,CO_S_DATAFLOW=%3d,CO_S_BEHAVIORAL=%3d | Q_STRUCTURE=%3d,Q_DATAFLOW=%3d,Q_BEHAVIORAL=%3d # Expected=%3d",CO_S_STRUCTURE,CO_S_DATAFLOW,CO_S_BEHAVIORAL,Q_STRUCTURE,Q_DATAFLOW,Q_BEHAVIORAL,EXPECTED_ANS);
    end

    initial begin : my_clock
        CLK = 1'b0;
        forever #5 CLK = ~CLK;
    end

    initial begin : my_random_tests
        file = $fopen("../test_inputs.txt", "r");

        for (i = 0; i < 10; i = i + 1) begin
            $fscanf(file, "%d %d %d\n", A, B, C_IN);

            EXPECTED_ANS = A+B+C_IN; 
            #50;
        end
        $finish;
        
        $fclose(file);
    end
endmodule