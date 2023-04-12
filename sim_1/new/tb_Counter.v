`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/14 20:56:57
// Design Name: 
// Module Name: tb_Counter
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


module tb_Counter();
reg [4:0] Data;
reg EN,LOAD,Clk,Rst;
wire [4:0] Dout;
wire carry;

initial begin
    Data=5'b10110;
    EN=1'b1;
    LOAD=1'b0;
    Clk=1'b0;
    Rst=1'b0;
    #20
    Rst=1'b1;
    #200
    LOAD=1'b1;
    #10
    LOAD=1'b0;
    #200
    EN=1'b0;
end
always #5 Clk=~Clk;
CounterN C(
    .Data(Data),
    .EN(EN),
    .LOAD(LOAD),
    .rst(Rst),
    .Clk(Clk),
    .Dout(Dout),
    .carry(carry)

);
endmodule
