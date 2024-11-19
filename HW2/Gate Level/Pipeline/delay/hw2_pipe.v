/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : V-2023.12
// Date      : Thu Oct 17 18:11:59 2024
/////////////////////////////////////////////////////////////


module D_FF_0 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_25 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_24 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_23 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1, n3;

  DFCNQND2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n3), .QN(n1) );
  INVD4BWP16P90LVT U3 ( .I(n1), .ZN(q) );
  CKND1BWP16P90LVT U4 ( .I(reset), .ZN(n3) );
endmodule


module D_FF_22 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_21 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_20 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_19 ( d, clk, reset, q );
  input d, clk, reset;
  output q;
  wire   n1;

  DFCNQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .CDN(n1), .Q(q) );
  CKND1BWP16P90LVT U3 ( .I(reset), .ZN(n1) );
endmodule


module D_FF_8 ( d, clk, reset, q );
  input [7:0] d;
  output [7:0] q;
  input clk, reset;
  wire   n1;

  D_FF_0 ff_gen_0__ff_inst ( .d(d[0]), .clk(clk), .reset(n1), .q(q[0]) );
  D_FF_25 ff_gen_1__ff_inst ( .d(d[1]), .clk(clk), .reset(n1), .q(q[1]) );
  D_FF_24 ff_gen_2__ff_inst ( .d(d[2]), .clk(clk), .reset(n1), .q(q[2]) );
  D_FF_23 ff_gen_3__ff_inst ( .d(d[3]), .clk(clk), .reset(n1), .q(q[3]) );
  D_FF_22 ff_gen_4__ff_inst ( .d(d[4]), .clk(clk), .reset(n1), .q(q[4]) );
  D_FF_21 ff_gen_5__ff_inst ( .d(d[5]), .clk(clk), .reset(n1), .q(q[5]) );
  D_FF_20 ff_gen_6__ff_inst ( .d(d[6]), .clk(clk), .reset(n1), .q(q[6]) );
  D_FF_19 ff_gen_7__ff_inst ( .d(d[7]), .clk(clk), .reset(n1), .q(q[7]) );
  BUFFD1BWP16P90LVT U1 ( .I(reset), .Z(n1) );
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
  first_stage_DW01_sub_0 sub_23 ( .A(a), .B(b), .DIFF({N18, N17, N16, N15, N14, 
        N13, N12, N11}) );
  first_stage_DW01_add_0 add_23 ( .A(a), .B(b), .SUM({N10, N9, N8, N7, N6, N5, 
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
  wire   n1, n2;

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
  D_FF_4 ff_gen_12__ff_inst ( .d(d[12]), .clk(clk), .reset(n2), .q(q[12]) );
  D_FF_3 ff_gen_13__ff_inst ( .d(d[13]), .clk(clk), .reset(n2), .q(q[13]) );
  D_FF_2 ff_gen_14__ff_inst ( .d(d[14]), .clk(clk), .reset(n2), .q(q[14]) );
  D_FF_1 ff_gen_15__ff_inst ( .d(d[15]), .clk(clk), .reset(n2), .q(q[15]) );
  BUFFD1BWP16P90LVT U1 ( .I(reset), .Z(n1) );
  BUFFD1BWP16P90LVT U2 ( .I(reset), .Z(n2) );
endmodule


module second_stage_DW_mult_uns_2 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n21, n22, n23, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n40, n41, n42, n43, n46, n47, n49, n52, n53, n54, n55, n56,
         n57, n58, n59, n61, n62, n63, n64, n65, n66, n67, n68, n70, n71, n72,
         n74, n76, n82, n83, n84, n85, n86, n88, n90, n96, n97, n98, n99, n101,
         n102, n104, n105, n106, n107, n108, n111, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n137, n138, n139, n140, n141,
         n142, n144, n145, n146, n147, n148, n149, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n274, n275, n276, n277, n278,
         n279, n280, n281, n283, n284, n285, n287, n289, n290, n303, n340,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373,
         n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466;

  ND2D1BWP16P90LVT U3 ( .A1(n347), .A2(n20), .ZN(n4) );
  ND2D1BWP16P90LVT U6 ( .A1(n116), .A2(n115), .ZN(n20) );
  ND2D1BWP16P90LVT U9 ( .A1(n3), .A2(n440), .ZN(n22) );
  OAI21D1BWP16P90LVT U16 ( .A1(n40), .A2(n30), .B(n31), .ZN(n29) );
  ND2D1BWP16P90LVT U17 ( .A1(n101), .A2(n31), .ZN(n5) );
  ND2D1BWP16P90LVT U20 ( .A1(n120), .A2(n117), .ZN(n31) );
  ND2D1BWP16P90LVT U23 ( .A1(n3), .A2(n35), .ZN(n33) );
  ND2D1BWP16P90LVT U29 ( .A1(n102), .A2(n40), .ZN(n6) );
  OAI21D1BWP16P90LVT U34 ( .A1(n1), .A2(n42), .B(n43), .ZN(n41) );
  ND2D1BWP16P90LVT U35 ( .A1(n3), .A2(n391), .ZN(n42) );
  ND2D1BWP16P90LVT U46 ( .A1(n125), .A2(n130), .ZN(n47) );
  ND2D1BWP16P90LVT U53 ( .A1(n104), .A2(n56), .ZN(n8) );
  ND2D1BWP16P90LVT U56 ( .A1(n350), .A2(n377), .ZN(n56) );
  OAI21D1BWP16P90LVT U58 ( .A1(n1), .A2(n58), .B(n370), .ZN(n57) );
  ND2D1BWP16P90LVT U59 ( .A1(n105), .A2(n370), .ZN(n9) );
  ND2D1BWP16P90LVT U70 ( .A1(n145), .A2(n151), .ZN(n64) );
  ND2D1BWP16P90LVT U80 ( .A1(n108), .A2(n71), .ZN(n12) );
  ND2D1BWP16P90LVT U83 ( .A1(n158), .A2(n163), .ZN(n71) );
  ND2D1BWP16P90LVT U103 ( .A1(n111), .A2(n85), .ZN(n15) );
  ND2D1BWP16P90LVT U111 ( .A1(n448), .A2(n90), .ZN(n16) );
  ND2D1BWP16P90LVT U114 ( .A1(n174), .A2(n213), .ZN(n90) );
  ND2D1BWP16P90LVT U120 ( .A1(n444), .A2(n96), .ZN(n17) );
  ND2D1BWP16P90LVT U123 ( .A1(n221), .A2(n214), .ZN(n96) );
  ND2D1BWP16P90LVT U129 ( .A1(n222), .A2(n178), .ZN(n99) );
  FA1D1BWP16P90LVT U131 ( .A(n119), .B(n186), .CI(n122), .CO(n116), .S(n117)
         );
  FA1D1BWP16P90LVT U133 ( .A(n187), .B(n123), .CI(n126), .CO(n120), .S(n121)
         );
  FA1D1BWP16P90LVT U134 ( .A(n195), .B(n128), .CI(n180), .CO(n122), .S(n123)
         );
  FA1D1BWP16P90LVT U135 ( .A(n134), .B(n127), .CI(n132), .CO(n124), .S(n125)
         );
  FA1D1BWP16P90LVT U138 ( .A(n140), .B(n133), .CI(n138), .CO(n130), .S(n131)
         );
  FA1D1BWP16P90LVT U140 ( .A(n142), .B(n205), .CI(n181), .CO(n134), .S(n135)
         );
  FA1D1BWP16P90LVT U149 ( .A(n159), .B(n156), .CI(n154), .CO(n151), .S(n152)
         );
  FA1D1BWP16P90LVT U153 ( .A(n216), .B(n209), .CI(n193), .CO(n159), .S(n160)
         );
  FA1D1BWP16P90LVT U157 ( .A(n218), .B(n203), .CI(n170), .CO(n167), .S(n168)
         );
  FA1D1BWP16P90LVT U159 ( .A(n204), .B(n219), .CI(n212), .CO(n171), .S(n172)
         );
  HA1D2BWP16P90LVT U160 ( .A(n177), .B(n220), .CO(n173), .S(n174) );
  OAI22D1BWP16P90LVT U200 ( .A1(n241), .A2(n279), .B1(n240), .B2(n284), .ZN(
        n198) );
  OAI22D1BWP16P90LVT U201 ( .A1(n242), .A2(n279), .B1(n241), .B2(n284), .ZN(
        n199) );
  OAI22D1BWP16P90LVT U216 ( .A1(n256), .A2(n285), .B1(n428), .B2(n289), .ZN(
        n177) );
  OAI22D1BWP16P90LVT U221 ( .A1(n251), .A2(n428), .B1(n250), .B2(n285), .ZN(
        n209) );
  OAI22D1BWP16P90LVT U225 ( .A1(n255), .A2(n428), .B1(n254), .B2(n285), .ZN(
        n213) );
  OAI22D1BWP16P90LVT U236 ( .A1(n265), .A2(n303), .B1(n415), .B2(n290), .ZN(
        n178) );
  AO21D1BWP16P90LVT U237 ( .A1(n281), .A2(n303), .B(n290), .Z(n142) );
  OAI22D1BWP16P90LVT U241 ( .A1(n260), .A2(n415), .B1(n259), .B2(n303), .ZN(
        n218) );
  OAI22D1BWP16P90LVT U243 ( .A1(n262), .A2(n415), .B1(n261), .B2(n303), .ZN(
        n220) );
  OAI22D1BWP16P90LVT U244 ( .A1(n263), .A2(n415), .B1(n262), .B2(n303), .ZN(
        n221) );
  ND2D1BWP16P90 U296 ( .A1(b[3]), .A2(a[5]), .ZN(n425) );
  ND2D1BWP16P90 U297 ( .A1(n407), .A2(n408), .ZN(n340) );
  AOI21D1BWP16P90LVT U298 ( .A1(n396), .A2(n446), .B(n74), .ZN(n362) );
  XNR2D2BWP16P90LVT U299 ( .A1(b[3]), .A2(a[1]), .ZN(n261) );
  XOR3D2BWP16P90LVT U300 ( .A1(n194), .A2(n217), .A3(n210), .Z(n343) );
  INVD1BWP16P90LVT U301 ( .I(n46), .ZN(n391) );
  DEL025D1BWP16P90 U302 ( .I(n84), .Z(n341) );
  DEL025D1BWP16P90LVT U303 ( .I(b[6]), .Z(n342) );
  INR2D2BWP16P90 U304 ( .A1(n466), .B1(n283), .ZN(n194) );
  OAI21D2BWP16P90LVT U305 ( .A1(n385), .A2(n22), .B(n23), .ZN(n21) );
  OAI22D2BWP16P90LVT U306 ( .A1(n240), .A2(n279), .B1(n239), .B2(n284), .ZN(
        n197) );
  OR2D2BWP16P90LVT U307 ( .A1(n430), .A2(n429), .Z(n344) );
  OR2D1BWP16P90LVT U308 ( .A1(n430), .A2(n429), .Z(n201) );
  ND2D4BWP16P90LVT U309 ( .A1(n386), .A2(n387), .ZN(n219) );
  XNR2D8BWP16P90LVT U310 ( .A1(b[3]), .A2(a[3]), .ZN(n252) );
  NR2D2BWP16P90LVT U311 ( .A1(n172), .A2(n173), .ZN(n84) );
  ND2D2BWP16P90LVT U312 ( .A1(n371), .A2(n173), .ZN(n85) );
  ND2D1BWP16P90LVT U313 ( .A1(n155), .A2(n191), .ZN(n365) );
  ND2D1BWP16P90 U314 ( .A1(n106), .A2(n64), .ZN(n10) );
  ND3D1BWP16P90LVT U315 ( .A1(n398), .A2(n399), .A3(n400), .ZN(n345) );
  ND3D1BWP16P90LVT U316 ( .A1(n398), .A2(n399), .A3(n400), .ZN(n155) );
  DEL025D1BWP16P90 U317 ( .I(n223), .Z(n346) );
  XOR2D8BWP16P90LVT U318 ( .A1(n410), .A2(n354), .Z(n133) );
  OAI22D1BWP16P90LVT U319 ( .A1(n258), .A2(n415), .B1(n257), .B2(n303), .ZN(
        n216) );
  CKND4BWP16P90LVT U320 ( .I(n414), .ZN(n415) );
  ND3D2BWP16P90LVT U321 ( .A1(n456), .A2(n457), .A3(n458), .ZN(n377) );
  XNR2D2BWP16P90LVT U322 ( .A1(n202), .A2(n169), .ZN(n447) );
  OAI22D2BWP16P90LVT U323 ( .A1(n259), .A2(n415), .B1(n258), .B2(n303), .ZN(
        n217) );
  AN2D2BWP16P90LVT U324 ( .A1(n201), .A2(n175), .Z(n369) );
  ND3D4BWP16P90LVT U325 ( .A1(n453), .A2(n454), .A3(n455), .ZN(n138) );
  ND2D2BWP16P90LVT U326 ( .A1(n403), .A2(n389), .ZN(n390) );
  ND2D1BWP16P90LVT U327 ( .A1(n277), .A2(n303), .ZN(n281) );
  ND2D2BWP16P90LVT U328 ( .A1(n345), .A2(n199), .ZN(n366) );
  OAI22D1BWP16P90LVT U329 ( .A1(n236), .A2(n278), .B1(n235), .B2(n283), .ZN(
        n192) );
  OAI22D1BWP16P90LVT U330 ( .A1(n235), .A2(n278), .B1(n234), .B2(n283), .ZN(
        n191) );
  OAI22D1BWP16P90LVT U331 ( .A1(n238), .A2(n283), .B1(n278), .B2(n287), .ZN(
        n175) );
  ND2D2BWP16P90LVT U332 ( .A1(n276), .A2(n285), .ZN(n428) );
  ND2D1BWP16P90LVT U333 ( .A1(n188), .A2(n129), .ZN(n394) );
  NR2D1BWP16P90LVT U334 ( .A1(n125), .A2(n130), .ZN(n46) );
  INVD2BWP16P90LVT U335 ( .I(a[0]), .ZN(n303) );
  IOA21D1BWP16P90LVT U336 ( .A1(n444), .A2(n97), .B(n96), .ZN(n442) );
  XNR2D1BWP16P90LVT U337 ( .A1(b[1]), .A2(a[7]), .ZN(n236) );
  XNR2D1BWP16P90LVT U338 ( .A1(b[1]), .A2(a[5]), .ZN(n245) );
  CKNR2D1BWP16P90LVT U339 ( .A1(n229), .A2(n287), .ZN(n183) );
  XNR2D4BWP16P90LVT U340 ( .A1(a[4]), .A2(a[3]), .ZN(n284) );
  XOR2D2BWP16P90LVT U341 ( .A1(n397), .A2(n375), .Z(n156) );
  CKND1BWP16P90LVT U342 ( .I(a[6]), .ZN(n436) );
  NR2D1BWP20P90LVT U343 ( .A1(n37), .A2(n30), .ZN(n28) );
  CKND1BWP16P90LVT U344 ( .I(n18), .ZN(product[1]) );
  XOR2D1BWP16P90LVT U345 ( .A1(n15), .A2(n86), .Z(product[4]) );
  XOR2D1BWP16P90LVT U346 ( .A1(n362), .A2(n12), .Z(product[7]) );
  OR2D1BWP16P90LVT U347 ( .A1(n116), .A2(n115), .Z(n347) );
  XOR3D2BWP16P90LVT U348 ( .A1(n140), .A2(n133), .A3(n138), .Z(n350) );
  OR2D2BWP16P90LVT U349 ( .A1(n261), .A2(n415), .Z(n386) );
  XOR3D2BWP16P90LVT U350 ( .A1(n142), .A2(n205), .A3(n181), .Z(n354) );
  ND2D1BWP16P90LVT U351 ( .A1(n147), .A2(n149), .ZN(n464) );
  ND2D2BWP16P90LVT U352 ( .A1(n124), .A2(n121), .ZN(n40) );
  XOR3D2BWP16P90LVT U353 ( .A1(n218), .A2(n203), .A3(n170), .Z(n376) );
  ND2D2BWP16P90LVT U354 ( .A1(n417), .A2(n418), .ZN(n145) );
  CKND1BWP16P90LVT U355 ( .I(n107), .ZN(n348) );
  ND2D1BWP16P90LVT U356 ( .A1(n153), .A2(n149), .ZN(n465) );
  XNR2D4BWP16P90LVT U357 ( .A1(n149), .A2(n153), .ZN(n349) );
  ND3D4BWP16P90LVT U358 ( .A1(n404), .A2(n405), .A3(n406), .ZN(n153) );
  CKND2BWP16P90LVT U359 ( .I(n249), .ZN(n359) );
  ND2D1BWP16P90LVT U360 ( .A1(n376), .A2(n171), .ZN(n82) );
  OAI22D2BWP16P90LVT U361 ( .A1(n233), .A2(n278), .B1(n232), .B2(n283), .ZN(
        n189) );
  XNR2D2BWP16P90LVT U362 ( .A1(a[1]), .A2(b[2]), .ZN(n262) );
  AOI21D2BWP16P90LVT U363 ( .A1(n448), .A2(n442), .B(n88), .ZN(n86) );
  FA1D2BWP16P90LVT U364 ( .A(n423), .B(n182), .CI(n206), .CO(n140), .S(n141)
         );
  OAI22D1BWP16P90LVT U365 ( .A1(n250), .A2(n428), .B1(n249), .B2(n285), .ZN(
        n351) );
  INVD1BWP16P90 U366 ( .I(n67), .ZN(n352) );
  CKND1BWP16P90LVT U367 ( .I(n352), .ZN(n353) );
  OAI22D1BWP16P90LVT U368 ( .A1(n250), .A2(n428), .B1(n249), .B2(n285), .ZN(
        n208) );
  CKOR2D4BWP16P90LVT U369 ( .A1(n164), .A2(n167), .Z(n446) );
  CKOR2D4BWP16P90LVT U370 ( .A1(n260), .A2(n303), .Z(n387) );
  ND2D1BWP16P90LVT U371 ( .A1(b[7]), .A2(a[3]), .ZN(n419) );
  ND3D1BWP16P90LVT U372 ( .A1(n344), .A2(n192), .A3(n175), .ZN(n405) );
  XOR2D2BWP16P90LVT U373 ( .A1(n344), .A2(n175), .Z(n162) );
  OAI31D2BWP16P90LVT U374 ( .A1(n355), .A2(n356), .A3(n403), .B(n390), .ZN(
        n154) );
  INVD1BWP16P90 U375 ( .I(n344), .ZN(n355) );
  INVD1BWP16P90 U376 ( .I(n175), .ZN(n356) );
  AN2D2BWP16P90LVT U377 ( .A1(n211), .A2(n176), .Z(n169) );
  INR2D2BWP16P90LVT U378 ( .A1(n357), .B1(n120), .ZN(n30) );
  CKND1BWP16P90LVT U379 ( .I(n117), .ZN(n357) );
  OAI22D2BWP16P90LVT U380 ( .A1(n234), .A2(n278), .B1(n283), .B2(n233), .ZN(
        n190) );
  IND2D1BWP16P90LVT U381 ( .A1(n358), .B1(n148), .ZN(n455) );
  INVD1BWP16P90LVT U382 ( .I(n190), .ZN(n358) );
  NR3D1BWP16P90LVT U383 ( .A1(n30), .A2(n46), .A3(n37), .ZN(n440) );
  IND2D2BWP16P90LVT U384 ( .A1(n428), .B1(n359), .ZN(n421) );
  ND2D2BWP16P90LVT U385 ( .A1(n360), .A2(n361), .ZN(n445) );
  CKND2BWP16P90LVT U386 ( .I(n168), .ZN(n360) );
  CKND1BWP16P90LVT U387 ( .I(n171), .ZN(n361) );
  CKND2BWP16P90LVT U388 ( .I(n76), .ZN(n74) );
  INVD1BWP16P90 U389 ( .I(n49), .ZN(n363) );
  INVD1BWP16P90 U390 ( .I(n409), .ZN(n68) );
  ND2D1BWP16P90LVT U391 ( .A1(n141), .A2(n139), .ZN(n457) );
  INR2D2BWP16P90LVT U392 ( .A1(b[4]), .B1(n287), .ZN(n128) );
  XOR2D4BWP16P90LVT U393 ( .A1(n197), .A2(n189), .Z(n410) );
  XOR2D4BWP16P90LVT U394 ( .A1(n199), .A2(n191), .Z(n364) );
  XOR2D2BWP16P90LVT U395 ( .A1(n364), .A2(n345), .Z(n147) );
  ND2D1BWP16P90LVT U396 ( .A1(n191), .A2(n199), .ZN(n367) );
  ND3D4BWP16P90LVT U397 ( .A1(n366), .A2(n365), .A3(n367), .ZN(n146) );
  OAI21D1BWP16P90LVT U398 ( .A1(n63), .A2(n67), .B(n64), .ZN(n368) );
  XOR2D4BWP16P90LVT U399 ( .A1(n192), .A2(n200), .Z(n403) );
  XNR2D2BWP16P90LVT U400 ( .A1(b[5]), .A2(a[3]), .ZN(n250) );
  INR2D2BWP16P90 U401 ( .A1(b[5]), .B1(n287), .ZN(n180) );
  XNR2D2BWP16P90LVT U402 ( .A1(n166), .A2(n447), .ZN(n164) );
  OAI21D1BWP16P90 U403 ( .A1(n47), .A2(n37), .B(n40), .ZN(n36) );
  NR2D1BWP16P90LVT U404 ( .A1(n46), .A2(n37), .ZN(n35) );
  CKND2D4BWP16P90LVT U405 ( .A1(n422), .A2(n421), .ZN(n207) );
  BUFFD2BWP16P90LVT U406 ( .I(n59), .Z(n370) );
  OAI22D1BWP16P90 U407 ( .A1(n245), .A2(n279), .B1(n244), .B2(n284), .ZN(n202)
         );
  CKND2BWP16P90LVT U408 ( .I(b[6]), .ZN(n378) );
  IOA21D4BWP16P90LVT U409 ( .A1(n445), .A2(n83), .B(n82), .ZN(n443) );
  ND2D1BWP16P90 U410 ( .A1(n451), .A2(n82), .ZN(n14) );
  XOR3D1BWP16P90LVT U411 ( .A1(n204), .A2(n219), .A3(n212), .Z(n371) );
  XNR2D2BWP16P90 U412 ( .A1(n14), .A2(n83), .ZN(product[5]) );
  OAI22D1BWP16P90LVT U413 ( .A1(n246), .A2(n279), .B1(n245), .B2(n284), .ZN(
        n203) );
  XNR2D2BWP16P90LVT U414 ( .A1(n466), .A2(a[5]), .ZN(n246) );
  OAI21D1BWP16P90LVT U415 ( .A1(n68), .A2(n348), .B(n353), .ZN(n65) );
  ND2D2BWP16P90LVT U416 ( .A1(n416), .A2(n462), .ZN(n417) );
  ND2D1BWP16P90LVT U417 ( .A1(n395), .A2(n188), .ZN(n392) );
  ND2D2BWP16P90LVT U418 ( .A1(n425), .A2(n426), .ZN(n243) );
  ND2D1BWP16P90LVT U419 ( .A1(n146), .A2(n139), .ZN(n458) );
  XNR2D2BWP16P90LVT U420 ( .A1(b[5]), .A2(a[5]), .ZN(n241) );
  OAI22D1BWP16P90 U421 ( .A1(n233), .A2(n278), .B1(n232), .B2(n283), .ZN(n372)
         );
  OAI22D1BWP16P90 U422 ( .A1(n233), .A2(n278), .B1(n232), .B2(n283), .ZN(n373)
         );
  XNR2D2BWP16P90LVT U423 ( .A1(b[4]), .A2(a[7]), .ZN(n233) );
  OAI21D2BWP16P90LVT U424 ( .A1(n84), .A2(n86), .B(n85), .ZN(n83) );
  XNR2D2BWP16P90LVT U425 ( .A1(b[2]), .A2(a[7]), .ZN(n235) );
  OR2D2BWP16P90LVT U426 ( .A1(n248), .A2(n285), .Z(n422) );
  ND2D2BWP16P90LVT U427 ( .A1(n424), .A2(n437), .ZN(n426) );
  INVD1BWP16P90 U428 ( .I(n427), .ZN(n106) );
  INVD1BWP16P90 U429 ( .I(n215), .ZN(n374) );
  INVD1BWP16P90LVT U430 ( .I(n374), .ZN(n375) );
  NR2D1BWP16P90 U431 ( .A1(n346), .A2(n287), .ZN(n179) );
  XOR2D2BWP16P90 U432 ( .A1(n385), .A2(n9), .Z(product[10]) );
  OR2D1BWP16P90LVT U433 ( .A1(n257), .A2(n415), .Z(n401) );
  ND2D1BWP16P90LVT U434 ( .A1(b[6]), .A2(a[3]), .ZN(n379) );
  ND2D2BWP16P90LVT U435 ( .A1(n378), .A2(n289), .ZN(n380) );
  ND2D2BWP16P90LVT U436 ( .A1(n379), .A2(n380), .ZN(n249) );
  ND2D2BWP16P90LVT U437 ( .A1(n407), .A2(n408), .ZN(n200) );
  OR2D2BWP16P90LVT U438 ( .A1(n242), .A2(n284), .Z(n408) );
  CKND2BWP16P90LVT U439 ( .I(n128), .ZN(n129) );
  CKNR2D2BWP16P90LVT U440 ( .A1(n145), .A2(n151), .ZN(n63) );
  CKND2BWP16P90LVT U441 ( .I(b[3]), .ZN(n424) );
  OR2D2BWP16P90LVT U442 ( .A1(n243), .A2(n279), .Z(n407) );
  INVD1BWP16P90LVT U443 ( .I(n147), .ZN(n416) );
  ND2D1BWP16P90 U444 ( .A1(n340), .A2(n192), .ZN(n406) );
  ND2D1BWP16P90 U445 ( .A1(n391), .A2(n363), .ZN(n7) );
  CKND2BWP16P90LVT U446 ( .I(n47), .ZN(n49) );
  INVD1BWP16P90 U447 ( .I(n37), .ZN(n102) );
  NR2D2BWP16P90LVT U448 ( .A1(n124), .A2(n121), .ZN(n37) );
  XNR2D2BWP16P90 U449 ( .A1(a[7]), .A2(b[7]), .ZN(n230) );
  INVD1BWP16P90LVT U450 ( .I(b[7]), .ZN(n223) );
  NR2D2BWP16P90LVT U451 ( .A1(n424), .A2(n287), .ZN(n181) );
  DEL025D1BWP16P90 U452 ( .I(n445), .Z(n451) );
  CKNR2D2BWP16P90LVT U453 ( .A1(n145), .A2(n151), .ZN(n427) );
  XOR2D2BWP16P90LVT U454 ( .A1(n452), .A2(n139), .Z(n137) );
  XOR2D4BWP16P90LVT U455 ( .A1(n141), .A2(n146), .Z(n452) );
  ND2D2BWP16P90LVT U456 ( .A1(n449), .A2(n157), .ZN(n67) );
  INR2D2BWP16P90 U457 ( .A1(n342), .B1(n287), .ZN(n118) );
  XNR2D2BWP16P90LVT U458 ( .A1(b[6]), .A2(a[1]), .ZN(n258) );
  XNR2D2BWP16P90LVT U459 ( .A1(b[6]), .A2(a[5]), .ZN(n240) );
  XNR2D2BWP16P90 U460 ( .A1(b[6]), .A2(a[7]), .ZN(n231) );
  DEL025D1BWP16P90LVT U461 ( .I(n443), .Z(n396) );
  AO21D2BWP16P90LVT U462 ( .A1(n280), .A2(n285), .B(n289), .Z(n205) );
  ND2D4BWP16P90LVT U463 ( .A1(n433), .A2(n434), .ZN(n285) );
  ND3D2BWP16P90LVT U464 ( .A1(n411), .A2(n412), .A3(n413), .ZN(n132) );
  ND2D1BWP16P90LVT U465 ( .A1(n135), .A2(n197), .ZN(n411) );
  INVD1BWP16P90 U466 ( .I(n66), .ZN(n107) );
  XNR2D2BWP16P90 U467 ( .A1(b[3]), .A2(a[7]), .ZN(n234) );
  OAI22D2BWP16P90LVT U468 ( .A1(n252), .A2(n428), .B1(n251), .B2(n285), .ZN(
        n210) );
  XNR2D2BWP16P90LVT U469 ( .A1(b[5]), .A2(a[7]), .ZN(n232) );
  XNR2D2BWP16P90LVT U470 ( .A1(b[7]), .A2(a[5]), .ZN(n239) );
  XOR2D4BWP16P90LVT U471 ( .A1(n211), .A2(n176), .Z(n170) );
  OAI22D4BWP16P90LVT U472 ( .A1(n253), .A2(n428), .B1(n252), .B2(n285), .ZN(
        n211) );
  XNR2D2BWP16P90LVT U473 ( .A1(b[2]), .A2(a[3]), .ZN(n253) );
  XOR2D4BWP16P90LVT U474 ( .A1(n165), .A2(n162), .Z(n381) );
  XOR2D4BWP16P90LVT U475 ( .A1(n381), .A2(n160), .Z(n158) );
  ND2D1BWP16P90 U476 ( .A1(n160), .A2(n162), .ZN(n382) );
  ND2D1BWP16P90 U477 ( .A1(n160), .A2(n165), .ZN(n383) );
  ND2D1BWP16P90 U478 ( .A1(n162), .A2(n165), .ZN(n384) );
  ND3D1BWP16P90LVT U479 ( .A1(n382), .A2(n383), .A3(n384), .ZN(n157) );
  AOI21D2BWP16P90LVT U480 ( .A1(n409), .A2(n61), .B(n368), .ZN(n385) );
  AOI21D1BWP16P90LVT U481 ( .A1(n61), .A2(n409), .B(n62), .ZN(n435) );
  OAI21D2BWP16P90LVT U482 ( .A1(n63), .A2(n67), .B(n64), .ZN(n62) );
  OAI21D4BWP16P90LVT U483 ( .A1(n72), .A2(n70), .B(n71), .ZN(n409) );
  XNR2D2BWP16P90LVT U484 ( .A1(b[4]), .A2(a[1]), .ZN(n260) );
  XOR2D4BWP16P90LVT U485 ( .A1(n149), .A2(n153), .Z(n462) );
  ND2D1BWP16P90 U486 ( .A1(n147), .A2(n153), .ZN(n463) );
  XNR2D2BWP16P90LVT U487 ( .A1(b[4]), .A2(a[5]), .ZN(n242) );
  NR2D2BWP16P90LVT U488 ( .A1(n55), .A2(n58), .ZN(n3) );
  NR2D2BWP16P90LVT U489 ( .A1(n137), .A2(n450), .ZN(n58) );
  FA1D4BWP16P90LVT U490 ( .A(n423), .B(n183), .CI(n207), .CO(n148), .S(n149)
         );
  NR2D2BWP16P90LVT U491 ( .A1(n158), .A2(n163), .ZN(n70) );
  NR2D1BWP16P90LVT U492 ( .A1(n427), .A2(n66), .ZN(n388) );
  NR2D2BWP16P90LVT U493 ( .A1(n152), .A2(n157), .ZN(n66) );
  INVD1BWP16P90LVT U494 ( .I(n369), .ZN(n389) );
  XOR3D4BWP16P90LVT U495 ( .A1(n129), .A2(n196), .A3(n188), .Z(n127) );
  ND2D1BWP16P90 U496 ( .A1(n395), .A2(n129), .ZN(n393) );
  ND3D2BWP16P90LVT U497 ( .A1(n392), .A2(n393), .A3(n394), .ZN(n126) );
  OAI22D1BWP16P90LVT U498 ( .A1(n239), .A2(n279), .B1(n284), .B2(n437), .ZN(
        n395) );
  OAI22D2BWP16P90LVT U499 ( .A1(n232), .A2(n278), .B1(n231), .B2(n283), .ZN(
        n188) );
  OAI21D2BWP16P90LVT U500 ( .A1(n59), .A2(n55), .B(n56), .ZN(n2) );
  ND2D2BWP16P90LVT U501 ( .A1(n144), .A2(n137), .ZN(n59) );
  XOR2D2BWP16P90LVT U502 ( .A1(n208), .A2(n184), .Z(n397) );
  ND2D1BWP16P90LVT U503 ( .A1(n215), .A2(n351), .ZN(n398) );
  ND2D1BWP16P90LVT U504 ( .A1(n215), .A2(n184), .ZN(n399) );
  ND2D1BWP16P90LVT U505 ( .A1(n351), .A2(n184), .ZN(n400) );
  OR2D1BWP16P90LVT U506 ( .A1(n290), .A2(n303), .Z(n402) );
  ND2D2BWP16P90LVT U507 ( .A1(n401), .A2(n402), .ZN(n215) );
  INR2D2BWP16P90 U508 ( .A1(n466), .B1(n287), .ZN(n184) );
  XNR2D2BWP16P90LVT U509 ( .A1(b[7]), .A2(a[1]), .ZN(n257) );
  ND2D1BWP16P90LVT U510 ( .A1(n369), .A2(n340), .ZN(n404) );
  ND2D4BWP16P90LVT U511 ( .A1(n275), .A2(n284), .ZN(n279) );
  XNR2D2BWP16P90LVT U512 ( .A1(b[4]), .A2(a[3]), .ZN(n251) );
  NR2D2BWP16P90LVT U513 ( .A1(n427), .A2(n66), .ZN(n61) );
  BUFFD8BWP16P90LVT U514 ( .I(b[0]), .Z(n466) );
  AOI21D4BWP16P90LVT U515 ( .A1(n443), .A2(n446), .B(n74), .ZN(n72) );
  ND2D1BWP16P90LVT U516 ( .A1(n135), .A2(n373), .ZN(n412) );
  ND2D1BWP16P90 U517 ( .A1(n197), .A2(n372), .ZN(n413) );
  INVD1BWP16P90 U518 ( .I(n281), .ZN(n414) );
  OAI22D4BWP16P90LVT U519 ( .A1(n247), .A2(n284), .B1(n279), .B2(n437), .ZN(
        n176) );
  ND2D2BWP16P90LVT U520 ( .A1(n349), .A2(n147), .ZN(n418) );
  ND2D2BWP16P90LVT U521 ( .A1(n223), .A2(n289), .ZN(n420) );
  ND2D2BWP16P90LVT U522 ( .A1(n419), .A2(n420), .ZN(n248) );
  INR2D2BWP16P90LVT U523 ( .A1(n466), .B1(n284), .ZN(n204) );
  AO21D4BWP16P90LVT U524 ( .A1(n279), .A2(n284), .B(n437), .Z(n195) );
  AOI21D1BWP16P90LVT U525 ( .A1(n388), .A2(n409), .B(n62), .ZN(n1) );
  NR2D2BWP16P90LVT U526 ( .A1(n131), .A2(n377), .ZN(n55) );
  ND2D1BWP16P90LVT U527 ( .A1(n276), .A2(n285), .ZN(n280) );
  AOI21D1BWP16P90LVT U528 ( .A1(n281), .A2(n303), .B(n290), .ZN(n423) );
  NR2D1BWP16P90LVT U529 ( .A1(n244), .A2(n279), .ZN(n429) );
  XNR2D1BWP16P90LVT U530 ( .A1(b[2]), .A2(a[5]), .ZN(n244) );
  ND2D1BWP16P90LVT U531 ( .A1(a[2]), .A2(a[1]), .ZN(n433) );
  ND2D1BWP16P90LVT U532 ( .A1(n431), .A2(n432), .ZN(n434) );
  INVD1BWP16P90LVT U533 ( .I(a[2]), .ZN(n431) );
  INVD1BWP16P90LVT U534 ( .I(a[1]), .ZN(n432) );
  NR2D1BWP16P90LVT U535 ( .A1(n243), .A2(n284), .ZN(n430) );
  INVD1BWP16P90 U536 ( .I(n70), .ZN(n108) );
  INR2D1BWP16P90 U537 ( .A1(n466), .B1(n285), .ZN(n214) );
  CKND2D2BWP16P90LVT U538 ( .A1(n436), .A2(n437), .ZN(n439) );
  OAI22D1BWP16P90LVT U539 ( .A1(n248), .A2(n428), .B1(n285), .B2(n289), .ZN(
        n206) );
  OAI22D1BWP16P90LVT U540 ( .A1(n254), .A2(n428), .B1(n253), .B2(n285), .ZN(
        n212) );
  INVD1BWP16P90 U541 ( .I(n30), .ZN(n101) );
  INVD1BWP16P90 U542 ( .I(n58), .ZN(n105) );
  ND2D1BWP16P90LVT U543 ( .A1(n198), .A2(n148), .ZN(n454) );
  XNR2D1BWP16P90LVT U544 ( .A1(n466), .A2(a[7]), .ZN(n237) );
  ND2D4BWP16P90LVT U545 ( .A1(n438), .A2(n439), .ZN(n283) );
  AO21D1BWP16P90 U546 ( .A1(n278), .A2(n283), .B(n287), .Z(n185) );
  XNR2D1BWP16P90 U547 ( .A1(n17), .A2(n97), .ZN(product[2]) );
  INVD1BWP16P90LVT U548 ( .I(n90), .ZN(n88) );
  ND2D1BWP16P90 U549 ( .A1(n446), .A2(n76), .ZN(n13) );
  INVD1BWP16P90 U550 ( .I(n341), .ZN(n111) );
  INR2D1BWP16P90 U551 ( .A1(n466), .B1(n303), .ZN(product[0]) );
  ND2D1BWP16P90LVT U552 ( .A1(a[6]), .A2(a[5]), .ZN(n438) );
  CKND2BWP16P90LVT U553 ( .I(a[5]), .ZN(n437) );
  OAI22D1BWP16P90 U554 ( .A1(n231), .A2(n278), .B1(n230), .B2(n283), .ZN(n187)
         );
  ND2D2BWP16P90LVT U555 ( .A1(n274), .A2(n283), .ZN(n278) );
  OAI22D1BWP16P90 U556 ( .A1(n230), .A2(n278), .B1(n283), .B2(n287), .ZN(n186)
         );
  AO21D1BWP16P90LVT U557 ( .A1(n28), .A2(n49), .B(n29), .Z(n441) );
  ND2D1BWP16P90 U558 ( .A1(n107), .A2(n353), .ZN(n11) );
  INVD1BWP16P90LVT U559 ( .I(n99), .ZN(n97) );
  OR2D1BWP16P90LVT U560 ( .A1(n221), .A2(n214), .Z(n444) );
  XNR2D1BWP16P90 U561 ( .A1(n13), .A2(n396), .ZN(product[6]) );
  XNR2D1BWP16P90 U562 ( .A1(n16), .A2(n442), .ZN(product[3]) );
  OAI22D1BWP16P90LVT U563 ( .A1(n237), .A2(n278), .B1(n236), .B2(n283), .ZN(
        n193) );
  OAI22D1BWP16P90LVT U564 ( .A1(n239), .A2(n279), .B1(n284), .B2(n437), .ZN(
        n196) );
  XOR3D2BWP16P90LVT U565 ( .A1(n198), .A2(n190), .A3(n148), .Z(n139) );
  ND2D1BWP16P90LVT U566 ( .A1(n164), .A2(n167), .ZN(n76) );
  OR2D1BWP16P90LVT U567 ( .A1(n174), .A2(n213), .Z(n448) );
  CKND1BWP16P90LVT U568 ( .I(n118), .ZN(n119) );
  IND2D1BWP16P90 U569 ( .A1(n98), .B1(n99), .ZN(n18) );
  NR2D1BWP16P90 U570 ( .A1(n222), .A2(n178), .ZN(n98) );
  OAI22D1BWP16P90LVT U571 ( .A1(n264), .A2(n415), .B1(n263), .B2(n303), .ZN(
        n222) );
  XNR2D1BWP16P90LVT U572 ( .A1(n466), .A2(a[1]), .ZN(n264) );
  IND2D1BWP16P90LVT U573 ( .A1(n466), .B1(a[7]), .ZN(n238) );
  XOR2D1BWP16P90LVT U574 ( .A1(a[2]), .A2(a[3]), .Z(n276) );
  XNR2D1BWP16P90LVT U575 ( .A1(b[1]), .A2(a[1]), .ZN(n263) );
  XOR2D1BWP16P90LVT U576 ( .A1(a[0]), .A2(a[1]), .Z(n277) );
  INVD1BWP16P90 U577 ( .I(b[1]), .ZN(n229) );
  INR2D1BWP16P90 U578 ( .A1(b[2]), .B1(n287), .ZN(n182) );
  XNR2D1BWP16P90LVT U579 ( .A1(b[5]), .A2(a[1]), .ZN(n259) );
  XNR2D1BWP16P90 U580 ( .A1(n466), .A2(a[3]), .ZN(n255) );
  XOR2D1BWP16P90LVT U581 ( .A1(a[4]), .A2(a[5]), .Z(n275) );
  CKND1BWP16P90LVT U582 ( .I(a[1]), .ZN(n290) );
  XOR2D1BWP16P90LVT U583 ( .A1(a[6]), .A2(a[7]), .Z(n274) );
  CKND1BWP16P90LVT U584 ( .I(a[3]), .ZN(n289) );
  CKND1BWP16P90LVT U585 ( .I(a[7]), .ZN(n287) );
  XOR3D2BWP16P90LVT U586 ( .A1(n185), .A2(n179), .A3(n118), .Z(n115) );
  INVD1BWP16P90 U587 ( .I(n2), .ZN(n54) );
  OAI21D1BWP16P90LVT U588 ( .A1(n435), .A2(n53), .B(n54), .ZN(n52) );
  XOR3D1BWP16P90LVT U589 ( .A1(n159), .A2(n156), .A3(n154), .Z(n449) );
  ND3D1BWP16P90LVT U590 ( .A1(n463), .A2(n464), .A3(n465), .ZN(n450) );
  XOR2D1BWP16P90LVT U591 ( .A1(n11), .A2(n68), .Z(product[8]) );
  INVD1BWP16P90LVT U592 ( .I(n3), .ZN(n53) );
  INVD1BWP16P90 U593 ( .I(n55), .ZN(n104) );
  ND2D1BWP16P90LVT U594 ( .A1(n198), .A2(n190), .ZN(n453) );
  ND2D1BWP16P90 U595 ( .A1(n141), .A2(n146), .ZN(n456) );
  FA1D1BWP16P90LVT U596 ( .A(n194), .B(n210), .CI(n217), .CO(n165), .S(n166)
         );
  IND2D1BWP16P90LVT U597 ( .A1(n466), .B1(a[3]), .ZN(n256) );
  IND2D4BWP16P90LVT U598 ( .A1(n466), .B1(a[5]), .ZN(n247) );
  IND2D1BWP16P90LVT U599 ( .A1(n466), .B1(a[1]), .ZN(n265) );
  ND2D1BWP16P90 U600 ( .A1(n343), .A2(n169), .ZN(n459) );
  ND2D1BWP16P90 U601 ( .A1(n343), .A2(n202), .ZN(n460) );
  ND2D1BWP16P90 U602 ( .A1(n169), .A2(n202), .ZN(n461) );
  ND3D1BWP16P90LVT U603 ( .A1(n459), .A2(n460), .A3(n461), .ZN(n163) );
  ND3D1BWP16P90LVT U604 ( .A1(n463), .A2(n464), .A3(n465), .ZN(n144) );
  XNR2D1BWP16P90LVT U605 ( .A1(n52), .A2(n7), .ZN(product[12]) );
  XNR2D1BWP16P90LVT U606 ( .A1(n21), .A2(n4), .ZN(product[15]) );
  XNR2D1BWP16P90LVT U607 ( .A1(n65), .A2(n10), .ZN(product[9]) );
  XNR2D1BWP16P90LVT U608 ( .A1(n32), .A2(n5), .ZN(product[14]) );
  OAI21D1BWP16P90LVT U609 ( .A1(n435), .A2(n33), .B(n34), .ZN(n32) );
  AOI21D1BWP16P90LVT U610 ( .A1(n2), .A2(n35), .B(n36), .ZN(n34) );
  AOI21D1BWP16P90LVT U611 ( .A1(n2), .A2(n391), .B(n49), .ZN(n43) );
  AOI21D1BWP16P90LVT U612 ( .A1(n2), .A2(n440), .B(n441), .ZN(n23) );
  XNR2D1BWP16P90LVT U613 ( .A1(n41), .A2(n6), .ZN(product[13]) );
  XNR2D1BWP16P90LVT U614 ( .A1(n57), .A2(n8), .ZN(product[11]) );
  XNR2D1BWP16P90LVT U615 ( .A1(b[1]), .A2(a[3]), .ZN(n254) );
endmodule


module second_stage ( sum, c, clk, reset, second_stage_result );
  input [7:0] sum;
  input [7:0] c;
  output [15:0] second_stage_result;
  input clk, reset;

  wire   [15:0] product;

  D_FF_16 dff16 ( .d(product), .clk(clk), .reset(reset), .q(
        second_stage_result) );
  second_stage_DW_mult_uns_2 mult_34 ( .a(c), .b(sum), .product(product) );
endmodule


module hw2_pipe ( a, b, c, s, clk, reset, second_stage_result );
  input [7:0] a;
  input [7:0] b;
  input [7:0] c;
  output [15:0] second_stage_result;
  input s, clk, reset;

  wire   [7:0] first_stage_result;

  first_stage fs ( .a(a), .b(b), .s(s), .clk(clk), .reset(reset), 
        .first_stage_result(first_stage_result) );
  second_stage ss ( .sum(first_stage_result), .c(c), .clk(clk), .reset(reset), 
        .second_stage_result(second_stage_result) );
endmodule

