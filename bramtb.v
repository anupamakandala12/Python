`timescale 1ns / 1ps


module tb;

reg clk=0;           
reg wea;           
reg [2:0] addr;    
reg [7:0]data_in;  
wire [7:0]data_out;
wire [8:0]sum;

top dut (
clk,          
wea,          
addr,   
data_in, 
data_out,
sum);

always 
#2 clk = !clk;

initial
begin
wea = 1'b1; addr = 3'd0; data_in = 8'd7;

#4
wea = 1'b1; addr = 3'd1; data_in = 8'd3;
#4
wea = 1'b1; addr = 3'd2; data_in = 8'd1;
#4
wea=1'b0; addr=3'dx; data_in=8'dx;

end


endmodule
