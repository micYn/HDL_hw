/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : V-2023.12
// Date      : Fri Sep 27 15:11:59 2024
/////////////////////////////////////////////////////////////


module FA_0 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n2, n3, n4;

  CKND12BWP16P90LVT U1 ( .I(b), .ZN(n3) );
  INVD2BWP16P90LVT U2 ( .I(c_in), .ZN(n4) );
  CKND8BWP16P90LVT U3 ( .I(a), .ZN(n2) );
  MAOI222D2BWP16P90LVT U4 ( .A(n2), .B(n3), .C(n4), .ZN(c_out) );
  XOR3D1BWP16P90LVT U5 ( .A1(b), .A2(a), .A3(c_in), .Z(sum) );
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
  OAI22D1BWP16P90LVT U6 ( .A1(n3), .A2(n4), .B1(n2), .B2(n1), .ZN(c_out) );
endmodule


module FA_2 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  OAI22D2BWP16P90LVT U1 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(c_out) );
  XNR2D1BWP16P90 U2 ( .A1(n4), .A2(c_in), .ZN(sum) );
  CKND2BWP16P90LVT U3 ( .I(c_in), .ZN(n3) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_3 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90LVT U1 ( .I(c_in), .Z(n1) );
  ND2D1BWP16P90LVT U2 ( .A1(a), .A2(b), .ZN(n3) );
  XNR2D1BWP16P90LVT U3 ( .A1(n5), .A2(n1), .ZN(sum) );
  ND2D2BWP16P90LVT U4 ( .A1(c_in), .A2(n4), .ZN(n2) );
  ND2D2BWP16P90LVT U5 ( .A1(n2), .A2(n3), .ZN(c_out) );
  INVD1BWP16P90LVT U6 ( .I(n5), .ZN(n4) );
  XNR2D1BWP16P90LVT U7 ( .A1(a), .A2(b), .ZN(n5) );
endmodule


module FA_4 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  XNR2D1BWP16P90LVT U2 ( .A1(n5), .A2(n1), .ZN(sum) );
  INVD4BWP16P90LVT U3 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U4 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_5 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  XNR2D1BWP16P90LVT U2 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD4BWP16P90LVT U3 ( .I(c_in), .ZN(n2) );
  OAI22D4BWP16P90LVT U4 ( .A1(n2), .A2(n5), .B1(n4), .B2(n3), .ZN(c_out) );
  XOR2D1BWP16P90LVT U5 ( .A1(n4), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n4) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n3) );
endmodule


