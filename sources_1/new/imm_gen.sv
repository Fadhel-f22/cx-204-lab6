`timescale 1ns / 1ps


module imm_gen(
    input logic [31:0]inst,
    output logic [31:0]imm
    );
    
    
always@(*)
begin
    case(inst[6:0])  //opcode
    7'b0010011: imm = {{20{inst[31]}}, inst[31:20]};    //I-type 
    7'b0100011: imm = {{20{inst[31]}}, inst[31:25], inst[11:7]};    //S-type 
    7'b1100011: imm = {{19{inst[31]}}, inst[31], inst[7] ,inst[30:25], inst[11:8], 1'b0};    //B-type
    endcase
end
endmodule
