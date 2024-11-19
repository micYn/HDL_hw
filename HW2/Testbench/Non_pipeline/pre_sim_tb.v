`timescale 1ns/1ps
module pre_sim_tb_nonpipe;
    reg[7:0] A,B,C;
    reg S;
    wire[15:0] RESULT;
    reg[15:0] EXPECTED_ANS;
    integer i,file,seed,tmp,zerocount;

    hw2_nonpipe hw2_nonpipe_ins(.a(A),.b(B),.c(C),.s(S),.result(RESULT));
    initial begin : monitor
        $monitor($time, "------A=%d B=%d C=%d S=%d Got=%d # Expected=%d",A,B,C,S,RESULT,EXPECTED_ANS);
    end
    initial begin : random_tests
        zerocount = 0;
        seed = $time;
        file = $fopen("../test_inputs_nonpipe.txt","w");
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
            else if(zerocount>=100)     //But if there is already enough zeros, generate a non zero
                C = ($random(seed) % 64 + 64) % 64 + 1;
            else begin      //probability of 2/3 that C will be zero
                zerocount = zerocount+1;
                C = 0;
            end

            $fwrite(file, "%d %d %d %d\n", A,B,C,S);

            if(S==0)
                EXPECTED_ANS = C*(A-B);
            else
                EXPECTED_ANS = C*(A+B);
            #10;
        end
        $display("# of C==0 : %d\n",zerocount);
        $finish;
        $fclose(file);
    end
endmodule