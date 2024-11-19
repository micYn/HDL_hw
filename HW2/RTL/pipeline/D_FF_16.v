module D_FF_16 (
    input wire [15:0] d,
    input wire clk,
    input wire reset,
    output wire [15:0] q
);
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : ff_gen
            D_FF ff_inst (
                .d(d[i]), 
                .clk(clk), 
                .reset(reset), 
                .q(q[i])
            );
        end
    endgenerate
endmodule