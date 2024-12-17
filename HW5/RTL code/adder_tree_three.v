module adder_tree_three (
    input wire signed [35:0] i0, i1, i2,
    output wire signed [35:0] result         
);
    
    wire signed [35:0] level1_0;
    wire signed [35:0] level1_1;

    assign level1_0 = $signed(i0) + $signed(i1);
    assign level1_1 = $signed(i2);

    assign result = $signed(level1_0) + $signed(level1_1);

endmodule