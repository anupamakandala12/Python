module alu (
	input [7:0] a,b,
	input [2:0]sel,
	output reg [8:0] c
	);

parameter sign = 7, final_sign = 8;

reg [6:0] temp_a,temp_b;



always @(*) 
begin

temp_a <= a[6:0];
temp_b <= b[6:0];

	case (sel)
	3'd0 : begin
			if(a[sign] == b[sign])
			begin
			c <= temp_a+temp_b;
			c[final_sign] <= a[sign];	
			end
			
			else begin
				if (temp_a > temp_b)  
				begin 
			 	c <= temp_a - temp_b;
			 	c[final_sign] <= a[sign];  
			 	end
				else 
				begin
				c <= temp_b - temp_a;
				c[final_sign] <= b[sign];
				end
			end 
		 end

	3'd1 : begin
			if(a[sign] == b[sign])
			begin
				if(a[sign] == 1'b0)
					if(temp_a<temp_b)	
					begin c <= temp_b-temp_a;c[final_sign] <= 1'b1; end		
					else
					begin c <= temp_a-temp_b;c[final_sign] <= 1'b0; end

				else begin
					if(temp_a>temp_b)
					begin c <= temp_a-temp_b; c[final_sign]<=1'b1;end
					else
					begin c <= temp_b-temp_a; c[final_sign]<=1'b0;end			
				 end		
			end

			else begin
				begin c <= temp_a+temp_b; c[final_sign] <= a[sign]; end
			end

		   end

	3'd2 : begin
				if(a[sign] == b[sign])
				begin c <= temp_a*temp_b; c[final_sign] <= 1'b0; end
				else 
				begin c <= temp_a*temp_b; c[final_sign] <= 1'b1; end
			end

	3'd3 : begin
				if(a[sign] == b[sign])
				begin c <= temp_a/temp_b; c[final_sign] <= 1'b0; end
				else 
				begin c <= temp_a/temp_b; c[final_sign] <= 1'b1; end
			end

	3'd4 : c <= (a << 1);
	3'd5 : c <= (a >> 1);

	default : c <= 8'd0;
	endcase
end

endmodule