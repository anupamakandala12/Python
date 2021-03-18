`timescale 1ns / 1ps

module top(
    input clk,
    input wea,
    input [2:0] addr,
    input [7:0]data_in,
    output [7:0]data_out,
    output reg [8:0] sum = 0
    );
    
    
    blk_mem_gen_0 your_instance_name (
      .clka(clk),    // input wire clka
      .wea(wea),      // input wire [0 : 0] wea
      .addra(addr),  // input wire [2 : 0] addra
      .dina(data_in),    // input wire [7 : 0] dina
      .douta(data_out)  // output wire [7 : 0] douta
    );
    
   always @(posedge clk)
   sum = sum + data_out; 
endmodule
