`timescale 1ns / 1ps


module reg_file (
    input logic clk,
    input logic reset_n,
    input logic reg_write,
    input logic [4:0]raddr1,
    input logic [4:0]raddr2,
    input logic [4:0]waddr,
    input logic [31:0]wdata,
    
    output logic [31 : 0]rdata1,
    output logic [31 : 0]rdata2
    );
    

  logic [31:0] reg_memory [31:0];    // x0, x1, x2, x3
  assign reg_memory[0] = 0;          
//    initial begin
//         $readmemb("/home/it/cx-204/lab1/support_files/fib_rf.mem", reg_memory);
//    end
    
    // for rdata1
    assign rdata1 = reg_memory[raddr1];

    
    // for rdata2               
    assign rdata2 = reg_memory[raddr2];
    

    
    //decoder 
    always @ (posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            for(int i = 1; i < 32;i = i+1) 
                reg_memory[i] <= 0;
        else if(reg_write & (waddr!=0))
            reg_memory[waddr] <= wdata;
    end   
                  
endmodule