module my_fifo(
input clk,
input reset,
input read_en,
input write_en,
input [3:0] data_in,
output reg [3:0] data_out,
output full,
output empty);
    


reg [3:0] mem [0:4];


reg [2:0]read_pointer,write_pointer; 

always @(posedge clk)
begin
if(reset)
begin
    read_pointer <= 0;
    write_pointer <=  0;
end
else
begin

case({read_en,write_en})

2'b00 : begin end 

2'b01 : begin  
              if(!full)
              begin
              mem[write_pointer] <= data_in;
              write_pointer <= write_pointer + 1;
              end
            end
            
2'b10 : begin 
            if(!empty)
            begin
                data_out <= mem[read_pointer];
                read_pointer <= read_pointer + 1;
            end
        end
        
2'b11 : begin
            data_out <= mem[read_pointer];
            read_pointer <= read_pointer + 1;
            mem[write_pointer] <= data_in;
            write_pointer <= write_pointer + 1;
        end
endcase
end
end

assign empty = (read_pointer == write_pointer) ? 1'b1 :1'b0; 
assign full = (write_pointer == 3'd4) ? 1'b1 : 1'b0;

endmodule