`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/14 21:14:28
// Design Name: 
// Module Name: Comparator
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


module Comparator(
    input [3:0] A,
    input [3:0] B,
    input  EN,
    output L,
    output E,
    output R
    );
assign L=(EN==1'b1)?(A>B):1'b0;
assign E=(EN==1'b1)?(A==B):1'b0;
assign R=(EN==1'b1)?(A<B):1'b0;
endmodule
