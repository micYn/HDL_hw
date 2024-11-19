/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : V-2023.12
// Date      : Thu Oct 17 18:38:04 2024
/////////////////////////////////////////////////////////////


module D_FF_0 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  INVD1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_25 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  INVD1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_24 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  INVD1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_23 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  INVD1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_22 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  INVD1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_21 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  INVD1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_20 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  INVD1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_19 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  INVD1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_8 ( d, clk, reset, q );
  input [7:0] d;
  output [7:0] q;
  input clk, reset;


  D_FF_0 ff_gen_0__ff_inst ( .d(d[0]), .clk(clk), .reset(reset), .q(q[0]) );
  D_FF_25 ff_gen_1__ff_inst ( .d(d[1]), .clk(clk), .reset(reset), .q(q[1]) );
  D_FF_24 ff_gen_2__ff_inst ( .d(d[2]), .clk(clk), .reset(reset), .q(q[2]) );
  D_FF_23 ff_gen_3__ff_inst ( .d(d[3]), .clk(clk), .reset(reset), .q(q[3]) );
  D_FF_22 ff_gen_4__ff_inst ( .d(d[4]), .clk(clk), .reset(reset), .q(q[4]) );
  D_FF_21 ff_gen_5__ff_inst ( .d(d[5]), .clk(clk), .reset(reset), .q(q[5]) );
  D_FF_20 ff_gen_6__ff_inst ( .d(d[6]), .clk(clk), .reset(reset), .q(q[6]) );
  D_FF_19 ff_gen_7__ff_inst ( .d(d[7]), .clk(clk), .reset(reset), .q(q[7]) );
endmodule


module first_stage_DW01_sub_0 ( A, B, DIFF );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [7:2] carry;

  FA1D1BWP16P90LVT U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(
        DIFF[3]) );
  FA1D1BWP16P90LVT U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(
        DIFF[2]) );
  FA1D1BWP16P90LVT U2_1 ( .A(A[1]), .B(n8), .CI(n1), .CO(carry[2]), .S(DIFF[1]) );
  XOR3D2BWP16P90LVT U2_7 ( .A1(A[7]), .A2(n2), .A3(carry[7]), .Z(DIFF[7]) );
  FA1D1BWP16P90LVT U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF[6]) );
  FA1D1BWP16P90LVT U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(
        DIFF[4]) );
  FA1D1BWP16P90LVT U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(
        DIFF[5]) );
  CKND1BWP16P90LVT U1 ( .I(B[1]), .ZN(n8) );
  CKND1BWP16P90LVT U2 ( .I(B[3]), .ZN(n6) );
  CKND1BWP16P90LVT U3 ( .I(B[2]), .ZN(n7) );
  OR2D1BWP16P90LVT U4 ( .A1(A[0]), .A2(n9), .Z(n1) );
  CKND1BWP16P90LVT U5 ( .I(B[0]), .ZN(n9) );
  CKND1BWP16P90LVT U6 ( .I(B[5]), .ZN(n4) );
  CKND1BWP16P90LVT U7 ( .I(B[4]), .ZN(n5) );
  CKND1BWP16P90LVT U8 ( .I(B[6]), .ZN(n3) );
  CKND1BWP16P90LVT U9 ( .I(B[7]), .ZN(n2) );
  XNR2D1BWP16P90LVT U10 ( .A1(n9), .A2(A[0]), .ZN(DIFF[0]) );
endmodule


module first_stage_DW01_add_0 ( A, B, SUM );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  wire   n1;
  wire   [7:2] carry;

  FA1D1BWP16P90LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), 
        .S(SUM[6]) );
  FA1D1BWP16P90LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), 
        .S(SUM[5]) );
  FA1D1BWP16P90LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), 
        .S(SUM[4]) );
  FA1D1BWP16P90LVT U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(
        SUM[1]) );
  FA1D1BWP16P90LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), 
        .S(SUM[3]) );
  FA1D1BWP16P90LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), 
        .S(SUM[2]) );
  XOR3D2BWP16P90LVT U1_7 ( .A1(A[7]), .A2(B[7]), .A3(carry[7]), .Z(SUM[7]) );
  AN2D1BWP16P90LVT U1 ( .A1(B[0]), .A2(A[0]), .Z(n1) );
  XOR2D1BWP16P90LVT U2 ( .A1(B[0]), .A2(A[0]), .Z(SUM[0]) );
endmodule


module first_stage ( a, b, s, clk, reset, first_stage_result );
  input [7:0] a;
  input [7:0] b;
  output [7:0] first_stage_result;
  input s, clk, reset;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, n1, n2;
  wire   [7:0] sum;

  AO22D1BWP16P90LVT U5 ( .A1(N18), .A2(n2), .B1(s), .B2(N10), .Z(sum[7]) );
  AO22D1BWP16P90LVT U6 ( .A1(N9), .A2(s), .B1(N17), .B2(n2), .Z(sum[6]) );
  AO22D1BWP16P90LVT U7 ( .A1(N8), .A2(s), .B1(N16), .B2(n2), .Z(sum[5]) );
  AO22D1BWP16P90LVT U8 ( .A1(N7), .A2(s), .B1(N15), .B2(n2), .Z(sum[4]) );
  AO22D1BWP16P90LVT U9 ( .A1(N6), .A2(s), .B1(N14), .B2(n2), .Z(sum[3]) );
  AO22D1BWP16P90LVT U10 ( .A1(N5), .A2(s), .B1(N13), .B2(n2), .Z(sum[2]) );
  AO22D1BWP16P90LVT U11 ( .A1(N4), .A2(s), .B1(N12), .B2(n2), .Z(sum[1]) );
  AO22D1BWP16P90LVT U12 ( .A1(N3), .A2(s), .B1(N11), .B2(n2), .Z(sum[0]) );
  D_FF_8 dff8 ( .d(sum), .clk(clk), .reset(reset), .q(first_stage_result) );
  first_stage_DW01_sub_0 sub_31 ( .A(a), .B(b), .DIFF({N18, N17, N16, N15, N14, 
        N13, N12, N11}) );
  first_stage_DW01_add_0 add_31 ( .A(a), .B(b), .SUM({N10, N9, N8, N7, N6, N5, 
        N4, N3}) );
  TIELBWP20P90LVT U1 ( .ZN(n1) );
  CKND1BWP16P90LVT U2 ( .I(s), .ZN(n2) );
endmodule


