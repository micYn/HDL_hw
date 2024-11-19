`timescale 1ns/1ps
module post_sim_tb_nonpipe;
    reg[7:0] A,B,C;
    reg S;
    wire[15:0] RESULT;
    reg[15:0] EXPECTED_ANS;
    integer i,file,seed,tmp,zerocount;

    hw2_nonpipe hw2_nonpipe_ins(.a(A),.b(B),.c(C),.s(S),.result(RESULT));

    initial $sdf_annotate("/home/B103040009_HDL/HW2/gate_level/Non_pipeline/delay/hw2_nonpipe.sdf",hw2_nonpipe_ins);



    initial begin : monitor
        $monitor($time, "------A=%d B=%d C=%d S=%d Got=%d # Expected=%d",A,B,C,S,RESULT,EXPECTED_ANS);
    end
    initial begin : random_tests
        // zerocount = 0;
        // seed = $time;
        file = $fopen("/home/B103040009_HDL/HW2/pre_sim/test_inputs_nonpipe.txt","r");
        for(i=0;i<200;i=i+1) begin

            $fscanf(file, "%d %d %d %d\n", A,B,C,S);

            if(S==0)
                EXPECTED_ANS = C*(A-B);
            else
                EXPECTED_ANS = C*(A+B);
            #10;
        end
        // $display("# of C==0 : %d\n",zerocount);
        $finish;
        $fclose(file);
    end
endmodule