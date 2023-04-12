`timescale 1ns / 1ps
module ClockAlert(Clk,Hours,Minutes,Alert,LED,APM);
input Clk,APM;
input [7:0] Hours,Minutes;
input [15:0] Alert;
output reg LED=1'b0;
always @(posedge Clk)begin
    if({Hours,Minutes,APM}==Alert)begin
       LED<=~LED;
    end
    else LED<=1'b0;
end
endmodule