module D_FF_18 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_17 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_15 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_14 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_13 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_12 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_11 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_10 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_9 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_7 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_6 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_5 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_4 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_3 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_2 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_1 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_16 ( d, clk, reset, q );
  input [15:0] d;
  output [15:0] q;
  input clk, reset;
  wire   n1;

  D_FF_18 ff_gen_0__ff_inst ( .d(d[0]), .clk(clk), .reset(n1), .q(q[0]) );
  D_FF_17 ff_gen_1__ff_inst ( .d(d[1]), .clk(clk), .reset(n1), .q(q[1]) );
  D_FF_15 ff_gen_2__ff_inst ( .d(d[2]), .clk(clk), .reset(n1), .q(q[2]) );
  D_FF_14 ff_gen_3__ff_inst ( .d(d[3]), .clk(clk), .reset(n1), .q(q[3]) );
  D_FF_13 ff_gen_4__ff_inst ( .d(d[4]), .clk(clk), .reset(n1), .q(q[4]) );
  D_FF_12 ff_gen_5__ff_inst ( .d(d[5]), .clk(clk), .reset(n1), .q(q[5]) );
  D_FF_11 ff_gen_6__ff_inst ( .d(d[6]), .clk(clk), .reset(n1), .q(q[6]) );
  D_FF_10 ff_gen_7__ff_inst ( .d(d[7]), .clk(clk), .reset(n1), .q(q[7]) );
  D_FF_9 ff_gen_8__ff_inst ( .d(d[8]), .clk(clk), .reset(n1), .q(q[8]) );
  D_FF_7 ff_gen_9__ff_inst ( .d(d[9]), .clk(clk), .reset(n1), .q(q[9]) );
  D_FF_6 ff_gen_10__ff_inst ( .d(d[10]), .clk(clk), .reset(n1), .q(q[10]) );
  D_FF_5 ff_gen_11__ff_inst ( .d(d[11]), .clk(clk), .reset(n1), .q(q[11]) );
  D_FF_4 ff_gen_12__ff_inst ( .d(d[12]), .clk(clk), .reset(n1), .q(q[12]) );
  D_FF_3 ff_gen_13__ff_inst ( .d(d[13]), .clk(clk), .reset(n1), .q(q[13]) );
  D_FF_2 ff_gen_14__ff_inst ( .d(d[14]), .clk(clk), .reset(n1), .q(q[14]) );
  D_FF_1 ff_gen_15__ff_inst ( .d(d[15]), .clk(clk), .reset(n1), .q(q[15]) );
  BUFFD1BWP16P90LVT U1 ( .I(reset), .Z(n1) );
endmodule


