`timescale 1ns/1ps
module pre_sim_tb_clock_gating;
    reg[7:0] A,B,C;
    reg S;
    reg CLK,RESET;
    wire[15:0] RESULT;
    reg[15:0] EXPECTED_ANS;
    integer i,file,seed,tmp,zerocount;

    hw2_pipe_clkgating hw2_pipe_clkgating_ins(.a(A),.b(B),.c(C),.s(S),.clk(CLK),.reset(RESET),.second_stage_result(RESULT));
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
        zerocount = 0;
        seed = $time;
        file = $fopen("../test_inputs_clock_gating.txt","w");
        for(i=0;i<200;i=i+1) begin

            A=($random(seed) % 64 + 64) % 64;
            S=($random(seed) % 2 + 2) % 2;
            if(S==0)
                B = ($random(seed) % A);
            else
                B=($random(seed) % 64 + 64) % 64;

            tmp = ($random(seed) % 3 + 3) % 3;
            if(tmp==2) begin    //probability of 1/3 that C will be a non zero number
                C = ($random(seed) % 64 + 64) % 64 + 1;
            end
            else if(zerocount>=100)     //But if there is already enough zeros(50%), generate a non zero
                C = ($random(seed) % 64 + 64) % 64 + 1;
            else begin      //probability of 2/3 that C will be zero
                zerocount = zerocount+1;
                C = 0;
            end

            $fwrite(file, "%d %d %d %d\n", A,B,C,S);

            if(RESET==1)
                EXPECTED_ANS = 0;
            else if(S==0)
                EXPECTED_ANS = C*(A-B);
            else
                EXPECTED_ANS = C*(A+B);
            #20;
        end
        $display("# of C==0 : %d\n",zerocount);
        $finish;
        $fclose(file);
    end
endmodule