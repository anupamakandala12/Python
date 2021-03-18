0module test_bench;
	
	reg [71:0] A;
	reg [71:0] B;
	
	wire [71:0] Answer;
	
	matmul (.A(A), .B(B), .Result(Answer));
	
	initial begin
		
		//Initial inputs
		A={8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8,8'd9};
		B={8'd7,8'd3,8'd5,8'd12,8'd11,8'd17,8'd20,8'd3,8'd0};
		
	end
	



endmodule