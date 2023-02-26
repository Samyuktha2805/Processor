`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2022 18:22:53
// Design Name: 
// Module Name: control_unit
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


module control_unit(
input clk,reset,
input wire [8:0] ir,
output [3:0] addr,
output val,
output reg [2:0] opcode,
output reg aluen
    );
    
wire [3:0] addr_rx,addr_ry;
wire [2:0] instruction;
reg cc = 1'b0;
reg tmuxval;
reg [3:0] tmuxaddress;
parameter [3:0] S00 = 4'b0000;
parameter [3:0] S0 = 4'b0001;
parameter [3:0] S1 = 4'b0010;
parameter [3:0] S2 = 4'b0011;
parameter [3:0] S3 = 4'b0100;
parameter [3:0] S4 = 4'b0101;
parameter [3:0] S5 = 4'b0110;
parameter [3:0] S6 = 4'b0111;
parameter [3:0] S7 = 4'b1000;
parameter [3:0] S8 = 4'b1001;
parameter [3:0] S9 = 4'b1010;

reg [3:0] current_state = S00;
reg [3:0]next_state;

assign addr_ry = {1'b0,ir[2:0]};
assign addr_rx = {1'b0,ir[5:3]};
assign instruction = ir[8:6];

always @(posedge clk)
begin
    if(reset == 1'b1)
        current_state <= S00;
    else if(cc==1'b0)
        current_state <= next_state;
     cc <= ~cc;
end

always @(current_state,addr_rx,addr_ry,instruction,tmuxval,tmuxaddress,next_state)
begin 
    case(current_state)
        S00 : next_state<= S0;
        S0 : begin 
                next_state <=S1;
                tmuxval <=1'b1;
                tmuxaddress <= 4'b1000;
             end
        S1 : begin
                tmuxval <=1'b0;
                tmuxaddress <= 4'b1011;
                case(instruction)
                    3'b000 : next_state <= S6;
                    3'b001 : next_state <= S2;
                    3'b010 : next_state <= S4;
                    3'b011 : next_state <= S4;
                    3'b100 : next_state <= S4;
                    3'b101 : next_state <= S4;
                    3'b110 : next_state <= S4;
                    3'b111 : next_state <= S4;
                    default : next_state <=S0;
                endcase
             end
        S2 : begin 
                tmuxval <= 1'b1;
                tmuxaddress <=4'b1000;
                next_state <= S3;
             end
        S3 : begin
                tmuxval<=1'b0;
                tmuxaddress <= addr_rx;
                next_state <= S0;
             end
        S4 : begin
                tmuxval <= 1'b1;
                tmuxaddress <= addr_rx;
                next_state <= S5;
             end
        S5 : begin
                tmuxval <= 1'b0;
                tmuxaddress <= 4'b1001;
                next_state <= S6;
             end
        S6: begin 
                tmuxval<=1'b1;
                tmuxaddress <= addr_ry;
                case(instruction)
                    3'b000: next_state <=S9;
                    default : next_state <=S7;
                endcase
            end
        S7: begin
                aluen <= 1'b1;
                opcode <= instruction;
                tmuxval <= 1'bZ;
                tmuxaddress <= 4'b1010;
                next_state <= S8;
            end
        S8: begin
                aluen <= 1'b0;
                tmuxval<= 1'b1;
                tmuxaddress <= 4'b1010;
                next_state <= S9;
            end
        S9 : begin 
                tmuxval <= 1'b0;
                tmuxaddress <= addr_rx;
                next_state <= S0;
             end
        default : next_state <= S0;
        
     endcase
end
assign addr = tmuxaddress;
assign val = tmuxval;

                   
             
                


endmodule
