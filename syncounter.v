module counter_4(input rst, input clk, output[3:0] q, output[3:0] q_bar);
    wire J3, K3, J2, K2, J1, K1, J0, K0;

    assign J3 = q[2] & q[1] & q[0];
    assign K3 = q[2] & q[1] & q[0];
    assign J2 = q[1] & q[0];
    assign K2 = q[1] & q[0];
    assign J1 = q[0];
    assign K1 = q[0];
    assign J0 = 1;
    assign K0 = 1;

    JKFF jk1(rst, J3, K3, clk, q[3], q_bar[3]);
    JKFF jk2(rst, J2, K2, clk, q[2], q_bar[2]);
    JKFF jk3(rst, J1, K1, clk, q[1], q_bar[1]);
    JKFF jk4(rst, J0, K0, clk, q[0], q_bar[0]);
endmodule

module JKFF(input rst, input J, input K, input clk, output reg Q, output reg Q_);    

    initial begin
      Q = 0;
      Q_ = ~Q;
    end

    always @(negedge clk) begin
        Q = rst& (J&~Q | ~K&Q);
        Q_ = ~rst | ~Q;
    end

endmodule