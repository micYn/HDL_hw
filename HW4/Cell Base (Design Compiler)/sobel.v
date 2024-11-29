module line_buffer(buf_out_0,buf_out_1,buf_out_2,buf_out_3,buf_out_4,buf_out_5,buf_out_6,buf_out_7,buf_out_8, enable, Y, clk, rst);
    output wire[19:0] buf_out_0,buf_out_1,buf_out_2,buf_out_3,buf_out_4,buf_out_5,buf_out_6,buf_out_7,buf_out_8;
    output wire enable;
    input wire[19:0] Y;
    input wire clk, rst;

    reg[19:0] out;     // simply abandoned
    reg[19:0] x[0:966]; // 967 shift registers:  0   1   2    ...  480 481
                        //                       482 483 484  ...  962 963
                        //                       964 965 966
    integer i;
    integer counter_first_967;    // For the first 967 shifts, we do not do anything. During this period we set 'enable_enable' to 0, which will make 'enable' 0.
    integer counter_silding_window;   // For windows that are split by rows, we do not use the content in the window. We'll set 'enable' to 0.
    reg enable_enable;
    
    always @ (posedge clk or posedge rst) begin 
        if (rst) begin
            out <= 20'b0;
            counter_first_967 <= 0;
            counter_silding_window <= 0;
            enable_enable <= 1'b0;
            for (i = 0; i <= 966; i = i + 1) begin
                x[i] <= 20'b0;
            end
        end else begin
            if(counter_first_967 < 967) begin
                enable_enable <= 0;
                counter_first_967 <= counter_first_967 + 1;
            end
            else if(counter_first_967 == 967) begin
                enable_enable <= 1;
                counter_first_967 <= counter_first_967 + 1;
            end
            else begin
                counter_silding_window <= (counter_silding_window==481) ? 0 : counter_silding_window+1;
            end
            // {out, x[0:966]} <= {x[0:966], Y};
            x[966] <= Y;
            for (i = 966; i > 0; i = i - 1) begin
                x[i-1] <= x[i];
            end
            out <= x[0];

        end
    end
    
    assign enable = (enable_enable==1) ? ~(counter_silding_window==480 | counter_silding_window==481) : 0;

    assign buf_out_0 = x[0];
    assign buf_out_1 = x[1];
    assign buf_out_2 = x[2];
    assign buf_out_3 = x[482];
    assign buf_out_4 = x[483];
    assign buf_out_5 = x[484];
    assign buf_out_6 = x[964];
    assign buf_out_7 = x[965];
    assign buf_out_8 = x[966];

endmodule
module sobel(out_x, out_y, enable, R, G, B, clk, rst);
    output wire[7:0] out_x, out_y;
    output wire enable;
    input wire[7:0] R;
    input wire[7:0] G;
    input wire[7:0] B;
    input wire clk, rst;

    wire[19:0] Y;
    // assign Y = ((R >>> 2) + (R >>> 5)) * R +
    //            ((G >>> 1) + (G >>> 4)) * G +
    //            ((B >>> 3) - (B >>> 6)) * B;
    // assign Y = 0.299 * R +
    //            0.587 * G +
    //            0.114 * B;
    assign Y = (306 * R + 601 * G + 117 * B) >> 10;
    
    wire[19:0] buf_out_0,buf_out_1,buf_out_2,buf_out_3,buf_out_4,buf_out_5,buf_out_6,buf_out_7,buf_out_8;
    line_buffer line_buf_ins(buf_out_0,buf_out_1,buf_out_2,buf_out_3,buf_out_4,buf_out_5,buf_out_6,buf_out_7,buf_out_8, enable, Y, clk, rst);
    
    assign out_x = (-1*buf_out_0 + buf_out_2 - buf_out_3 - buf_out_3 + buf_out_5 + buf_out_5 - buf_out_6 + buf_out_8 > 100) ? 255 : 0;
    assign out_y = (buf_out_0 + buf_out_1 + buf_out_1 + buf_out_2 - buf_out_6 - buf_out_7 - buf_out_7 - buf_out_8 > 100) ? 255 : 0;
    
endmodule