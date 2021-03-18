module conv_tb;

    reg [71:0] A;
    reg [71:0] B;
    wire [71:0] C;

    conv uut (
        .A(A), 
        .B(B), 
        .C(C)
    );

    initial begin
        A = {4'd0,4'd1,4'd2,4'd3,4'd4,4'd0,4'd0,4'd0,4'd0};
        B = {4'd9,4'd8,4'd7,4'd6,4'd5,4'd0,4'd0,4'd0,4'd0};
#10 
        A = {4'd11,4'd3,4'd2,4'd1,4'd0,4'd0,4'd0,4'd0,4'd0};
        B = {4'd5,4'd6,4'd7,4'd8,4'd9,4'd0,4'd0,4'd0,4'd0};
#10 $finish;
    end
      
endmodule