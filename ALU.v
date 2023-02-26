`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2022 19:00:40
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
input wire en, 
input wire [15:0] In1, In2, 
input wire[2:0] opcode,
output reg[15:0] out_alu
);

always @(en)
    case(opcode)
        3'b010 : out_alu = In1 +In2;
        3'b011 : out_alu = In1 -In2;
        3'b100 :  out_alu = In1  & In2;
        3'b101 :  out_alu = In1  | In2;
        3'b110 : out_alu = In1 ^ In2;
        3'b111 : out_alu = ~In1;
        default : out_alu =9'b000000000;
     endcase

endmodule
