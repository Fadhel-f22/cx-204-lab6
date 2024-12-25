`timescale 1ns / 1ps


module data_path #(parameter WIDTH = 32 , parameter DEPTH = 1024)(
    input logic branch,
    input logic reg_write,
    input logic alu_src,
    input logic mem_to_reg,
    input logic alu_ctrl,
    input logic mem_write,
    input logic clk,
    input logic reset_n
    );


    logic [WIDTH - 1 : 0]current_pc;
    logic [WIDTH - 1 : 0]next_pc;
    logic [4 : 0 ]rs1;
    logic [4 : 0 ]rs2;
    logic [4 : 0]rd;
    logic [31 : 0]inst;
    logic [31 : 0]reg_rdata1;
    logic [31 : 0]reg_rdata2;
    logic [31 : 0]alu_op2;
    logic [31 : 0]alu_result;
    logic zero;
    logic [31 : 0]imm;
    logic pc_sel;
    logic [WIDTH - 1 : 0]pc_jump;
    logic [WIDTH - 1 : 0]pc_plus_4;
    logic [31 : 0]mem_rdata; 
    logic [31 : 0]reg_wdata; 

 
 program_counter #(.WIDTH(WIDTH)) PC (
    .data_in(next_pc),
    .clk(clk),
    .reset_n(reset_n),
    .data_o(current_pc)
    );
 
 
    
assign pc_plus_4 = current_pc + 4;
 
assign next_pc = (pc_sel)? pc_jump : pc_plus_4;

assign pc_jump = imm + current_pc; 

assign pc_sel = branch & zero;

assign reg_wdata = (mem_to_reg)? mem_rdata : alu_result ;

assign alu_op2 = (alu_src)? imm : reg_rdata2 ;

    
inst_mem #(.WIDTH(WIDTH)) instruction_memory (
    .address(current_pc),
    .instruction(inst)
    );    
     
     
reg_file register_file (
    .clk(clk),
    .reset_n(reset_n),
    .reg_write(reg_write),
    .raddr1(rs1),
    .raddr2(rs2),
    .waddr(rd),
    .wdata(reg_wdata),
    .rdata1(reg_rdata1),
    .rdata2(reg_rdata2)
    );


imm_gen immidiate_generator (
    .inst(inst),
    .imm(imm)
    );



alu computation (
    .op1(reg_rdata1),
    .op2(alu_op2),
    .alu_ctrl(alu_ctrl),
    .alu_result(alu_result),
    .zero(zero)
    );


data_mem #(.WIDTH(WIDTH), .DEPTH(DEPTH)) data_memory (
    .clk(clk),
    .reset_n(reset_n),
    .mem_write(mem_write),
    .addr(alu_result),
    .wdata(reg_rdata2),
    .rdata(mem_rdata)
    );
    
                
endmodule