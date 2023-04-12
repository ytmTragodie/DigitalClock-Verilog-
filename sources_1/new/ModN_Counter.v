`timescale 1ns / 1ps

module ModN_Counter(
input EN,
input Clk,
input [3:0] Data,
input LOAD,
input RST,
output reg Carry,
output reg [3:0]CNT
    );
parameter Mode=10;
wire q;
always@(posedge Clk or negedge RST or posedge LOAD)begin
    if(LOAD)CNT<=Data;
    else if(~RST)CNT<=4'b0;
    else if(EN)begin
        if(CNT==Mode)begin
            Carry=1'b1;
            CNT<=4'b0;
         end
        else  begin
            Carry=1'b0;
            CNT<=CNT+1;
        end
    end
    else CNT <= 4'b0;
end

endmodule
