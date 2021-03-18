module pwm_gen #(parameter pwm_period_base_clk=15,    //max pulse period wrt base input clk
  parameter n=3)
    (input clk, 
    input [n:0] pwm_duty,
    output reg pwm_signal);
    reg reset=1;
    reg [n:0] dummy_duty;
    reg [n:0] count;
  
    always @ (posedge clk)
    begin
        if(reset)
            begin
                pwm_signal<=0;
                dummy_duty<=0;
                reset<=0;
                count<=0;
            end
        else if (dummy_duty>0)
        begin
            pwm_signal<=1;
            dummy_duty<=dummy_duty-1;
            count<=count+1;
        end
        else if(count<pwm_period_base_clk)
        begin
        pwm_signal<=0;
        count<=count+1;
        end
        else
        begin
        dummy_duty<=pwm_duty;
        count<=0;
        end
        end
endmodule