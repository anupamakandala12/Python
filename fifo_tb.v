module tb;
reg clk = 0;
reg reset = 1;
reg read_en=0;
reg write_en=0;
reg [3:0] data_in;
wire[3:0] data_out;
wire full;
wire empty;

my_fifo dut (clk,reset,read_en,write_en,data_in,data_out,full,empty);
always 
#2 clk = !clk;
initial
begin
  #5 reset = 1'b0;
  
   @(negedge clk )
      write_en = 1'b1; data_in = 4'd5;
   @(negedge clk )
      write_en = 1'b1; data_in = 4'd7;
   @(negedge clk )
      write_en = 1'b1; data_in = 4'd11;
   @(negedge clk )
     write_en = 1'b0 ; read_en = 1'b1;
   @(negedge clk)
   read_en = 1'b0;
    
end
endmodule