module second_stage_DW_mult_uns_2 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n21, n22, n23, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n40, n41, n42, n43, n46, n47, n48, n49, n52, n53, n54, n55,
         n56, n57, n58, n59, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n74, n76, n82, n83, n84, n85, n86, n88, n90, n96, n97, n98,
         n99, n101, n102, n106, n107, n108, n111, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n144, n145, n146, n147, n148, n149, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n227, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n274, n275, n276,
         n277, n278, n279, n280, n281, n283, n284, n285, n287, n289, n290,
         n303, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468;

  ND2D1BWP16P90LVT U3 ( .A1(n379), .A2(n20), .ZN(n4) );
  ND2D1BWP16P90LVT U6 ( .A1(n116), .A2(n115), .ZN(n20) );
  ND2D1BWP16P90LVT U9 ( .A1(n3), .A2(n445), .ZN(n22) );
  OAI21D1BWP16P90LVT U16 ( .A1(n40), .A2(n30), .B(n31), .ZN(n29) );
  ND2D1BWP16P90LVT U17 ( .A1(n101), .A2(n31), .ZN(n5) );
  ND2D1BWP16P90LVT U20 ( .A1(n120), .A2(n117), .ZN(n31) );
  ND2D1BWP16P90LVT U23 ( .A1(n3), .A2(n35), .ZN(n33) );
  ND2D1BWP16P90LVT U29 ( .A1(n102), .A2(n40), .ZN(n6) );
  ND2D1BWP16P90LVT U32 ( .A1(n124), .A2(n121), .ZN(n40) );
  OAI21D1BWP16P90LVT U34 ( .A1(n1), .A2(n42), .B(n43), .ZN(n41) );
  ND2D1BWP16P90LVT U35 ( .A1(n3), .A2(n403), .ZN(n42) );
  ND2D1BWP16P90LVT U43 ( .A1(n403), .A2(n47), .ZN(n7) );
  ND2D1BWP16P90LVT U46 ( .A1(n373), .A2(n130), .ZN(n47) );
  ND2D1BWP16P90LVT U53 ( .A1(n374), .A2(n56), .ZN(n8) );
  ND2D1BWP16P90LVT U56 ( .A1(n136), .A2(n131), .ZN(n56) );
  OAI21D1BWP16P90LVT U58 ( .A1(n1), .A2(n342), .B(n341), .ZN(n57) );
  ND2D1BWP16P90LVT U67 ( .A1(n106), .A2(n64), .ZN(n10) );
  ND2D1BWP16P90LVT U70 ( .A1(n145), .A2(n151), .ZN(n64) );
  ND2D1BWP16P90LVT U80 ( .A1(n108), .A2(n71), .ZN(n12) );
  ND2D1BWP16P90LVT U103 ( .A1(n111), .A2(n85), .ZN(n15) );
  ND2D1BWP16P90LVT U106 ( .A1(n172), .A2(n173), .ZN(n85) );
  ND2D1BWP16P90LVT U111 ( .A1(n453), .A2(n90), .ZN(n16) );
  ND2D1BWP16P90LVT U114 ( .A1(n174), .A2(n213), .ZN(n90) );
  ND2D1BWP16P90LVT U120 ( .A1(n449), .A2(n96), .ZN(n17) );
  ND2D1BWP16P90LVT U123 ( .A1(n221), .A2(n214), .ZN(n96) );
  ND2D1BWP16P90LVT U129 ( .A1(n222), .A2(n178), .ZN(n99) );
  FA1D1BWP16P90LVT U131 ( .A(n119), .B(n186), .CI(n122), .CO(n116), .S(n117)
         );
  FA1D1BWP16P90LVT U133 ( .A(n187), .B(n123), .CI(n126), .CO(n120), .S(n121)
         );
  FA1D1BWP16P90LVT U135 ( .A(n134), .B(n127), .CI(n132), .CO(n124), .S(n125)
         );
  OAI22D1BWP16P90LVT U181 ( .A1(n233), .A2(n278), .B1(n232), .B2(n283), .ZN(
        n189) );
  OAI22D1BWP16P90LVT U183 ( .A1(n235), .A2(n278), .B1(n234), .B2(n283), .ZN(
        n191) );
  AO21D1BWP16P90LVT U197 ( .A1(n279), .A2(n284), .B(n442), .Z(n195) );
  OAI22D1BWP16P90LVT U199 ( .A1(n240), .A2(n279), .B1(n239), .B2(n284), .ZN(
        n197) );
  OAI22D1BWP16P90LVT U200 ( .A1(n241), .A2(n279), .B1(n240), .B2(n284), .ZN(
        n198) );
  OAI22D1BWP16P90LVT U201 ( .A1(n242), .A2(n279), .B1(n241), .B2(n284), .ZN(
        n199) );
  OAI22D1BWP16P90LVT U204 ( .A1(n245), .A2(n279), .B1(n244), .B2(n284), .ZN(
        n202) );
  OAI22D1BWP16P90LVT U216 ( .A1(n256), .A2(n285), .B1(n434), .B2(n289), .ZN(
        n177) );
  OAI22D1BWP16P90LVT U221 ( .A1(n251), .A2(n434), .B1(n250), .B2(n285), .ZN(
        n209) );
  OAI22D1BWP16P90LVT U225 ( .A1(n255), .A2(n434), .B1(n254), .B2(n285), .ZN(
        n213) );
  OAI22D1BWP16P90LVT U236 ( .A1(n265), .A2(n303), .B1(n424), .B2(n290), .ZN(
        n178) );
  OAI22D1BWP16P90LVT U244 ( .A1(n263), .A2(n424), .B1(n262), .B2(n303), .ZN(
        n221) );
  OAI22D1BWP16P90LVT U296 ( .A1(n230), .A2(n278), .B1(n283), .B2(n287), .ZN(
        n186) );
  CKOR2D2BWP16P90LVT U297 ( .A1(n137), .A2(n455), .Z(n340) );
  ND2D1BWP16P90 U298 ( .A1(n154), .A2(n156), .ZN(n416) );
  ND2D1BWP16P90LVT U299 ( .A1(n209), .A2(n216), .ZN(n411) );
  AN2D2BWP16P90 U300 ( .A1(b[5]), .A2(a[7]), .Z(n180) );
  CKND1BWP16P90 U301 ( .I(n37), .ZN(n102) );
  OAI21D1BWP16P90 U302 ( .A1(n47), .A2(n37), .B(n40), .ZN(n36) );
  ND2D1BWP16P90 U303 ( .A1(n137), .A2(n144), .ZN(n341) );
  CKND1BWP16P90LVT U304 ( .I(n340), .ZN(n342) );
  XNR2D1BWP16P90LVT U305 ( .A1(b[4]), .A2(a[5]), .ZN(n242) );
  OAI22D2BWP16P90LVT U306 ( .A1(n236), .A2(n278), .B1(n235), .B2(n283), .ZN(
        n192) );
  CKNR2D2BWP16P90LVT U307 ( .A1(n145), .A2(n151), .ZN(n433) );
  ND2D1BWP16P90LVT U308 ( .A1(n193), .A2(n216), .ZN(n410) );
  OAI22D2BWP16P90LVT U309 ( .A1(n237), .A2(n278), .B1(n236), .B2(n283), .ZN(
        n193) );
  INR2D2BWP16P90 U310 ( .A1(b[0]), .B1(n283), .ZN(n194) );
  OAI22D2BWP16P90LVT U311 ( .A1(n252), .A2(n434), .B1(n251), .B2(n285), .ZN(
        n210) );
  OA22D2BWP16P90LVT U312 ( .A1(n241), .A2(n279), .B1(n240), .B2(n284), .Z(n347) );
  ND2D1BWP16P90 U313 ( .A1(n340), .A2(n341), .ZN(n9) );
  XOR2D4BWP16P90LVT U314 ( .A1(n162), .A2(n165), .Z(n343) );
  XOR2D1BWP16P90LVT U315 ( .A1(n343), .A2(n160), .Z(n158) );
  ND2D1BWP16P90 U316 ( .A1(n160), .A2(n165), .ZN(n344) );
  ND2D1BWP16P90 U317 ( .A1(n160), .A2(n162), .ZN(n345) );
  ND2D1BWP16P90 U318 ( .A1(n165), .A2(n162), .ZN(n346) );
  ND3D1BWP16P90LVT U319 ( .A1(n344), .A2(n345), .A3(n346), .ZN(n157) );
  ND2D2BWP16P90LVT U320 ( .A1(n353), .A2(n354), .ZN(n356) );
  XOR2D1BWP16P90LVT U321 ( .A1(n408), .A2(n193), .Z(n160) );
  ND2D1BWP16P90LVT U322 ( .A1(n454), .A2(n157), .ZN(n67) );
  CKNR2D1BWP16P90LVT U323 ( .A1(n152), .A2(n157), .ZN(n66) );
  FA1D2BWP16P90LVT U324 ( .A(n195), .B(n128), .CI(n180), .CO(n122), .S(n123)
         );
  AO21D1BWP16P90LVT U325 ( .A1(n280), .A2(n285), .B(n289), .Z(n205) );
  NR2D2BWP16P90LVT U326 ( .A1(n124), .A2(n121), .ZN(n37) );
  XNR2D2BWP16P90LVT U327 ( .A1(a[5]), .A2(b[6]), .ZN(n240) );
  NR2D1BWP16P90LVT U328 ( .A1(n243), .A2(n284), .ZN(n436) );
  ND2D1BWP16P90LVT U329 ( .A1(b[3]), .A2(a[5]), .ZN(n431) );
  CKND2D1BWP16P90LVT U330 ( .A1(n161), .A2(n352), .ZN(n376) );
  CKND2D4BWP16P90LVT U331 ( .A1(n223), .A2(n289), .ZN(n427) );
  FA1D2BWP16P90LVT U332 ( .A(n394), .B(n182), .CI(n206), .CO(n140), .S(n141)
         );
  INVD1BWP16P90LVT U333 ( .I(n69), .ZN(n68) );
  OAI22D2BWP16P90LVT U334 ( .A1(n262), .A2(n424), .B1(n261), .B2(n303), .ZN(
        n220) );
  XOR2D2BWP16P90 U335 ( .A1(n183), .A2(n394), .Z(n348) );
  XOR2D2BWP16P90LVT U336 ( .A1(n348), .A2(n207), .Z(n149) );
  ND2D2BWP16P90LVT U337 ( .A1(n207), .A2(n394), .ZN(n349) );
  ND2D4BWP16P90LVT U338 ( .A1(n207), .A2(n183), .ZN(n350) );
  CKND2D4BWP16P90LVT U339 ( .A1(n394), .A2(n183), .ZN(n351) );
  ND3D4BWP16P90LVT U340 ( .A1(n349), .A2(n350), .A3(n351), .ZN(n148) );
  CKBD4BWP16P90LVT U341 ( .I(n430), .Z(n394) );
  CKNR2D4BWP16P90LVT U342 ( .A1(n229), .A2(n287), .ZN(n183) );
  CKND2BWP16P90LVT U343 ( .I(n148), .ZN(n381) );
  OAI22D1BWP16P90 U344 ( .A1(n386), .A2(n279), .B1(n242), .B2(n284), .ZN(n352)
         );
  OAI22D1BWP16P90LVT U345 ( .A1(n386), .A2(n279), .B1(n242), .B2(n284), .ZN(
        n200) );
  ND2D1BWP16P90LVT U346 ( .A1(b[5]), .A2(a[3]), .ZN(n355) );
  ND2D2BWP16P90LVT U347 ( .A1(n356), .A2(n355), .ZN(n250) );
  CKND2BWP16P90LVT U348 ( .I(b[5]), .ZN(n353) );
  CKND1BWP16P90LVT U349 ( .I(a[3]), .ZN(n354) );
  XOR2D2BWP16P90 U350 ( .A1(n15), .A2(n86), .Z(product[4]) );
  AOI21D2BWP16P90LVT U351 ( .A1(n453), .A2(n447), .B(n88), .ZN(n86) );
  XOR3D4BWP16P90LVT U352 ( .A1(n134), .A2(n127), .A3(n132), .Z(n373) );
  CKNR2D2BWP16P90LVT U353 ( .A1(n145), .A2(n151), .ZN(n63) );
  NR2D1BWP16P90 U354 ( .A1(n223), .A2(n287), .ZN(n179) );
  XOR2D2BWP16P90LVT U355 ( .A1(n197), .A2(n189), .Z(n404) );
  AN2D1BWP16P90LVT U356 ( .A1(b[4]), .A2(a[7]), .Z(n128) );
  INVD2BWP16P90LVT U357 ( .I(n76), .ZN(n74) );
  XOR2D4BWP16P90LVT U358 ( .A1(n218), .A2(n203), .Z(n357) );
  XOR2D1BWP16P90LVT U359 ( .A1(n357), .A2(n170), .Z(n168) );
  ND2D1BWP16P90 U360 ( .A1(n170), .A2(n203), .ZN(n358) );
  ND2D1BWP16P90 U361 ( .A1(n170), .A2(n218), .ZN(n359) );
  ND2D1BWP16P90 U362 ( .A1(n203), .A2(n218), .ZN(n360) );
  ND3D1BWP16P90LVT U363 ( .A1(n358), .A2(n359), .A3(n360), .ZN(n167) );
  OAI22D2BWP16P90LVT U364 ( .A1(n260), .A2(n424), .B1(n259), .B2(n303), .ZN(
        n218) );
  XOR2D1BWP16P90LVT U365 ( .A1(n176), .A2(n211), .Z(n170) );
  CKOR2D4BWP16P90LVT U366 ( .A1(n164), .A2(n167), .Z(n451) );
  OR2D1BWP16P90LVT U367 ( .A1(n168), .A2(n171), .Z(n450) );
  XOR3D2BWP16P90LVT U368 ( .A1(n218), .A2(n203), .A3(n170), .Z(n393) );
  ND2D1BWP16P90 U369 ( .A1(n456), .A2(n82), .ZN(n14) );
  ND3D4BWP16P90LVT U370 ( .A1(n406), .A2(n405), .A3(n407), .ZN(n132) );
  ND2D2BWP16P90LVT U371 ( .A1(n437), .A2(n438), .ZN(n440) );
  XOR2D2BWP16P90LVT U372 ( .A1(n201), .A2(n175), .Z(n162) );
  CKND2BWP16P90LVT U373 ( .I(n361), .ZN(n161) );
  ND2D2BWP16P90LVT U374 ( .A1(n201), .A2(n175), .ZN(n361) );
  CKOR2D4BWP16P90LVT U375 ( .A1(n435), .A2(n436), .Z(n201) );
  OAI22D4BWP16P90LVT U376 ( .A1(n238), .A2(n283), .B1(n278), .B2(n287), .ZN(
        n175) );
  XOR3D2BWP16P90LVT U377 ( .A1(n162), .A2(n165), .A3(n160), .Z(n382) );
  XOR2D4BWP16P90LVT U378 ( .A1(n142), .A2(n205), .Z(n362) );
  XOR2D4BWP16P90LVT U379 ( .A1(n362), .A2(n181), .Z(n135) );
  ND2D1BWP16P90 U380 ( .A1(n181), .A2(n205), .ZN(n363) );
  ND2D1BWP16P90 U381 ( .A1(n181), .A2(n142), .ZN(n364) );
  ND2D1BWP16P90 U382 ( .A1(n205), .A2(n142), .ZN(n365) );
  ND3D1BWP16P90LVT U383 ( .A1(n363), .A2(n364), .A3(n365), .ZN(n134) );
  AO21D4BWP16P90LVT U384 ( .A1(n281), .A2(n303), .B(n290), .Z(n142) );
  NR2D1BWP16P90 U385 ( .A1(n227), .A2(n287), .ZN(n181) );
  XOR2D4BWP16P90LVT U386 ( .A1(n204), .A2(n212), .Z(n366) );
  XOR2D2BWP16P90LVT U387 ( .A1(n366), .A2(n219), .Z(n172) );
  ND2D1BWP16P90 U388 ( .A1(n219), .A2(n212), .ZN(n367) );
  ND2D1BWP16P90 U389 ( .A1(n219), .A2(n204), .ZN(n368) );
  ND2D1BWP16P90 U390 ( .A1(n212), .A2(n204), .ZN(n369) );
  ND3D1BWP16P90LVT U391 ( .A1(n367), .A2(n368), .A3(n369), .ZN(n171) );
  INR2D2BWP16P90 U392 ( .A1(b[0]), .B1(n284), .ZN(n204) );
  OAI22D1BWP16P90 U393 ( .A1(n261), .A2(n424), .B1(n260), .B2(n303), .ZN(n219)
         );
  ND2D1BWP16P90LVT U394 ( .A1(n393), .A2(n171), .ZN(n82) );
  CKNR2D2BWP16P90LVT U395 ( .A1(n172), .A2(n173), .ZN(n84) );
  CKND1BWP16P90LVT U396 ( .I(n370), .ZN(n169) );
  ND2D1BWP16P90LVT U397 ( .A1(n176), .A2(n211), .ZN(n370) );
  OAI22D2BWP16P90LVT U398 ( .A1(n247), .A2(n284), .B1(n279), .B2(n442), .ZN(
        n176) );
  DEL025D1BWP16P90 U399 ( .I(n83), .Z(n371) );
  BUFFD2BWP16P90LVT U400 ( .I(n191), .Z(n372) );
  XNR2D2BWP16P90LVT U401 ( .A1(b[2]), .A2(a[5]), .ZN(n244) );
  ND2D4BWP16P90LVT U402 ( .A1(n208), .A2(n184), .ZN(n389) );
  NR2D2BWP16P90LVT U403 ( .A1(n37), .A2(n30), .ZN(n28) );
  CKND1BWP16P90LVT U404 ( .I(b[1]), .ZN(n229) );
  CKOR2D2BWP16P90 U405 ( .A1(n131), .A2(n136), .Z(n374) );
  ND3D4BWP16P90LVT U406 ( .A1(n461), .A2(n460), .A3(n459), .ZN(n136) );
  XNR2D2BWP16P90 U407 ( .A1(b[3]), .A2(a[7]), .ZN(n234) );
  AOI21D1BWP16P90LVT U408 ( .A1(n451), .A2(n398), .B(n74), .ZN(n425) );
  XOR2D4BWP16P90LVT U409 ( .A1(n457), .A2(n139), .Z(n137) );
  XNR2D2BWP16P90LVT U410 ( .A1(a[7]), .A2(b[4]), .ZN(n233) );
  ND2D1BWP16P90LVT U411 ( .A1(n141), .A2(n139), .ZN(n460) );
  XOR2D4BWP16P90LVT U412 ( .A1(n465), .A2(n147), .Z(n145) );
  XNR2D2BWP16P90LVT U413 ( .A1(b[7]), .A2(a[5]), .ZN(n239) );
  OAI22D4BWP16P90LVT U414 ( .A1(n239), .A2(n279), .B1(n284), .B2(n442), .ZN(
        n196) );
  CKOR2D4BWP16P90LVT U415 ( .A1(n391), .A2(n392), .Z(n208) );
  ND2D1BWP16P90LVT U416 ( .A1(n146), .A2(n139), .ZN(n461) );
  ND2D2BWP16P90LVT U417 ( .A1(n155), .A2(n372), .ZN(n400) );
  OAI22D4BWP16P90LVT U418 ( .A1(n257), .A2(n424), .B1(n290), .B2(n303), .ZN(
        n215) );
  OR2D2BWP16P90LVT U419 ( .A1(n249), .A2(n434), .Z(n428) );
  ND2D1BWP16P90LVT U420 ( .A1(n133), .A2(n138), .ZN(n420) );
  XOR2D2BWP16P90LVT U421 ( .A1(n192), .A2(n200), .Z(n375) );
  XOR2D2BWP16P90LVT U422 ( .A1(n375), .A2(n161), .Z(n154) );
  ND2D1BWP16P90LVT U423 ( .A1(n161), .A2(n192), .ZN(n377) );
  ND2D1BWP16P90LVT U424 ( .A1(n352), .A2(n192), .ZN(n378) );
  ND3D4BWP16P90LVT U425 ( .A1(n377), .A2(n376), .A3(n378), .ZN(n153) );
  XOR2D1BWP16P90LVT U426 ( .A1(n415), .A2(n154), .Z(n152) );
  XOR2D2BWP16P90LVT U427 ( .A1(n9), .A2(n1), .Z(product[10]) );
  ND2D2BWP16P90LVT U428 ( .A1(n164), .A2(n167), .ZN(n76) );
  XNR2D2BWP16P90LVT U429 ( .A1(b[4]), .A2(a[1]), .ZN(n260) );
  INVD4BWP16P90LVT U430 ( .I(b[3]), .ZN(n227) );
  OAI22D1BWP16P90LVT U431 ( .A1(n234), .A2(n278), .B1(n233), .B2(n283), .ZN(
        n190) );
  CKND1BWP16P90LVT U432 ( .I(a[2]), .ZN(n437) );
  ND2D1BWP16P90LVT U433 ( .A1(n276), .A2(n285), .ZN(n434) );
  CKND1BWP16P90LVT U434 ( .I(a[1]), .ZN(n438) );
  ND2D1BWP16P90LVT U435 ( .A1(n277), .A2(n303), .ZN(n281) );
  XNR2D1BWP16P90LVT U436 ( .A1(b[0]), .A2(a[5]), .ZN(n246) );
  XOR2D2BWP16P90LVT U437 ( .A1(n419), .A2(n133), .Z(n131) );
  ND3D1BWP16P90LVT U438 ( .A1(n420), .A2(n421), .A3(n422), .ZN(n130) );
  CKND1BWP16P90LVT U439 ( .I(a[6]), .ZN(n441) );
  INR2D1BWP16P90LVT U440 ( .A1(n384), .B1(n287), .ZN(n118) );
  XOR2D2BWP16P90LVT U441 ( .A1(n156), .A2(n159), .Z(n415) );
  CKND1BWP16P90LVT U442 ( .I(n18), .ZN(product[1]) );
  ND2D2BWP16P90LVT U443 ( .A1(n208), .A2(n215), .ZN(n388) );
  OR2D1BWP16P90LVT U444 ( .A1(n116), .A2(n115), .Z(n379) );
  AOI21D1BWP16P90LVT U445 ( .A1(n303), .A2(n281), .B(n290), .ZN(n430) );
  INVD2BWP16P90LVT U446 ( .I(a[0]), .ZN(n303) );
  AOAI211D2BWP16P90LVT U447 ( .A1(n347), .A2(n380), .B(n381), .C(n458), .ZN(
        n138) );
  CKND1BWP16P90LVT U448 ( .I(n190), .ZN(n380) );
  ND2D1BWP16P90 U449 ( .A1(n454), .A2(n157), .ZN(n383) );
  DEL025D1BWP16P90 U450 ( .I(b[6]), .Z(n384) );
  ND2D1BWP16P90LVT U451 ( .A1(n189), .A2(n197), .ZN(n407) );
  INVD1BWP16P90 U452 ( .I(n243), .ZN(n385) );
  INVD1BWP16P90LVT U453 ( .I(n385), .ZN(n386) );
  OR2D2BWP16P90LVT U454 ( .A1(n248), .A2(n285), .Z(n429) );
  ND2D4BWP16P90LVT U455 ( .A1(n428), .A2(n429), .ZN(n207) );
  NR2D1BWP16P90LVT U456 ( .A1(n125), .A2(n130), .ZN(n46) );
  XOR2D4BWP16P90LVT U457 ( .A1(n216), .A2(n209), .Z(n408) );
  XNR2D4BWP16P90LVT U458 ( .A1(n452), .A2(n166), .ZN(n164) );
  IOA21D4BWP16P90LVT U459 ( .A1(n450), .A2(n83), .B(n82), .ZN(n448) );
  ND2D1BWP16P90LVT U460 ( .A1(b[7]), .A2(a[3]), .ZN(n426) );
  OAI21D2BWP16P90LVT U461 ( .A1(n84), .A2(n86), .B(n85), .ZN(n83) );
  XOR2D4BWP16P90LVT U462 ( .A1(n184), .A2(n215), .Z(n387) );
  XOR2D2BWP16P90LVT U463 ( .A1(n387), .A2(n208), .Z(n156) );
  ND2D1BWP16P90LVT U464 ( .A1(n215), .A2(n184), .ZN(n390) );
  ND3D4BWP16P90LVT U465 ( .A1(n388), .A2(n389), .A3(n390), .ZN(n155) );
  NR2D1BWP16P90LVT U466 ( .A1(n250), .A2(n434), .ZN(n391) );
  NR2D1BWP16P90LVT U467 ( .A1(n249), .A2(n285), .ZN(n392) );
  INR2D2BWP16P90LVT U468 ( .A1(b[0]), .B1(n287), .ZN(n184) );
  ND2D2BWP16P90LVT U469 ( .A1(n155), .A2(n199), .ZN(n401) );
  XNR2D2BWP16P90LVT U470 ( .A1(b[6]), .A2(a[3]), .ZN(n249) );
  ND2D4BWP16P90LVT U471 ( .A1(n439), .A2(n440), .ZN(n285) );
  OAI22D2BWP16P90LVT U472 ( .A1(n246), .A2(n279), .B1(n245), .B2(n284), .ZN(
        n203) );
  ND2D1BWP16P90 U473 ( .A1(n156), .A2(n159), .ZN(n418) );
  NR2D2BWP16P90LVT U474 ( .A1(n244), .A2(n279), .ZN(n435) );
  IND2D2BWP16P90LVT U475 ( .A1(b[0]), .B1(a[5]), .ZN(n247) );
  ND2D1BWP16P90LVT U476 ( .A1(b[3]), .A2(a[3]), .ZN(n395) );
  HA1D1BWP16P90LVT U477 ( .A(n177), .B(n220), .CO(n173), .S(n174) );
  NR2D2BWP16P90LVT U478 ( .A1(n137), .A2(n455), .ZN(n58) );
  ND2D2BWP16P90LVT U479 ( .A1(n137), .A2(n144), .ZN(n59) );
  CKND2BWP16P90LVT U480 ( .I(b[7]), .ZN(n223) );
  ND2D2BWP16P90LVT U481 ( .A1(n382), .A2(n163), .ZN(n71) );
  XNR2D2BWP16P90LVT U482 ( .A1(b[4]), .A2(a[3]), .ZN(n251) );
  OAI22D2BWP16P90LVT U483 ( .A1(n258), .A2(n424), .B1(n257), .B2(n303), .ZN(
        n216) );
  XNR2D4BWP16P90LVT U484 ( .A1(b[7]), .A2(a[1]), .ZN(n257) );
  DEL025D1BWP16P90 U485 ( .I(n450), .Z(n456) );
  XNR2D4BWP16P90LVT U486 ( .A1(a[4]), .A2(a[3]), .ZN(n284) );
  XNR2D2BWP16P90LVT U487 ( .A1(b[5]), .A2(a[5]), .ZN(n241) );
  XOR2D4BWP16P90LVT U488 ( .A1(n149), .A2(n153), .Z(n465) );
  XNR2D2BWP16P90 U489 ( .A1(b[3]), .A2(a[1]), .ZN(n261) );
  OAI21D1BWP16P90LVT U490 ( .A1(n68), .A2(n66), .B(n383), .ZN(n65) );
  INVD1BWP16P90 U491 ( .I(n433), .ZN(n106) );
  CKND2BWP16P90LVT U492 ( .I(n47), .ZN(n49) );
  INR2D2BWP16P90 U493 ( .A1(b[2]), .B1(n287), .ZN(n182) );
  XNR2D2BWP16P90 U494 ( .A1(b[2]), .A2(a[7]), .ZN(n235) );
  XNR2D2BWP16P90LVT U495 ( .A1(b[2]), .A2(a[3]), .ZN(n253) );
  XNR2D2BWP16P90 U496 ( .A1(b[2]), .A2(a[1]), .ZN(n262) );
  AN2D2BWP16P90LVT U497 ( .A1(n48), .A2(n28), .Z(n445) );
  XNR2D2BWP16P90 U498 ( .A1(a[7]), .A2(b[7]), .ZN(n230) );
  ND2D1BWP16P90 U499 ( .A1(n196), .A2(n188), .ZN(n412) );
  CKND1BWP16P90LVT U500 ( .I(n128), .ZN(n129) );
  ND3D2BWP16P90LVT U501 ( .A1(n416), .A2(n417), .A3(n418), .ZN(n151) );
  ND2D2BWP16P90LVT U502 ( .A1(n227), .A2(n289), .ZN(n396) );
  ND2D2BWP16P90LVT U503 ( .A1(n396), .A2(n395), .ZN(n252) );
  INVD1BWP16P90 U504 ( .I(n448), .ZN(n397) );
  INVD1BWP16P90LVT U505 ( .I(n397), .ZN(n398) );
  XOR2D2BWP16P90LVT U506 ( .A1(n199), .A2(n191), .Z(n399) );
  XOR2D2BWP16P90LVT U507 ( .A1(n399), .A2(n155), .Z(n147) );
  ND2D1BWP16P90LVT U508 ( .A1(n372), .A2(n199), .ZN(n402) );
  ND3D4BWP16P90LVT U509 ( .A1(n401), .A2(n400), .A3(n402), .ZN(n146) );
  XNR2D2BWP16P90LVT U510 ( .A1(b[5]), .A2(a[1]), .ZN(n259) );
  XNR2D2BWP16P90LVT U511 ( .A1(b[5]), .A2(a[7]), .ZN(n232) );
  ND2D2BWP16P90LVT U512 ( .A1(n227), .A2(n442), .ZN(n432) );
  AOI21D4BWP16P90LVT U513 ( .A1(n69), .A2(n61), .B(n62), .ZN(n1) );
  XOR2D4BWP16P90LVT U514 ( .A1(n146), .A2(n141), .Z(n457) );
  INVD1BWP16P90 U515 ( .I(n46), .ZN(n403) );
  INVD1BWP16P90LVT U516 ( .I(n46), .ZN(n48) );
  XOR2D2BWP16P90LVT U517 ( .A1(n404), .A2(n135), .Z(n133) );
  ND2D1BWP16P90LVT U518 ( .A1(n135), .A2(n189), .ZN(n405) );
  ND2D1BWP16P90LVT U519 ( .A1(n135), .A2(n197), .ZN(n406) );
  OAI21D1BWP16P90LVT U520 ( .A1(n1), .A2(n33), .B(n34), .ZN(n32) );
  ND2D1BWP16P90 U521 ( .A1(n209), .A2(n193), .ZN(n409) );
  ND3D2BWP16P90LVT U522 ( .A1(n409), .A2(n410), .A3(n411), .ZN(n159) );
  XOR3D2BWP16P90LVT U523 ( .A1(n159), .A2(n156), .A3(n154), .Z(n454) );
  ND2D1BWP16P90LVT U524 ( .A1(n159), .A2(n154), .ZN(n417) );
  NR2D2BWP16P90LVT U525 ( .A1(n158), .A2(n163), .ZN(n70) );
  OAI21D4BWP16P90LVT U526 ( .A1(n72), .A2(n70), .B(n71), .ZN(n69) );
  AOI21D4BWP16P90LVT U527 ( .A1(n451), .A2(n448), .B(n74), .ZN(n72) );
  XOR3D4BWP16P90LVT U528 ( .A1(n129), .A2(n196), .A3(n188), .Z(n127) );
  ND2D1BWP16P90 U529 ( .A1(n196), .A2(n129), .ZN(n413) );
  ND2D1BWP16P90 U530 ( .A1(n129), .A2(n188), .ZN(n414) );
  ND3D1BWP16P90LVT U531 ( .A1(n412), .A2(n413), .A3(n414), .ZN(n126) );
  OAI22D2BWP16P90LVT U532 ( .A1(n232), .A2(n278), .B1(n231), .B2(n283), .ZN(
        n188) );
  XNR2D2BWP16P90LVT U533 ( .A1(b[6]), .A2(a[1]), .ZN(n258) );
  XNR2D2BWP16P90LVT U534 ( .A1(b[6]), .A2(a[7]), .ZN(n231) );
  ND2D2BWP16P90LVT U535 ( .A1(n431), .A2(n432), .ZN(n243) );
  NR2D1BWP16P90LVT U536 ( .A1(n55), .A2(n58), .ZN(n3) );
  OAI21D2BWP16P90LVT U537 ( .A1(n55), .A2(n59), .B(n56), .ZN(n2) );
  NR2D2BWP16P90LVT U538 ( .A1(n433), .A2(n66), .ZN(n61) );
  XOR2D4BWP16P90LVT U539 ( .A1(n140), .A2(n138), .Z(n419) );
  ND2D1BWP16P90LVT U540 ( .A1(n133), .A2(n140), .ZN(n421) );
  ND2D1BWP16P90 U541 ( .A1(n138), .A2(n140), .ZN(n422) );
  INVD1BWP16P90LVT U542 ( .I(n281), .ZN(n423) );
  CKND2BWP16P90LVT U543 ( .I(n423), .ZN(n424) );
  OAI22D2BWP16P90LVT U544 ( .A1(n253), .A2(n434), .B1(n252), .B2(n285), .ZN(
        n211) );
  ND2D2BWP16P90LVT U545 ( .A1(n427), .A2(n426), .ZN(n248) );
  OAI21D2BWP16P90LVT U546 ( .A1(n67), .A2(n63), .B(n64), .ZN(n62) );
  NR2D2BWP16P90LVT U547 ( .A1(n136), .A2(n131), .ZN(n55) );
  ND2D1BWP16P90LVT U548 ( .A1(n276), .A2(n285), .ZN(n280) );
  OAI22D1BWP16P90LVT U549 ( .A1(n259), .A2(n424), .B1(n258), .B2(n303), .ZN(
        n217) );
  ND2D1BWP16P90LVT U550 ( .A1(a[2]), .A2(a[1]), .ZN(n439) );
  INVD1BWP16P90 U551 ( .I(n70), .ZN(n108) );
  XOR2D1BWP16P90 U552 ( .A1(n425), .A2(n12), .Z(product[7]) );
  INR2D1BWP16P90 U553 ( .A1(b[0]), .B1(n285), .ZN(n214) );
  CKND2D2BWP16P90LVT U554 ( .A1(n441), .A2(n442), .ZN(n444) );
  OAI22D1BWP16P90LVT U555 ( .A1(n248), .A2(n434), .B1(n285), .B2(n289), .ZN(
        n206) );
  OAI22D1BWP16P90LVT U556 ( .A1(n254), .A2(n434), .B1(n253), .B2(n285), .ZN(
        n212) );
  INVD1BWP16P90 U557 ( .I(n30), .ZN(n101) );
  XNR2D1BWP16P90LVT U558 ( .A1(b[0]), .A2(a[7]), .ZN(n237) );
  ND2D4BWP16P90LVT U559 ( .A1(n443), .A2(n444), .ZN(n283) );
  AO21D1BWP16P90 U560 ( .A1(n278), .A2(n283), .B(n287), .Z(n185) );
  ND2D4BWP16P90LVT U561 ( .A1(n275), .A2(n284), .ZN(n279) );
  NR2D1BWP16P90 U562 ( .A1(n46), .A2(n37), .ZN(n35) );
  XNR2D1BWP16P90 U563 ( .A1(n17), .A2(n97), .ZN(product[2]) );
  INVD1BWP16P90LVT U564 ( .I(n90), .ZN(n88) );
  ND2D1BWP16P90 U565 ( .A1(n451), .A2(n76), .ZN(n13) );
  XNR2D1BWP16P90 U566 ( .A1(n14), .A2(n371), .ZN(product[5]) );
  INVD1BWP16P90 U567 ( .I(n84), .ZN(n111) );
  INR2D1BWP16P90 U568 ( .A1(b[0]), .B1(n303), .ZN(product[0]) );
  XNR2D1BWP16P90LVT U569 ( .A1(b[1]), .A2(a[5]), .ZN(n245) );
  ND2D1BWP16P90LVT U570 ( .A1(a[6]), .A2(a[5]), .ZN(n443) );
  CKND2BWP16P90LVT U571 ( .I(a[5]), .ZN(n442) );
  OAI22D1BWP16P90 U572 ( .A1(n231), .A2(n278), .B1(n230), .B2(n283), .ZN(n187)
         );
  ND2D2BWP16P90LVT U573 ( .A1(n274), .A2(n283), .ZN(n278) );
  AO21D1BWP16P90LVT U574 ( .A1(n28), .A2(n49), .B(n29), .Z(n446) );
  IOA21D1BWP16P90LVT U575 ( .A1(n449), .A2(n97), .B(n96), .ZN(n447) );
  ND2D1BWP16P90 U576 ( .A1(n107), .A2(n383), .ZN(n11) );
  INVD1BWP16P90LVT U577 ( .I(n99), .ZN(n97) );
  OR2D1BWP16P90LVT U578 ( .A1(n221), .A2(n214), .Z(n449) );
  NR2D1BWP16P90LVT U579 ( .A1(n120), .A2(n117), .ZN(n30) );
  XNR2D1BWP16P90 U580 ( .A1(n13), .A2(n398), .ZN(product[6]) );
  XNR2D1BWP16P90 U581 ( .A1(n16), .A2(n447), .ZN(product[3]) );
  XNR2D1BWP16P90LVT U582 ( .A1(n202), .A2(n169), .ZN(n452) );
  XOR3D2BWP16P90LVT U583 ( .A1(n198), .A2(n190), .A3(n148), .Z(n139) );
  OR2D1BWP16P90LVT U584 ( .A1(n174), .A2(n213), .Z(n453) );
  CKND1BWP16P90LVT U585 ( .I(n118), .ZN(n119) );
  IND2D1BWP16P90 U586 ( .A1(n98), .B1(n99), .ZN(n18) );
  NR2D1BWP16P90 U587 ( .A1(n222), .A2(n178), .ZN(n98) );
  OAI22D1BWP16P90LVT U588 ( .A1(n264), .A2(n424), .B1(n263), .B2(n303), .ZN(
        n222) );
  XNR2D1BWP16P90LVT U589 ( .A1(b[0]), .A2(a[1]), .ZN(n264) );
  IND2D1BWP16P90LVT U590 ( .A1(b[0]), .B1(a[7]), .ZN(n238) );
  XNR2D1BWP16P90LVT U591 ( .A1(b[1]), .A2(a[7]), .ZN(n236) );
  XOR2D1BWP16P90LVT U592 ( .A1(a[2]), .A2(a[3]), .Z(n276) );
  XNR2D1BWP16P90LVT U593 ( .A1(b[1]), .A2(a[1]), .ZN(n263) );
  XOR2D1BWP16P90LVT U594 ( .A1(a[0]), .A2(a[1]), .Z(n277) );
  XNR2D1BWP16P90 U595 ( .A1(b[0]), .A2(a[3]), .ZN(n255) );
  XOR2D1BWP16P90LVT U596 ( .A1(a[4]), .A2(a[5]), .Z(n275) );
  CKND1BWP16P90LVT U597 ( .I(a[1]), .ZN(n290) );
  XOR2D1BWP16P90LVT U598 ( .A1(a[6]), .A2(a[7]), .Z(n274) );
  CKND1BWP16P90LVT U599 ( .I(a[3]), .ZN(n289) );
  CKND1BWP16P90LVT U600 ( .I(a[7]), .ZN(n287) );
  XOR3D2BWP16P90LVT U601 ( .A1(n185), .A2(n179), .A3(n118), .Z(n115) );
  INVD1BWP16P90 U602 ( .I(n2), .ZN(n54) );
  OAI21D1BWP16P90LVT U603 ( .A1(n1), .A2(n22), .B(n23), .ZN(n21) );
  OAI21D1BWP16P90LVT U604 ( .A1(n1), .A2(n53), .B(n54), .ZN(n52) );
  ND3D1BWP16P90LVT U605 ( .A1(n466), .A2(n467), .A3(n468), .ZN(n455) );
  XOR2D1BWP16P90LVT U606 ( .A1(n11), .A2(n68), .Z(product[8]) );
  INVD1BWP16P90LVT U607 ( .I(n66), .ZN(n107) );
  INVD1BWP16P90LVT U608 ( .I(n3), .ZN(n53) );
  ND2D1BWP16P90LVT U609 ( .A1(n198), .A2(n190), .ZN(n458) );
  ND2D1BWP16P90 U610 ( .A1(n146), .A2(n141), .ZN(n459) );
  FA1D1BWP16P90LVT U611 ( .A(n194), .B(n210), .CI(n217), .CO(n165), .S(n166)
         );
  IND2D1BWP16P90LVT U612 ( .A1(b[0]), .B1(a[3]), .ZN(n256) );
  IND2D1BWP16P90LVT U613 ( .A1(b[0]), .B1(a[1]), .ZN(n265) );
  ND2D1BWP16P90 U614 ( .A1(n166), .A2(n169), .ZN(n462) );
  ND2D1BWP16P90 U615 ( .A1(n166), .A2(n202), .ZN(n463) );
  ND2D1BWP16P90 U616 ( .A1(n169), .A2(n202), .ZN(n464) );
  ND3D1BWP16P90LVT U617 ( .A1(n462), .A2(n463), .A3(n464), .ZN(n163) );
  ND2D1BWP16P90 U618 ( .A1(n147), .A2(n153), .ZN(n466) );
  ND2D1BWP16P90 U619 ( .A1(n147), .A2(n149), .ZN(n467) );
  ND2D1BWP16P90 U620 ( .A1(n153), .A2(n149), .ZN(n468) );
  ND3D1BWP16P90LVT U621 ( .A1(n466), .A2(n467), .A3(n468), .ZN(n144) );
  XNR2D1BWP16P90LVT U622 ( .A1(n52), .A2(n7), .ZN(product[12]) );
  XNR2D1BWP16P90LVT U623 ( .A1(n21), .A2(n4), .ZN(product[15]) );
  XNR2D1BWP16P90LVT U624 ( .A1(n65), .A2(n10), .ZN(product[9]) );
  XNR2D1BWP16P90LVT U625 ( .A1(n32), .A2(n5), .ZN(product[14]) );
  AOI21D1BWP16P90LVT U626 ( .A1(n2), .A2(n35), .B(n36), .ZN(n34) );
  AOI21D1BWP16P90LVT U627 ( .A1(n2), .A2(n403), .B(n49), .ZN(n43) );
  AOI21D1BWP16P90LVT U628 ( .A1(n2), .A2(n445), .B(n446), .ZN(n23) );
  XNR2D1BWP16P90LVT U629 ( .A1(n41), .A2(n6), .ZN(product[13]) );
  XNR2D1BWP16P90LVT U630 ( .A1(n57), .A2(n8), .ZN(product[11]) );
  XNR2D1BWP16P90LVT U631 ( .A1(b[1]), .A2(a[3]), .ZN(n254) );
