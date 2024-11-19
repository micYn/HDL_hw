`timescale 1ns/1ps
module pre_sim_tb;
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

    //6 adders:
    adder_structure add_struc(CO_S_STRUCTURE,   A,B,C_IN);
    adder_dataflow add_df(CO_S_DATAFLOW,    A,B,C_IN);
    adder_behavior add_behav(CO_S_BEHAVIORAL,   A,B,C_IN);
    //--//
    adder_structure_reg add_struc_reg(Q_STRUCTURE,    A,B,C_IN,CLK);
    adder_dataflow_reg add_df_reg(Q_DATAFLOW,    A,B,C_IN,CLK);
    adder_behavior_reg add_behav_reg(Q_BEHAVIORAL,   A,B,C_IN,CLK);

    //Expected answer:
    reg [width:0] EXPECTED_ANS;

    integer i,file,seed;

    initial begin : my_monitor
        $monitor($time, "------CO_S_STRUCTURE=%3d,CO_S_DATAFLOW=%3d,CO_S_BEHAVIORAL=%3d | Q_STRUCTURE=%3d,Q_DATAFLOW=%3d,Q_BEHAVIORAL=%3d # Expected=%3d",CO_S_STRUCTURE,CO_S_DATAFLOW,CO_S_BEHAVIORAL,Q_STRUCTURE,Q_DATAFLOW,Q_BEHAVIORAL,EXPECTED_ANS);
    end

    initial begin : my_clock
        CLK = 1'b0;
        forever #5 CLK = ~CLK;
    end

    initial begin : my_random_tests
    
        seed = $random;
        
        file = $fopen("../test_inputs.txt", "w");

        for (i = 0; i < 10; i = i + 1) begin
            
            A = ($random(seed) % 64 + 64) % 64;
            B = ($random(seed) % 64 + 64) % 64;
            C_IN = ($random(seed) % 2 + 2) % 2;

            $fwrite(file, "%d %d %d\n", A, B, C_IN);

            EXPECTED_ANS = A+B+C_IN; 
            #50;
        end
        $finish;
        
        $fclose(file);
    end
endmodule