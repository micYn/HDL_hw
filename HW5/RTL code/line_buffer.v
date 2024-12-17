module line_buffer(buf_out_0,buf_out_1,buf_out_2,buf_out_3,buf_out_4,buf_out_5,buf_out_6,buf_out_7,buf_out_8, enable, Y, clk, rst);
    output wire signed[8:0] buf_out_0,buf_out_1,buf_out_2,buf_out_3,buf_out_4,buf_out_5,buf_out_6,buf_out_7,buf_out_8;
    output wire enable;
    input  wire signed[8:0] Y;
    input wire clk, rst;

    reg signed[8:0] out;     // simply abandoned
    reg signed[8:0] x[0:454];  // 455 shift registers:  0   1   2    ...  224 225
                               //                       226 227 228  ...  450 451
                               //                       452 453 454
    integer i;
    integer counter_first_455;    // For the first 455 shifts, we do not do anything. During this period we set 'enable_enable' to 0, which will make 'enable' 0.
    integer counter_silding_window;   // For windows that are split by rows, we do not use the content in the window. We'll set 'enable' to 0.
    reg enable_enable;
    
    always @ (posedge clk or posedge rst) begin 
        if (rst) begin
            out <= 9'b0;
            counter_first_455 <= 0;
            counter_silding_window <= 0;
            enable_enable <= 1'b0;
            
            for (i = 0; i <= 454; i = i + 1) begin
                x[i] <= 9'b0;
            end
        end else begin
            if(counter_first_455 < 455) begin
                enable_enable <= 0;
                counter_first_455 <= counter_first_455 + 1;
            end
            else if(counter_first_455 == 455) begin
                enable_enable <= 1;
                counter_first_455 <= counter_first_455 + 1;
            end
            else begin
                counter_silding_window <= (counter_silding_window==225) ? 0 : counter_silding_window+1;
            end
            // {out, x[0:454]} <= {x[0:454], Y};
            x[454] <= Y;
            for (i = 454; i > 0; i = i - 1) begin
                x[i-1] <= x[i];
            end
            out <= x[0];

        end
    end
    
    assign enable = (enable_enable==1) ? ~(counter_silding_window==224 | counter_silding_window==225) : 0;

    assign buf_out_0 = x[0];
    assign buf_out_1 = x[1];
    assign buf_out_2 = x[2];
    assign buf_out_3 = x[226];
    assign buf_out_4 = x[227];
    assign buf_out_5 = x[228];
    assign buf_out_6 = x[452];
    assign buf_out_7 = x[453];
    assign buf_out_8 = x[454];

endmodule