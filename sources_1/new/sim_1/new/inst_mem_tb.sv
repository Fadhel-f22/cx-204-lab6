`timescale 1ns / 1ps


module inst_mem_tb;

    logic [31:0] address;      
    logic [31:0] instruction;
    
inst_mem instruction_memory(
    .address(address),
    .instruction(instruction)
    );  
    
initial begin
#5
    address = 32'b1100;
    
#100
$finish;
end       
endmodule
