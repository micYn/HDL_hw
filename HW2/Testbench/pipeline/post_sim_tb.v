`timescale 1ns/1ps
module post_sim_tb_pipe;
    reg[7:0] A,B,C;
    reg S,CLK,RESET;
    wire[15:0] RESULT;
    reg[15:0] EXPECTED_ANS;
    integer i,file,seed,tmp,zerocount;

    hw2_pipe hw2_pipe_ins(.a(A),.b(B),.c(C),.s(S),.clk(CLK),.reset(RESET),.second_stage_result(RESULT));

    initial $sdf_annotate("/home/B103040009_HDL/HW2/gate_level/Pipeline/delay/hw2_pipe.sdf",hw2_pipe_ins);



    initial begin : monitor
        $monitor("------RESET=%d CLK=%d | A=%d B=%d C=%d S=%d Got=%d # Expected=%d",RESET,CLK,A,B,C,S,RESULT,EXPECTED_ANS);
    end
    initial begin : clock
        CLK = 1'b0;
        RESET = 1'b0;
        forever begin
            #5 CLK = ~CLK;
        end
        
    end
    initial begin : reset
        #504 RESET = 1'b1;
        #500 RESET = 1'b0;
        #254 RESET = 1'b1;
        #50 RESET = 1'b0;
    end
    initial begin : random_tests
        // zerocount = 0;
        // seed = $time;
        file = $fopen("/home/B103040009_HDL/HW2/pre_sim/test_inputs_pipe.txt","r");
        for(i=0;i<200;i=i+1) begin

            $fscanf(file, "%d %d %d %d\n", A,B,C,S);

            if(RESET==1)
                EXPECTED_ANS = 0;
            else if(S==0)
                EXPECTED_ANS = C*(A-B);
            else
                EXPECTED_ANS = C*(A+B);
            #20;
        end
        // $display("# of C==0 : %d\n",zerocount);
        $finish;
        $fclose(file);
    end
endmodule