/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : V-2023.12
// Date      : Fri Sep 27 17:49:52 2024
/////////////////////////////////////////////////////////////


module FA_0 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  ND2D1BWP16P90LVT U1 ( .A1(n3), .A2(n4), .ZN(n9) );
  ND2D1BWP16P90LVT U2 ( .A1(n1), .A2(n7), .ZN(n4) );
  ND2D1BWP16P90LVT U3 ( .A1(n8), .A2(n2), .ZN(n3) );
  ND2D1BWP16P90LVT U4 ( .A1(c_in), .A2(n10), .ZN(n8) );
  CKND1BWP16P90LVT U5 ( .I(n7), .ZN(n2) );
  CKND4BWP16P90LVT U6 ( .I(b), .ZN(n10) );
  AN2D1BWP16P90LVT U7 ( .A1(c_in), .A2(n10), .Z(n1) );
  NR2D8BWP16P90LVT U8 ( .A1(n6), .A2(a), .ZN(n7) );
  CKND16BWP16P90LVT U9 ( .I(c_in), .ZN(n6) );
  OR2D1BWP16P90LVT U10 ( .A1(n11), .A2(n10), .Z(n5) );
  ND2D2BWP16P90LVT U11 ( .A1(n5), .A2(n9), .ZN(c_out) );
  INVD1BWP16P90LVT U12 ( .I(a), .ZN(n11) );
  XOR3D1BWP16P90LVT U13 ( .A1(b), .A2(a), .A3(c_in), .Z(sum) );
endmodule


module D_FF_32 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module FA_1 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  XNR2D1BWP16P90LVT U1 ( .A1(c_in), .A2(n4), .ZN(sum) );
  XOR2D1BWP16P90LVT U2 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U3 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U4 ( .I(c_in), .ZN(n3) );
  INVD1BWP16P90LVT U5 ( .I(b), .ZN(n1) );
  OAI22D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
endmodule


module FA_2 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3;

  AO22D1BWP16P90LVT U1 ( .A1(c_in), .A2(n1), .B1(a), .B2(b), .Z(c_out) );
  CKND1BWP16P90LVT U2 ( .I(n3), .ZN(n1) );
  XNR2D1BWP16P90LVT U3 ( .A1(n3), .A2(c_in), .ZN(sum) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n3) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
endmodule


