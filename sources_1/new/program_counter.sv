`timescale 1ns / 1ps

module program_counter #(parameter WIDTH = 32)(
    input logic [WIDTH-1:0]data_in,
    input logic clk,
    input logic reset_n,
    output logic [WIDTH-1:0]data_o
    );
    
    always @ (posedge clk, negedge reset_n)
    begin
        if(!reset_n)
            data_o <= 'b0;
        else
            data_o <= data_in;
    end            
    
endmodule