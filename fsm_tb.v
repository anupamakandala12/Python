module tb;

reg clk=0;
reg in;
reg rst;
wire out;
wire [3:0]counter;

seq dut (.clk(clk),.in(in), .out(out),.rst(rst),.counter(counter));

always
#2 clk = !clk;

initial
begin
    @(negedge clk) rst = 1;
    @(negedge clk) rst = 0;
	@(negedge clk) in = 1;
	@(negedge clk) in = 0;
	@(negedge clk) in = 1;
	@(negedge clk) in = 1;
	@(negedge clk) in = 0;
	@(negedge clk) in = 1;
	@(negedge clk) in = 1;
	@(negedge clk) in = 0;
	@(negedge clk) in = 1;
	@(negedge clk) in = 1;
end

endmodule