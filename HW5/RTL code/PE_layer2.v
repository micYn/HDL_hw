module PE_layer2 (
    output wire signed[35:0] PE_out,
    input wire signed[15:0] bias,
    input wire signed[8:0] buf_out11,buf_out12, buf_out13, buf_out14, buf_out15, buf_out16, buf_out17, buf_out18, buf_out19,
                           buf_out21, buf_out22, buf_out23, buf_out24, buf_out25, buf_out26, buf_out27, buf_out28, buf_out29,
                           buf_out31, buf_out32, buf_out33, buf_out34, buf_out35, buf_out36, buf_out37, buf_out38, buf_out39,
                           buf_out41, buf_out42, buf_out43, buf_out44, buf_out45, buf_out46, buf_out47, buf_out48, buf_out49,
    input wire signed[15:0] weight11, weight12, weight13, weight14, weight15, weight16, weight17, weight18, weight19,
                             weight21, weight22, weight23, weight24, weight25, weight26, weight27, weight28, weight29,
                             weight31, weight32, weight33, weight34, weight35, weight36, weight37, weight38, weight39,
                             weight41, weight42, weight43, weight44, weight45, weight46, weight47, weight48, weight49
);
    wire signed [35:0] products1 [0:8];
    wire signed [35:0] products2 [0:8];
    wire signed [35:0] products3 [0:8];
    wire signed [35:0] products4 [0:8];
    wire signed [35:0] conv_result1;     
    wire signed [35:0] conv_result2;     
    wire signed [35:0] conv_result3;     
    wire signed [35:0] conv_result4;     
    // wire signed [35:0] PE_out;
    // wire signed [35:0] PE_out_and_bias;

    assign products1[0] = $signed(buf_out11) * $signed(weight11);
    assign products1[1] = $signed(buf_out12) * $signed(weight12);
    assign products1[2] = $signed(buf_out13) * $signed(weight13);
    assign products1[3] = $signed(buf_out14) * $signed(weight14);
    assign products1[4] = $signed(buf_out15) * $signed(weight15);
    assign products1[5] = $signed(buf_out16) * $signed(weight16);
    assign products1[6] = $signed(buf_out17) * $signed(weight17);
    assign products1[7] = $signed(buf_out18) * $signed(weight18);
    assign products1[8] = $signed(buf_out19) * $signed(weight19);

    assign products2[0] = $signed(buf_out21) * $signed(weight21);
    assign products2[1] = $signed(buf_out22) * $signed(weight22);
    assign products2[2] = $signed(buf_out23) * $signed(weight23);
    assign products2[3] = $signed(buf_out24) * $signed(weight24);
    assign products2[4] = $signed(buf_out25) * $signed(weight25);
    assign products2[5] = $signed(buf_out26) * $signed(weight26);
    assign products2[6] = $signed(buf_out27) * $signed(weight27);
    assign products2[7] = $signed(buf_out28) * $signed(weight28);
    assign products2[8] = $signed(buf_out29) * $signed(weight29);

    assign products3[0] = $signed(buf_out31) * $signed(weight31);
    assign products3[1] = $signed(buf_out32) * $signed(weight32);
    assign products3[2] = $signed(buf_out33) * $signed(weight33);
    assign products3[3] = $signed(buf_out34) * $signed(weight34);
    assign products3[4] = $signed(buf_out35) * $signed(weight35);
    assign products3[5] = $signed(buf_out36) * $signed(weight36);
    assign products3[6] = $signed(buf_out37) * $signed(weight37);
    assign products3[7] = $signed(buf_out38) * $signed(weight38);
    assign products3[8] = $signed(buf_out39) * $signed(weight39);

    assign products4[0] = $signed(buf_out41) * $signed(weight41);
    assign products4[1] = $signed(buf_out42) * $signed(weight42);
    assign products4[2] = $signed(buf_out43) * $signed(weight43);
    assign products4[3] = $signed(buf_out44) * $signed(weight44);
    assign products4[4] = $signed(buf_out45) * $signed(weight45);
    assign products4[5] = $signed(buf_out46) * $signed(weight46);
    assign products4[6] = $signed(buf_out47) * $signed(weight47);
    assign products4[7] = $signed(buf_out48) * $signed(weight48);
    assign products4[8] = $signed(buf_out49) * $signed(weight49);

    adder_tree adder1 (
        .i0(products1[0]), .i1(products1[1]), .i2(products1[2]), 
        .i3(products1[3]), .i4(products1[4]), .i5(products1[5]), 
        .i6(products1[6]), .i7(products1[7]), .i8(products1[8]),
        .result(conv_result1)
    );

    adder_tree adder2 (
        .i0(products2[0]), .i1(products2[1]), .i2(products2[2]), 
        .i3(products2[3]), .i4(products2[4]), .i5(products2[5]), 
        .i6(products2[6]), .i7(products2[7]), .i8(products2[8]),
        .result(conv_result2)
    );

    adder_tree adder3 (
        .i0(products3[0]), .i1(products3[1]), .i2(products3[2]), 
        .i3(products3[3]), .i4(products3[4]), .i5(products3[5]), 
        .i6(products3[6]), .i7(products3[7]), .i8(products3[8]),
        .result(conv_result3)
    );

    adder_tree adder4 (
        .i0(products4[0]), .i1(products4[1]), .i2(products4[2]), 
        .i3(products4[3]), .i4(products4[4]), .i5(products4[5]), 
        .i6(products4[6]), .i7(products4[7]), .i8(products4[8]),
        .result(conv_result4)
    );

    // adder_tree_three final_adder (
    //     .i0(conv_result1), .i1(conv_result2), .i2(conv_result3),
    //     .result(PE_out)
    // );

    assign PE_out = $signed(conv_result1) + $signed(conv_result2) + $signed(conv_result3) + $signed(conv_result4);
    // assign PE_out_and_bias = PE_out + {20'b0, bias};

    // ReLU relu_activation (
    //     .data_in(PE_out_and_bias),
    //     .data_out(ReLU_out)
    // );
    // assign ReLU_out = PE_out_and_bias;
endmodule