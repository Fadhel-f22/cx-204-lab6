`timescale 1ns / 1ps


module imm_gen_tb;
     logic [31:0]inst;
     logic [31:0]imm;
 
 
imm_gen immediate_Generator (
    .inst(inst),   
    .imm(imm)
    );

initial begin
#5
   
    inst = 32'b11111000010011111111111110010011;  //0xF84

#10
  
    inst = 32'b00110110000000000000110100100011;  //0x37A
#10
    
    inst = 32'b11011110000000000000000001100011;   
    
#20
$finish;
end        
endmodule