module FA_6 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  XNR2D1BWP16P90LVT U1 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD4BWP16P90LVT U2 ( .I(c_in), .ZN(n4) );
  INVD1BWP16P90 U3 ( .I(n4), .ZN(n1) );
  OAI22D4BWP16P90LVT U4 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_7 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  XNR2D1BWP16P90LVT U2 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD4BWP16P90LVT U3 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U4 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_8 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  XNR2D1BWP16P90LVT U1 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD4BWP16P90LVT U2 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U3 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  INVD1BWP16P90 U4 ( .I(n4), .ZN(n1) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_9 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  XNR2D1BWP16P90LVT U2 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD4BWP16P90LVT U3 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U4 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_10 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  XNR2D1BWP16P90LVT U1 ( .A1(n1), .A2(n5), .ZN(sum) );
  DEL025D1BWP16P90 U2 ( .I(c_in), .Z(n1) );
  INVD4BWP16P90LVT U3 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U4 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_11 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  XOR2D1BWP16P90 U1 ( .A1(n3), .A2(n4), .Z(sum) );
  INVD4BWP16P90LVT U2 ( .I(c_in), .ZN(n3) );
  OAI22D4BWP16P90LVT U3 ( .A1(n3), .A2(n4), .B1(n2), .B2(n1), .ZN(c_out) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_12 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  XOR2D1BWP16P90LVT U1 ( .A1(n1), .A2(n5), .Z(sum) );
  DEL025D1BWP16P90 U2 ( .I(n4), .Z(n1) );
  OAI22D4BWP16P90LVT U3 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  CKND2BWP16P90LVT U4 ( .I(c_in), .ZN(n4) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_13 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  XOR2D1BWP16P90LVT U1 ( .A1(n1), .A2(n5), .Z(sum) );
  DEL025D1BWP16P90 U2 ( .I(n4), .Z(n1) );
  OAI22D2BWP16P90LVT U3 ( .A1(n5), .A2(n4), .B1(n3), .B2(n2), .ZN(c_out) );
  CKND2BWP16P90LVT U4 ( .I(c_in), .ZN(n4) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_14 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  XNR2D1BWP16P90LVT U2 ( .A1(n4), .A2(n1), .ZN(sum) );
  MOAI22D2BWP16P90LVT U3 ( .A1(n3), .A2(n4), .B1(a), .B2(b), .ZN(c_out) );
  CKND2BWP16P90LVT U4 ( .I(c_in), .ZN(n3) );
  XOR2D1BWP16P90LVT U5 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n2) );
endmodule


module FA_15 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  XNR2D1BWP16P90LVT U1 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD4BWP16P90LVT U2 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U3 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  INVD1BWP16P90 U4 ( .I(n4), .ZN(n1) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_16 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  XNR2D1BWP16P90LVT U2 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD4BWP16P90LVT U3 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U4 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_17 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  XNR2D1BWP16P90LVT U2 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD4BWP16P90LVT U3 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U4 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_18 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  XNR2D1BWP16P90LVT U1 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD4BWP16P90LVT U2 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U3 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  INVD1BWP16P90 U4 ( .I(n4), .ZN(n1) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_19 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  XNR2D1BWP16P90LVT U2 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD4BWP16P90LVT U3 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U4 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_20 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  XNR2D1BWP16P90LVT U2 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD4BWP16P90LVT U3 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U4 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_21 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  CKND4BWP16P90LVT U1 ( .I(c_in), .ZN(n4) );
  XNR2D1BWP16P90LVT U2 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD1BWP16P90 U3 ( .I(n4), .ZN(n1) );
  OAI22D4BWP16P90LVT U4 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_22 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  ND2D1BWP16P90LVT U2 ( .A1(a), .A2(b), .ZN(n3) );
  XNR2D1BWP16P90LVT U3 ( .A1(n5), .A2(n1), .ZN(sum) );
  IND2D4BWP16P90LVT U4 ( .A1(n5), .B1(c_in), .ZN(n2) );
  CKND2D4BWP16P90LVT U5 ( .A1(n2), .A2(n3), .ZN(c_out) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n4) );
  XOR2D1BWP16P90LVT U7 ( .A1(n4), .A2(b), .Z(n5) );
endmodule


module FA_23 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  XNR2D1BWP16P90LVT U1 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD4BWP16P90LVT U2 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U3 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  INVD1BWP16P90 U4 ( .I(n4), .ZN(n1) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_24 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  XNR2D1BWP16P90LVT U2 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD4BWP16P90LVT U3 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U4 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_25 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4;

  XNR2D1BWP16P90LVT U1 ( .A1(c_in), .A2(n4), .ZN(sum) );
  INVD4BWP16P90LVT U2 ( .I(c_in), .ZN(n3) );
  OAI22D4BWP16P90LVT U3 ( .A1(n3), .A2(n4), .B1(n2), .B2(n1), .ZN(c_out) );
  XOR2D1BWP16P90LVT U4 ( .A1(n2), .A2(b), .Z(n4) );
  INVD1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
endmodule


module FA_26 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n4) );
  XNR2D1BWP16P90LVT U3 ( .A1(n1), .A2(n5), .ZN(sum) );
  CKND2D4BWP16P90LVT U4 ( .A1(n2), .A2(n3), .ZN(c_out) );
  IND2D4BWP16P90LVT U5 ( .A1(n5), .B1(c_in), .ZN(n2) );
  ND2D1BWP16P90LVT U6 ( .A1(a), .A2(b), .ZN(n3) );
  XOR2D1BWP16P90LVT U7 ( .A1(n4), .A2(b), .Z(n5) );
endmodule


module FA_27 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  XNR2D1BWP16P90LVT U2 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD4BWP16P90LVT U3 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U4 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_28 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  XNR2D1BWP16P90LVT U2 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD4BWP16P90LVT U3 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U4 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_29 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  DEL025D1BWP16P90 U1 ( .I(c_in), .Z(n1) );
  XNR2D1BWP16P90LVT U2 ( .A1(n1), .A2(n5), .ZN(sum) );
  INVD4BWP16P90LVT U3 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U4 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  XOR2D1BWP16P90LVT U5 ( .A1(n3), .A2(b), .Z(n5) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_30 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3, n4, n5;

  XNR2D1BWP16P90LVT U1 ( .A1(n1), .A2(n5), .ZN(sum) );
  XNR2D1BWP16P90LVT U2 ( .A1(a), .A2(b), .ZN(n5) );
  INVD1BWP16P90 U3 ( .I(n4), .ZN(n1) );
  INVD4BWP16P90LVT U4 ( .I(c_in), .ZN(n4) );
  OAI22D4BWP16P90LVT U5 ( .A1(n4), .A2(n5), .B1(n3), .B2(n2), .ZN(c_out) );
  INVD1BWP16P90LVT U6 ( .I(a), .ZN(n3) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n2) );
endmodule


module FA_31 ( sum, c_out, a, b, c_in );
  input a, b, c_in;
  output sum, c_out;
  wire   n1, n2, n3;

  XNR2D1BWP16P90LVT U1 ( .A1(n1), .A2(n3), .ZN(sum) );
  XNR2D8BWP16P90LVT U2 ( .A1(a), .A2(b), .ZN(n3) );
  INVD1BWP16P90 U3 ( .I(n2), .ZN(n1) );
  CKND2BWP16P90LVT U4 ( .I(c_in), .ZN(n2) );
  MOAI22D4BWP16P90LVT U5 ( .A1(n2), .A2(n3), .B1(a), .B2(b), .ZN(c_out) );
endmodule


module adder_structure ( co_s, a, b, c_in );
  output [32:0] co_s;
  input [31:0] a;
  input [31:0] b;
  input c_in;

  wire   [30:0] c;

  FA_0 adder_loop_0__genblk1_fa ( .sum(co_s[0]), .c_out(c[0]), .a(a[0]), .b(
        b[0]), .c_in(c_in) );
  FA_31 adder_loop_1__genblk1_fa ( .sum(co_s[1]), .c_out(c[1]), .a(a[1]), .b(
        b[1]), .c_in(c[0]) );
  FA_30 adder_loop_2__genblk1_fa ( .sum(co_s[2]), .c_out(c[2]), .a(a[2]), .b(
        b[2]), .c_in(c[1]) );
  FA_29 adder_loop_3__genblk1_fa ( .sum(co_s[3]), .c_out(c[3]), .a(a[3]), .b(
        b[3]), .c_in(c[2]) );
  FA_28 adder_loop_4__genblk1_fa ( .sum(co_s[4]), .c_out(c[4]), .a(a[4]), .b(
        b[4]), .c_in(c[3]) );
  FA_27 adder_loop_5__genblk1_fa ( .sum(co_s[5]), .c_out(c[5]), .a(a[5]), .b(
        b[5]), .c_in(c[4]) );
  FA_26 adder_loop_6__genblk1_fa ( .sum(co_s[6]), .c_out(c[6]), .a(a[6]), .b(
        b[6]), .c_in(c[5]) );
  FA_25 adder_loop_7__genblk1_fa ( .sum(co_s[7]), .c_out(c[7]), .a(a[7]), .b(
        b[7]), .c_in(c[6]) );
  FA_24 adder_loop_8__genblk1_fa ( .sum(co_s[8]), .c_out(c[8]), .a(a[8]), .b(
        b[8]), .c_in(c[7]) );
  FA_23 adder_loop_9__genblk1_fa ( .sum(co_s[9]), .c_out(c[9]), .a(a[9]), .b(
        b[9]), .c_in(c[8]) );
  FA_22 adder_loop_10__genblk1_fa ( .sum(co_s[10]), .c_out(c[10]), .a(a[10]), 
        .b(b[10]), .c_in(c[9]) );
  FA_21 adder_loop_11__genblk1_fa ( .sum(co_s[11]), .c_out(c[11]), .a(a[11]), 
        .b(b[11]), .c_in(c[10]) );
  FA_20 adder_loop_12__genblk1_fa ( .sum(co_s[12]), .c_out(c[12]), .a(a[12]), 
        .b(b[12]), .c_in(c[11]) );
  FA_19 adder_loop_13__genblk1_fa ( .sum(co_s[13]), .c_out(c[13]), .a(a[13]), 
        .b(b[13]), .c_in(c[12]) );
  FA_18 adder_loop_14__genblk1_fa ( .sum(co_s[14]), .c_out(c[14]), .a(a[14]), 
        .b(b[14]), .c_in(c[13]) );
  FA_17 adder_loop_15__genblk1_fa ( .sum(co_s[15]), .c_out(c[15]), .a(a[15]), 
        .b(b[15]), .c_in(c[14]) );
  FA_16 adder_loop_16__genblk1_fa ( .sum(co_s[16]), .c_out(c[16]), .a(a[16]), 
        .b(b[16]), .c_in(c[15]) );
  FA_15 adder_loop_17__genblk1_fa ( .sum(co_s[17]), .c_out(c[17]), .a(a[17]), 
        .b(b[17]), .c_in(c[16]) );
  FA_14 adder_loop_18__genblk1_fa ( .sum(co_s[18]), .c_out(c[18]), .a(a[18]), 
        .b(b[18]), .c_in(c[17]) );
  FA_13 adder_loop_19__genblk1_fa ( .sum(co_s[19]), .c_out(c[19]), .a(a[19]), 
        .b(b[19]), .c_in(c[18]) );
  FA_12 adder_loop_20__genblk1_fa ( .sum(co_s[20]), .c_out(c[20]), .a(a[20]), 
        .b(b[20]), .c_in(c[19]) );
  FA_11 adder_loop_21__genblk1_fa ( .sum(co_s[21]), .c_out(c[21]), .a(a[21]), 
        .b(b[21]), .c_in(c[20]) );
  FA_10 adder_loop_22__genblk1_fa ( .sum(co_s[22]), .c_out(c[22]), .a(a[22]), 
        .b(b[22]), .c_in(c[21]) );
  FA_9 adder_loop_23__genblk1_fa ( .sum(co_s[23]), .c_out(c[23]), .a(a[23]), 
        .b(b[23]), .c_in(c[22]) );
  FA_8 adder_loop_24__genblk1_fa ( .sum(co_s[24]), .c_out(c[24]), .a(a[24]), 
        .b(b[24]), .c_in(c[23]) );
  FA_7 adder_loop_25__genblk1_fa ( .sum(co_s[25]), .c_out(c[25]), .a(a[25]), 
        .b(b[25]), .c_in(c[24]) );
  FA_6 adder_loop_26__genblk1_fa ( .sum(co_s[26]), .c_out(c[26]), .a(a[26]), 
        .b(b[26]), .c_in(c[25]) );
  FA_5 adder_loop_27__genblk1_fa ( .sum(co_s[27]), .c_out(c[27]), .a(a[27]), 
        .b(b[27]), .c_in(c[26]) );
  FA_4 adder_loop_28__genblk1_fa ( .sum(co_s[28]), .c_out(c[28]), .a(a[28]), 
        .b(b[28]), .c_in(c[27]) );
  FA_3 adder_loop_29__genblk1_fa ( .sum(co_s[29]), .c_out(c[29]), .a(a[29]), 
        .b(b[29]), .c_in(c[28]) );
  FA_2 adder_loop_30__genblk1_fa ( .sum(co_s[30]), .c_out(c[30]), .a(a[30]), 
        .b(b[30]), .c_in(c[29]) );
  FA_1 adder_loop_31__genblk1_fa ( .sum(co_s[31]), .c_out(co_s[32]), .a(a[31]), 
        .b(b[31]), .c_in(c[30]) );
endmodule

