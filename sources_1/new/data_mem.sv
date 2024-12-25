`timescale 1ns / 1ps


module data_mem #(parameter WIDTH = 32, parameter DEPTH = 1024) (
   input logic clk,
   input logic reset_n,
   input logic mem_write,
   input logic [31:0]addr,
   input logic [31:0]wdata,
   output logic [31:0]rdata
    );
 
 int i;
 logic [WIDTH - 1:0] dmem [0 : DEPTH - 1];
 
 always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
        begin  
            for(i=0; i < 1023; i++) 
            begin
            dmem[i] <= 0; 
            end
        end
        else if (mem_write)
            dmem[addr] <= wdata; 
     end
        
        assign rdata = dmem[addr];      
endmodule

