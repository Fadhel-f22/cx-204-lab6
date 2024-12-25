`timescale 1ns / 1ps


module data_mem_tb #(parameter WIDTH = 32, parameter DEPTH = 1024);
   logic clk;
   logic reset_n;
   logic mem_write;
   logic [31:0]addr;
   logic [31:0]wdata;
   logic [31:0]rdata;


data_mem #(.WIDTH(WIDTH), .DEPTH(DEPTH)) data_memory (
    .clk(clk),
    .reset_n(reset_n),
    .mem_write(mem_write),
    .addr(addr),
    .wdata(wdata),
    .rdata(rdata)
    ); 

always #5 clk = ~clk;
initial begin
#5
    clk = 1'b0;
    reset_n = 1'b1;
    mem_write = 1'b0;
    addr = 32'b11110000; 
    wdata = 32'b10010010;   
#10
    reset_n = 1'b0;    
#10
    reset_n = 1'b1;
    mem_write = 1'b1;    
#100
$finish;
end
endmodule
