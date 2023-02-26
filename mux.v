`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2022 10:40:20
// Design Name: 
// Module Name: mux
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


module mux(
input mode_val,
input [3:0] select,
output reg [15:0] register
    );
always @(select,mode_val)
    case(select)
        4'b0000: register <= {15'bZZZZZZZZZZZZZZZ,mode_val};
        4'b0001: register <= {14'bZZZZZZZZZZZZZZ,mode_val,1'bZ};
        4'b0010: register <= {13'bZZZZZZZZZZZZZ,mode_val,2'bZZ};
        4'b0011: register <= {12'bZZZZZZZZZZZZ,mode_val,3'bZZZ};
        4'b0100: register <= {11'bZZZZZZZZZZZ,mode_val,4'bZZZZ};
        4'b0101: register <= {10'bZZZZZZZZZZ,mode_val,5'bZZZZZ};
        4'b0110: register <= {9'bZZZZZZZZZ,mode_val,6'bZZZZZZ};
        4'b0111: register <= {8'bZZZZZZZZ,mode_val,7'bZZZZZZZ};
        4'b1000: register <= {7'bZZZZZZZ,mode_val,8'bZZZZZZZZ};
        4'b1001: register <= {6'bZZZZZZ,mode_val,9'bZZZZZZZZZ};
        4'b1010: register <= {5'bZZZZZ,mode_val,10'bZZZZZZZZZ};
        4'b1011: register <= {4'bZZZZ,mode_val,11'bZZZZZZZZZZ};
        default: register[15] <= mode_val;
        
        
        
    endcase
endmodule
