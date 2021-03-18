module bcd_sub(A, B, C_in, M, F, Cout);
  input [3:0]A,B;
  input C_in, M; // both are 1
  
  output [3:0]F;
  output Cout;
  wire [3:0]W;
  complement_gen C0(B,M,W);
  bcd_adder A0(A, W, C_in, F, Cout);
endmodule

//X3 = X3 = B3M' + B3'B2'B1'M
//X2 = B2M' + (B2'B1 + B2B1') M
//X1 = B1
//X0 = B0M' + B0'M//


module complement_gen(B, M, x);
  input [3:0]B;
  input M;
  output [3:0]x;
  wire w1,w2,w3,w4,w5,w6,w7,w8,w9;
  xor (x[0],B[0],M);
  assign x[1]=B[1];
  xor (w5,B[1],B[2]);
  and(w9,w5,M);
  not (w1,M);
  and (w6,B[2],w1);
  or (x[2],w9,w6);
  not (w2,B[1]);
  not (w3,B[2]);
  not (w4,B[3]);
  and (w8,M,w2,w3,w4);
  and (w7,B[3],w1);
  or (x[3],w8,w7);
endmodule

module bcd_adder( A, B, C_in, F, Cout);
  input [3:0] A, B;
  input C_in;
  output [3:0] F;
  output Cout;
  wire [3:0] Z,S;
  wire k,w1,w2,w3;
  fulladd4 add0(A, B, C_in, Z, k);  //4bit
  and (w1,Z[3],Z[2]);
  and (w2,Z[3],Z[1]);
  or (Cout,k,w1,w2);
  assign S = {1'b0,Cout,Cout,1'b0};
  fulladd4 add1(Z, S,C_in,F,w3);
endmodule

module fulladd4(a, b, c_in, sum, c_out);
  //i/o port declaration
  input [3:0] a, b;
  input  c_in;
  output [3:0] sum;
  output c_out;
  //internal net
  wire c1, c2, c3;
  fulladd fa0(a[0], b[0], c_in, sum[0], c1); //1bit
  fulladd fa1(a[1], b[1], c1, sum[1], c2);
  fulladd fa2(a[2], b[2], c2, sum[2], c3);
  fulladd fa3(a[3], b[3], c3, sum[3], c_out);
endmodule

module fulladd(a, b, c_in,sum, c_out);
  input a, b, c_in;
  output sum, c_out;
  wire s1, c1, c2;
  xor (s1,a, b);
  and ( c1,a, b);
  xor (sum,s1, c_in);
  and (c2,s1, c_in);
  or (c_out,c2, c1);
endmodule