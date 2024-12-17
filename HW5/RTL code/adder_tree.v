module adder_tree (
    input wire signed [35:0] i0, i1, i2, i3, i4, i5, i6, i7, i8,
    output wire signed [35:0] result         
);
    wire signed [35:0] level1_0, level1_1, level1_2, level1_3, level1_4;
    wire signed [35:0] level2_0, level2_1, level2_2;
    wire signed [35:0] level3_0;

    assign level1_0 = $signed(i0) + $signed(i1);
    assign level1_1 = $signed(i2) + $signed(i3);
    assign level1_2 = $signed(i4) + $signed(i5);
    assign level1_3 = $signed(i6) + $signed(i7);
    assign level1_4 = $signed(i8);

    assign level2_0 = $signed(level1_0) + $signed(level1_1);
    assign level2_1 = $signed(level1_2) + $signed(level1_3);
    assign level2_2 = $signed(level1_4);

    assign level3_0 = $signed(level2_0) + $signed(level2_1) + $signed(level2_2);

    assign result = $signed(level3_0);

endmodule