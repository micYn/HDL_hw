module D_FF_8 (
    input wire [7:0] d,
    input wire clk,
    input wire reset,
    output wire [7:0] q
);
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : ff_gen
            D_FF ff_inst (
                .d(d[i]), 
                .clk(clk), 
                .reset(reset), 
                .q(q[i])
            );
        end
    endgenerate
endmodule