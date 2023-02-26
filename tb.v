`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2022 17:51:50
// Design Name: 
// Module Name: tb
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


module tb();
reg clock,reset;
reg [15:0] data_in;
wire [15:0] final_out;

processor uut(.clock(clock),.reset(reset),.data_in(data_in),.final_out(final_out));
initial 
    begin
        clock = 1'b0;
    end
always #5 clock = ~clock;

initial 
    begin
        reset = 1'b0;
        data_in = 16'b0000000001000000; #35;
        data_in = 16'b0100100100010001; #30;   //in1
        data_in = 16'b0000000000001000; #95;
        data_in = 16'b0000000001000000; #35;
        data_in = 16'b0101010011101110; #30;  //in2
        data_in = 16'b0000000010000001; #180;   //add
        //data_in = 16'b0000000011000001;    #180     //sub
        //data_in = 16'b0000000100000001;    #180     //and
        //data_in = 16'b0000000101000001;    #180     //or
        //data_in = 16'b0000000110000001;    #180     //xor
        //data_in = 16'b0000000111000001;      #180;    //not
        $stop;
        
     end
        
endmodule
