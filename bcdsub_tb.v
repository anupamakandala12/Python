module tb( );
  reg [3:0]A,B;
  reg C_in=1;
  reg M=1; // both are 1
  wire [3:0]F;
  wire Cout;
  
bcd_sub X(.A(A), .B(B), .C_in(C_in), .M(M), .F(F), .Cout(Cout));
initial begin
		
		A=4'd5;
		B=4'd3;
		
		
	end
endmodule