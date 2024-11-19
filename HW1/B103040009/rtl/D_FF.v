module D_FF(q,  d,clk);
    output reg q;
    input wire d,clk;
    always @ (posedge clk)
        q <= d;
endmodule