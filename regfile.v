`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2022 11:00:55
// Design Name: 
// Module Name: regfile
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


module regfile(               
input  wire clk,din,
input  wire reset,
input   wire mode,
input wire [15:0] in , 
output  reg[15:0] out, 
output [15:0] alu_out        
);


reg [15:0] stored ;
assign alu_out = stored;


parameter n=16;
always@(clk,din,reset,mode,out,alu_out)
begin
    if((!mode)&(!din)&clk)
         stored <=in;
    if(din)
        if((in[0] ==1'b0)|(in[0]==1'b1))
            stored <=in;
    if(reset)
        stored <= {(n){1'bZ}};
    if(mode)
        out<=stored;
    else
        out<= {(n){1'bZ}};
end
     



 
endmodule
