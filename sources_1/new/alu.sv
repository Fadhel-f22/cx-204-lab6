`timescale 1ns / 1ps
module alu (
    input logic [31:0] op1,
    input logic [31:0] op2,
    input logic [3:0] alu_ctrl,

    output logic [31:0] alu_result,
    output logic zero
    );
    
    
logic [31:0]add_result;
logic [31:0]sub_result;
logic [31:0]and_result;
logic [31:0]or_result;
logic [31:0]xor_result;
logic [31:0]sll_result;
logic [31:0]srl_result;
logic [31:0]sra_result;
logic [31:0]slt_result;
logic [31:0]sltu_result;


assign add_result = op1 + op2 ;
assign sub_result = op1 - op2 ;
assign or_result  = op1 | op2 ; 
assign and_result = op1 & op2 ;
assign xor_result  = op1 ^ op2 ;
assign sll_result  = op1 << op2 ;
assign srl_result  = op1 >> op2 ;
assign sra_result  = op1 >>> op2 ;
assign slt_result  = ($signed(op1) < $signed(op2)) ? 1 : 0 ;
assign sltu_result  = (op1 < op2) ? 1 : 0 ;



always@(*)
begin
    case(alu_ctrl)
       4'b0000: alu_result = add_result ;
       4'b1000: alu_result = sub_result ;
       4'b0001: alu_result = sll_result ;
       4'b0010: alu_result = slt_result ;
       4'b0011: alu_result = sltu_result ;
       4'b0100: alu_result = xor_result ;
       4'b0101: alu_result = srl_result ;
       4'b1101: alu_result = sra_result ;
       4'b0110: alu_result = or_result ;
       4'b0111: alu_result = and_result ;
    endcase
end

assign zero = (alu_result == 0)? 1 : 0 ;   // check if the result is zero or not.


endmodule