endmodule


module second_stage ( sum, c, clk, reset, second_stage_result );
  input [7:0] sum;
  input [7:0] c;
  output [15:0] second_stage_result;
  input clk, reset;

  wire   [15:0] product;

  D_FF_16 dff16 ( .d(product), .clk(clk), .reset(reset), .q(
        second_stage_result) );
  second_stage_DW_mult_uns_2 mult_42 ( .a(c), .b(sum), .product(product) );
endmodule


module SNPS_CLOCK_GATE_HIGH_hw2_pipe_clkgating ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1BWP20P90 latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module hw2_pipe_clkgating ( a, b, c, s, clk, reset, second_stage_result );
  input [7:0] a;
  input [7:0] b;
  input [7:0] c;
  output [15:0] second_stage_result;
  input s, clk, reset;
  wire   n_Logic1_, gclk, modified_reset, N16, net75, n2, n3, n4;
  wire   [7:0] first_stage_result;

  first_stage fs ( .a(a), .b(b), .s(s), .clk(clk), .reset(reset), 
        .first_stage_result(first_stage_result) );
  second_stage ss ( .sum(first_stage_result), .c(c), .clk(gclk), .reset(
        modified_reset), .second_stage_result(second_stage_result) );
  SNPS_CLOCK_GATE_HIGH_hw2_pipe_clkgating clk_gate_C21 ( .CLK(clk), .EN(N16), 
        .ENCLK(gclk), .TE(net75) );
  TIEHBWP20P90LVT U7 ( .Z(n_Logic1_) );
  TIELBWP20P90LVT U8 ( .ZN(net75) );
  ND2D1BWP16P90LVT U9 ( .A1(n2), .A2(n3), .ZN(N16) );
  NR4D1BWP16P90LVT U10 ( .A1(c[3]), .A2(c[2]), .A3(c[1]), .A4(c[0]), .ZN(n2)
         );
  NR4D1BWP16P90LVT U11 ( .A1(c[7]), .A2(c[6]), .A3(c[5]), .A4(c[4]), .ZN(n3)
         );
  CKND1BWP16P90LVT U12 ( .I(N16), .ZN(n4) );
  MUX2D1BWP16P90LVT U13 ( .I0(reset), .I1(n_Logic1_), .S(n4), .Z(
        modified_reset) );
endmodule

