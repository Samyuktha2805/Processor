`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2022 11:47:17
// Design Name: 
// Module Name: processor
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


module processor(
input clock,reset,
input [15:0] data_in,
output [15:0] final_out
    );
wire [15:0] register_w;
wire [15:0] busout_w ,busin_w,ir_w;

wire clk_w,reset_w,muxval_w;
wire [15:0] alu_a,alu_g;
wire [3:0] muxaddr_w;
wire [2:0] opcode_w;
wire aluen_w;
wire din_b = 1'b1;
wire din_r = 1'b0;
wire mode_b = 1'bX;
regfile D_IN(.din(din_b),.clk(clock),.reset(reset_w),.mode(register_w[8]),.in(data_in),.out(busout_w));
regfile bus(.din(din_b),.clk(clock),.reset(reset_w),.mode(mode_b),.in(busout_w),.alu_out(busin_w));
regfile R0(.din(din_r),.clk(clock),.reset(reset_w),.mode(register_w[0]),.in(busin_w),.out(busout_w));
regfile R1(.din(din_r),.clk(clock),.reset(reset_w),.mode(register_w[1]),.in(busin_w),.out(busout_w));
regfile R2(.din(din_r),.clk(clock),.reset(reset_w),.mode(register_w[2]),.in(busin_w),.out(busout_w));
regfile R3(.din(din_r),.clk(clock),.reset(reset_w),.mode(register_w[3]),.in(busin_w),.out(busout_w));
regfile R4(.din(din_r),.clk(clock),.reset(reset_w),.mode(register_w[4]),.in(busin_w),.out(busout_w));
regfile R5(.din(din_r),.clk(clock),.reset(reset_w),.mode(register_w[5]),.in(busin_w),.out(busout_w));
regfile R6(.din(din_r),.clk(clock),.reset(reset_w),.mode(register_w[6]),.in(busin_w),.out(busout_w));
regfile R7(.din(din_r),.clk(clock),.reset(reset_w),.mode(register_w[7]),.in(busin_w),.out(busout_w));

regfile A(.din(din_r),.clk(clock),.reset(reset_w),.mode(register_w[9]),.in(busin_w),.alu_out(alu_a));
regfile G(.din(din_b),.clk(clock),.reset(reset_w),.mode(register_w[10]),.in(alu_g),.out(busout_w));
regfile IR(.din(din_r),.clk(clock),.reset(reset_w),.mode(register_w[11]),.in(busin_w),.alu_out(ir_w));
mux DEMUX(.mode_val(muxval_w),.select(muxaddr_w),.register(register_w));
control_unit CU(.reset(reset_w),.clk(clock),.ir(ir_w),.val(muxval_w),.addr(muxaddr_w),.aluen(aluen_w),.opcode(opcode_w));
ALU alu(.en(aluen_w),.In1(alu_a),.In2(busin_w),.opcode(opcode_w),.out_alu(alu_g));

assign clk_w = clock;
assign reset_w = reset;
assign final_out = busout_w;
endmodule
