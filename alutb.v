module tb();
reg [7:0]a=8'd20;
reg [7:0]b=8'd2;
reg [2:0]sel;
wire [8:0]c;

Alu X( .a(a), .b(b), .c(c) ,.sel(sel));


 initial
 begin
 sel=3'd0;
 #4
 sel=3'd1;
 #4
 sel=3'd2;
 #4
 sel=3'd3;
 #4
 sel=3'd4;
 end
 endmodule
 