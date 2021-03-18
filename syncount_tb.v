module counter_tb;
reg clk=1;
reg rst=0; 
wire [3:0]q;
wire [3:0] q_bar;

initial
begin
#5  rst = 1;
#5  rst = 0;
#5  rst = 1;
#5  rst = 0;
#5  rst = 1;
#5  rst = 0;
#5  rst = 1;
#5  rst = 0;
#5  rst = 1;
#5  rst = 0;
#5  rst = 1;
#5  rst = 0;
#5  rst = 1;
#5  rst = 0;
#5  rst = 1;
#5  rst = 0;
   
end

always
#5 clk = ~clk;

counter_4 dut(
rst, 
clk,
q,
q_bar);


endmodule