module FA_3 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  OAI22D1BWP16P90LVT U1 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
  XNR2D1BWP16P90 U2 ( .A1(n4), .A2(c_in), .ZN(sum) );
  INVD1BWP16P90LVT U3 ( .I(c_in), .ZN(n3) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_4 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  INVD1BWP16P90 U1 ( .I(n4), .ZN(n1) );
  CKND2BWP16P90LVT U2 ( .I(c_in), .ZN(n4) );
  XNR2D1BWP16P90LVT U3 ( .A1(n1), .A2(n5), .ZN(sum) );
  OAI22D1BWP16P90LVT U4 ( .A1(n5), .A2(n4), .B1(n3), .B2(n2), .ZN(c_out) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_5 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  OAI22D2BWP16P90LVT U1 ( .A1(n5), .A2(n4), .B1(n3), .B2(n2), .ZN(c_out) );
  INVD1BWP16P90 U2 ( .I(n4), .ZN(n1) );
  CKND2BWP16P90LVT U3 ( .I(c_in), .ZN(n4) );
  XNR2D1BWP16P90LVT U4 ( .A1(n1), .A2(n5), .ZN(sum) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_6 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  OAI22D1BWP16P90LVT U2 ( .A1(n5), .A2(n4), .B1(n3), .B2(n2), .ZN(c_out) );
  CKND2BWP16P90LVT U3 ( .I(c_in), .ZN(n4) );
  XNR2D1BWP16P90LVT U4 ( .A1(n1), .A2(n5), .ZN(sum) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_7 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  OAI22D4BWP16P90LVT U1 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
  CKND2BWP16P90LVT U2 ( .I(c_in), .ZN(n3) );
  XOR2D1BWP16P90LVT U3 ( .A1(n3), .A2(n4), .Z(sum) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_8 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  OAI22D1BWP16P90LVT U1 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
  XOR2D1BWP16P90 U2 ( .A1(n3), .A2(n4), .Z(sum) );
  CKND1BWP16P90LVT U3 ( .I(c_in), .ZN(n3) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_9 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  XNR2D1BWP16P90LVT U1 ( .A1(c_in), .A2(n4), .ZN(sum) );
  CKND2BWP16P90LVT U2 ( .I(c_in), .ZN(n3) );
  XOR2D1BWP16P90LVT U3 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U4 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U5 ( .I(b), .ZN(n1) );
  OAI22D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
endmodule


module FA_10 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  OAI22D2BWP16P90LVT U1 ( .A1(n5), .A2(n4), .B1(n3), .B2(n2), .ZN(c_out) );
  INVD1BWP16P90 U2 ( .I(n4), .ZN(n1) );
  CKND2BWP16P90LVT U3 ( .I(c_in), .ZN(n4) );
  XNR2D1BWP16P90LVT U4 ( .A1(n1), .A2(n5), .ZN(sum) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_11 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  OAI22D1BWP16P90LVT U1 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
  CKND2BWP16P90LVT U2 ( .I(c_in), .ZN(n3) );
  XNR2D1BWP16P90 U3 ( .A1(c_in), .A2(n4), .ZN(sum) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_12 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  OAI22D2BWP16P90LVT U1 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
  CKND2BWP16P90LVT U2 ( .I(c_in), .ZN(n3) );
  XOR2D1BWP16P90LVT U3 ( .A1(n3), .A2(n4), .Z(sum) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_13 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  INVD1BWP16P90LVT U1 ( .I(c_in), .ZN(n3) );
  XOR2D1BWP16P90LVT U2 ( .A1(n3), .A2(n4), .Z(sum) );
  OAI22D1BWP16P90LVT U3 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_14 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  INVD1BWP16P90LVT U1 ( .I(c_in), .ZN(n3) );
  XNR2D1BWP16P90LVT U2 ( .A1(c_in), .A2(n4), .ZN(sum) );
  XOR2D1BWP16P90LVT U3 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U4 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U5 ( .I(b), .ZN(n1) );
  OAI22D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
endmodule


module FA_15 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  CKND1BWP16P90LVT U2 ( .I(n4), .ZN(n2) );
  AO22D1BWP16P90LVT U3 ( .A1(n2), .A2(c_in), .B1(a), .B2(b), .Z(c_out) );
  XNR2D1BWP16P90 U4 ( .A1(n1), .A2(n4), .ZN(sum) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
endmodule


module FA_16 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  OAI22D2BWP16P90LVT U2 ( .A1(n5), .A2(n4), .B1(n3), .B2(n2), .ZN(c_out) );
  XNR2D1BWP16P90LVT U3 ( .A1(n1), .A2(n5), .ZN(sum) );
  CKND2BWP16P90LVT U4 ( .I(c_in), .ZN(n4) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_17 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  OAI22D2BWP16P90LVT U1 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
  CKND2BWP16P90LVT U2 ( .I(c_in), .ZN(n3) );
  XOR2D1BWP16P90 U3 ( .A1(n3), .A2(n4), .Z(sum) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_18 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  INVD1BWP16P90LVT U1 ( .I(c_in), .ZN(n3) );
  XOR2D1BWP16P90LVT U2 ( .A1(n3), .A2(n4), .Z(sum) );
  OAI22D1BWP16P90LVT U3 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_19 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  INVD1BWP16P90 U1 ( .I(c_in), .ZN(n1) );
  XOR2D1BWP16P90LVT U2 ( .A1(n1), .A2(n5), .Z(sum) );
  XOR2D1BWP16P90LVT U3 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U4 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U5 ( .I(c_in), .ZN(n4) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n2) );
  OAI22D1BWP16P90LVT U7 ( .A1(n5), .A2(n4), .B1(n3), .B2(n2), .ZN(c_out) );
endmodule


module FA_20 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  INVD1BWP16P90LVT U1 ( .I(c_in), .ZN(n3) );
  XNR2D1BWP16P90LVT U2 ( .A1(c_in), .A2(n4), .ZN(sum) );
  XOR2D1BWP16P90LVT U3 ( .A1(n2), .A2(b), .Z(n4) );
  OAI22D1BWP16P90LVT U4 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_21 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  CKND1BWP16P90LVT U2 ( .I(n4), .ZN(n2) );
  AO22D1BWP16P90LVT U3 ( .A1(n2), .A2(c_in), .B1(a), .B2(b), .Z(c_out) );
  XNR2D1BWP16P90 U4 ( .A1(n1), .A2(n4), .ZN(sum) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
endmodule


module FA_22 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  OAI22D2BWP16P90LVT U1 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
  CKND2BWP16P90LVT U2 ( .I(c_in), .ZN(n3) );
  XOR2D1BWP16P90LVT U3 ( .A1(n3), .A2(n4), .Z(sum) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_23 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  INVD1BWP16P90LVT U1 ( .I(c_in), .ZN(n3) );
  XOR2D1BWP16P90LVT U2 ( .A1(n3), .A2(n4), .Z(sum) );
  OAI22D1BWP16P90LVT U3 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_24 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  INVD1BWP16P90 U1 ( .I(c_in), .ZN(n1) );
  XOR2D1BWP16P90LVT U2 ( .A1(n1), .A2(n5), .Z(sum) );
  XOR2D1BWP16P90LVT U3 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U4 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U5 ( .I(c_in), .ZN(n4) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n2) );
  OAI22D1BWP16P90LVT U7 ( .A1(n5), .A2(n4), .B1(n3), .B2(n2), .ZN(c_out) );
endmodule


module FA_25 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  CKND1BWP16P90LVT U1 ( .I(c_in), .ZN(n4) );
  XNR2D1BWP16P90LVT U2 ( .A1(n1), .A2(n5), .ZN(sum) );
  BUFFD1BWP16P90LVT U3 ( .I(c_in), .Z(n1) );
  XOR2D1BWP16P90LVT U4 ( .A1(n3), .A2(b), .Z(n5) );
  OAI22D1BWP16P90LVT U5 ( .A1(n5), .A2(n4), .B1(n3), .B2(n2), .ZN(c_out) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_26 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  OAI22D1BWP16P90LVT U2 ( .A1(n5), .A2(n4), .B1(n3), .B2(n2), .ZN(c_out) );
  CKND2BWP16P90LVT U3 ( .I(c_in), .ZN(n4) );
  XNR2D1BWP16P90LVT U4 ( .A1(n1), .A2(n5), .ZN(sum) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_27 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  OAI22D2BWP16P90LVT U1 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
  CKND2BWP16P90LVT U2 ( .I(c_in), .ZN(n3) );
  XOR2D1BWP16P90LVT U3 ( .A1(n3), .A2(n4), .Z(sum) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_28 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  XNR2D1BWP16P90 U1 ( .A1(c_in), .A2(n4), .ZN(sum) );
  INVD1BWP16P90LVT U2 ( .I(c_in), .ZN(n3) );
  OAI22D1BWP16P90LVT U3 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_29 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  OAI22D1BWP16P90LVT U1 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
  CKND2BWP16P90LVT U2 ( .I(c_in), .ZN(n3) );
  XOR2D1BWP16P90 U3 ( .A1(n3), .A2(n4), .Z(sum) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_30 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  XNR2D1BWP16P90LVT U1 ( .A1(c_in), .A2(n4), .ZN(sum) );
  CKND2BWP16P90LVT U2 ( .I(c_in), .ZN(n3) );
  XOR2D1BWP16P90LVT U3 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U4 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U5 ( .I(b), .ZN(n1) );
  OAI22D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
endmodule


module FA_31 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  CKND1BWP16P90LVT U1 ( .I(c_in), .ZN(n3) );
  XNR2D1BWP16P90LVT U2 ( .A1(c_in), .A2(n4), .ZN(sum) );
  OAI22D2BWP16P90LVT U3 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module D_FF_0 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_1 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_2 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_3 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_4 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_5 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_6 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_7 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_8 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_9 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_10 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_11 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_12 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_13 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_14 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_15 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_16 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_17 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_18 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_19 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_20 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_21 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_22 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_23 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_24 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_25 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_26 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_27 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_28 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_29 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_30 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module D_FF_31 ( q, d, clk );
  input d, clk;
  output q;


  DFQD2BWP16P90LVT q_reg ( .D(d), .CP(clk), .Q(q) );
endmodule


module adder_structure_reg ( q, a, b, c_in, clk );
  output [32:0] q;
  input [31:0] a;
  input [31:0] b;
  input c_in, clk;
  wire   c_out;
  wire   [31:0] sum;
  wire   [30:0] c;

  FA_0 adder_loop_0__genblk1_fa ( .sum(sum[0]), .c_out(c[0]), .a(a[0]), .b(
        b[0]), .c_in(c_in) );
  FA_31 adder_loop_1__genblk1_fa ( .sum(sum[1]), .c_out(c[1]), .a(a[1]), .b(
        b[1]), .c_in(c[0]) );
  FA_30 adder_loop_2__genblk1_fa ( .sum(sum[2]), .c_out(c[2]), .a(a[2]), .b(
        b[2]), .c_in(c[1]) );
  FA_29 adder_loop_3__genblk1_fa ( .sum(sum[3]), .c_out(c[3]), .a(a[3]), .b(
        b[3]), .c_in(c[2]) );
  FA_28 adder_loop_4__genblk1_fa ( .sum(sum[4]), .c_out(c[4]), .a(a[4]), .b(
        b[4]), .c_in(c[3]) );
  FA_27 adder_loop_5__genblk1_fa ( .sum(sum[5]), .c_out(c[5]), .a(a[5]), .b(
        b[5]), .c_in(c[4]) );
  FA_26 adder_loop_6__genblk1_fa ( .sum(sum[6]), .c_out(c[6]), .a(a[6]), .b(
        b[6]), .c_in(c[5]) );
  FA_25 adder_loop_7__genblk1_fa ( .sum(sum[7]), .c_out(c[7]), .a(a[7]), .b(
        b[7]), .c_in(c[6]) );
  FA_24 adder_loop_8__genblk1_fa ( .sum(sum[8]), .c_out(c[8]), .a(a[8]), .b(
        b[8]), .c_in(c[7]) );
  FA_23 adder_loop_9__genblk1_fa ( .sum(sum[9]), .c_out(c[9]), .a(a[9]), .b(
        b[9]), .c_in(c[8]) );
  FA_22 adder_loop_10__genblk1_fa ( .sum(sum[10]), .c_out(c[10]), .a(a[10]), 
        .b(b[10]), .c_in(c[9]) );
  FA_21 adder_loop_11__genblk1_fa ( .sum(sum[11]), .c_out(c[11]), .a(a[11]), 
        .b(b[11]), .c_in(c[10]) );
  FA_20 adder_loop_12__genblk1_fa ( .sum(sum[12]), .c_out(c[12]), .a(a[12]), 
        .b(b[12]), .c_in(c[11]) );
  FA_19 adder_loop_13__genblk1_fa ( .sum(sum[13]), .c_out(c[13]), .a(a[13]), 
        .b(b[13]), .c_in(c[12]) );
  FA_18 adder_loop_14__genblk1_fa ( .sum(sum[14]), .c_out(c[14]), .a(a[14]), 
        .b(b[14]), .c_in(c[13]) );
  FA_17 adder_loop_15__genblk1_fa ( .sum(sum[15]), .c_out(c[15]), .a(a[15]), 
        .b(b[15]), .c_in(c[14]) );
  FA_16 adder_loop_16__genblk1_fa ( .sum(sum[16]), .c_out(c[16]), .a(a[16]), 
        .b(b[16]), .c_in(c[15]) );
  FA_15 adder_loop_17__genblk1_fa ( .sum(sum[17]), .c_out(c[17]), .a(a[17]), 
        .b(b[17]), .c_in(c[16]) );
  FA_14 adder_loop_18__genblk1_fa ( .sum(sum[18]), .c_out(c[18]), .a(a[18]), 
        .b(b[18]), .c_in(c[17]) );
  FA_13 adder_loop_19__genblk1_fa ( .sum(sum[19]), .c_out(c[19]), .a(a[19]), 
        .b(b[19]), .c_in(c[18]) );
  FA_12 adder_loop_20__genblk1_fa ( .sum(sum[20]), .c_out(c[20]), .a(a[20]), 
        .b(b[20]), .c_in(c[19]) );
  FA_11 adder_loop_21__genblk1_fa ( .sum(sum[21]), .c_out(c[21]), .a(a[21]), 
        .b(b[21]), .c_in(c[20]) );
  FA_10 adder_loop_22__genblk1_fa ( .sum(sum[22]), .c_out(c[22]), .a(a[22]), 
        .b(b[22]), .c_in(c[21]) );
  FA_9 adder_loop_23__genblk1_fa ( .sum(sum[23]), .c_out(c[23]), .a(a[23]), 
        .b(b[23]), .c_in(c[22]) );
  FA_8 adder_loop_24__genblk1_fa ( .sum(sum[24]), .c_out(c[24]), .a(a[24]), 
        .b(b[24]), .c_in(c[23]) );
  FA_7 adder_loop_25__genblk1_fa ( .sum(sum[25]), .c_out(c[25]), .a(a[25]), 
        .b(b[25]), .c_in(c[24]) );
  FA_6 adder_loop_26__genblk1_fa ( .sum(sum[26]), .c_out(c[26]), .a(a[26]), 
        .b(b[26]), .c_in(c[25]) );
  FA_5 adder_loop_27__genblk1_fa ( .sum(sum[27]), .c_out(c[27]), .a(a[27]), 
        .b(b[27]), .c_in(c[26]) );
  FA_4 adder_loop_28__genblk1_fa ( .sum(sum[28]), .c_out(c[28]), .a(a[28]), 
        .b(b[28]), .c_in(c[27]) );
  FA_3 adder_loop_29__genblk1_fa ( .sum(sum[29]), .c_out(c[29]), .a(a[29]), 
        .b(b[29]), .c_in(c[28]) );
  FA_2 adder_loop_30__genblk1_fa ( .sum(sum[30]), .c_out(c[30]), .a(a[30]), 
        .b(b[30]), .c_in(c[29]) );
  FA_1 adder_loop_31__genblk1_fa ( .sum(sum[31]), .c_out(c_out), .a(a[31]), 
        .b(b[31]), .c_in(c[30]) );
  D_FF_32 dff_sum_0_ ( .q(q[0]), .d(sum[0]), .clk(clk) );
  D_FF_31 dff_sum_1_ ( .q(q[1]), .d(sum[1]), .clk(clk) );
  D_FF_30 dff_sum_2_ ( .q(q[2]), .d(sum[2]), .clk(clk) );
  D_FF_29 dff_sum_3_ ( .q(q[3]), .d(sum[3]), .clk(clk) );
  D_FF_28 dff_sum_4_ ( .q(q[4]), .d(sum[4]), .clk(clk) );
  D_FF_27 dff_sum_5_ ( .q(q[5]), .d(sum[5]), .clk(clk) );
  D_FF_26 dff_sum_6_ ( .q(q[6]), .d(sum[6]), .clk(clk) );
  D_FF_25 dff_sum_7_ ( .q(q[7]), .d(sum[7]), .clk(clk) );
  D_FF_24 dff_sum_8_ ( .q(q[8]), .d(sum[8]), .clk(clk) );
  D_FF_23 dff_sum_9_ ( .q(q[9]), .d(sum[9]), .clk(clk) );
  D_FF_22 dff_sum_10_ ( .q(q[10]), .d(sum[10]), .clk(clk) );
  D_FF_21 dff_sum_11_ ( .q(q[11]), .d(sum[11]), .clk(clk) );
  D_FF_20 dff_sum_12_ ( .q(q[12]), .d(sum[12]), .clk(clk) );
  D_FF_19 dff_sum_13_ ( .q(q[13]), .d(sum[13]), .clk(clk) );
  D_FF_18 dff_sum_14_ ( .q(q[14]), .d(sum[14]), .clk(clk) );
  D_FF_17 dff_sum_15_ ( .q(q[15]), .d(sum[15]), .clk(clk) );
  D_FF_16 dff_sum_16_ ( .q(q[16]), .d(sum[16]), .clk(clk) );
  D_FF_15 dff_sum_17_ ( .q(q[17]), .d(sum[17]), .clk(clk) );
  D_FF_14 dff_sum_18_ ( .q(q[18]), .d(sum[18]), .clk(clk) );
  D_FF_13 dff_sum_19_ ( .q(q[19]), .d(sum[19]), .clk(clk) );
  D_FF_12 dff_sum_20_ ( .q(q[20]), .d(sum[20]), .clk(clk) );
  D_FF_11 dff_sum_21_ ( .q(q[21]), .d(sum[21]), .clk(clk) );
  D_FF_10 dff_sum_22_ ( .q(q[22]), .d(sum[22]), .clk(clk) );
  D_FF_9 dff_sum_23_ ( .q(q[23]), .d(sum[23]), .clk(clk) );
  D_FF_8 dff_sum_24_ ( .q(q[24]), .d(sum[24]), .clk(clk) );
  D_FF_7 dff_sum_25_ ( .q(q[25]), .d(sum[25]), .clk(clk) );
  D_FF_6 dff_sum_26_ ( .q(q[26]), .d(sum[26]), .clk(clk) );
  D_FF_5 dff_sum_27_ ( .q(q[27]), .d(sum[27]), .clk(clk) );
  D_FF_4 dff_sum_28_ ( .q(q[28]), .d(sum[28]), .clk(clk) );
  D_FF_3 dff_sum_29_ ( .q(q[29]), .d(sum[29]), .clk(clk) );
  D_FF_2 dff_sum_30_ ( .q(q[30]), .d(sum[30]), .clk(clk) );
  D_FF_1 dff_sum_31_ ( .q(q[31]), .d(sum[31]), .clk(clk) );
  D_FF_0 dff_cout ( .q(q[32]), .d(c_out), .clk(clk) );
endmodule

