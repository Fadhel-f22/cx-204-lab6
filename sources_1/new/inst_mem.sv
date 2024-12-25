`timescale 1ns / 1ps

module inst_mem #(parameter WIDTH = 32)(
    input logic [31:0] address,
    output logic [31:0] instruction
   );
   
    logic [31:0] Memory [0:255]; 
       
    initial begin
            
        $readmemh("/home/it/cx-204/lab1/support_files/machine.hex", Memory);  // we need to change this file to machine.hex
    
    end
    
    assign instruction = Memory[address[31:2]]; // 0100
        
    // 00100 read ins[1]
    // 01000 read ins[2]
    // 01100 read ins[3]
endmodule