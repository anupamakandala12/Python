    module tb_pwm();
    reg clk;
    reg [3:0]pwm_duty;
    wire pwm_signal;
    
    
    initial
     begin
     clk<=0;
     forever #5 clk<=~clk;
     end
     
     initial
     begin
     pwm_duty<=4'd0; #1000; 
     pwm_duty<=4'd2; #1000;
     pwm_duty<=4'd6; #1000;
     pwm_duty<=4'd1; #1000;
     pwm_duty<=4'd13;#1000;
     pwm_duty<=4'd15;#1000;
     pwm_duty<=4'd7; #1000;
     end
     
     pwm_gen #(.pwm_period_base_clk(15), .n(3)) pg (.clk(clk),.pwm_duty(pwm_duty),.pwm_signal(pwm_signal));
     
endmodule