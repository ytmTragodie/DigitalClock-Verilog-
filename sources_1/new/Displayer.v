`timescale 1ns / 1ps
module Displayer(Clk,EN,Seconds,Minutes,Hours,SEGS,NUM);
input Clk,EN;
input [7:0] Seconds,Minutes,Hours;
output reg[7:0] SEGS;
output reg [3:0] NUM;
integer k=0;
always@(posedge Clk)begin
    if(~EN)SEGS<=8'b1111_1111;
    case(k)
    0:begin 
        NUM<=Seconds[3:0];
        SEGS<=8'b1111_1011;
        k<=k+1;
    end

    1:begin
        NUM<=Seconds[7:4];
        SEGS<=8'b1111_0111;
        k<=k+1;
    end

    2:begin
        NUM<=Minutes[3:0];
        SEGS<=8'b1110_1111;
        k<=k+1;
    end
    3:begin
        NUM<=Minutes[7:4];
        SEGS<=8'b1101_1111;
        k<=k+1;
    end

    4:begin
        NUM<=Hours[3:0];
        SEGS<=8'b1011_1111;
        k<=k+1;
    end

    5:begin
        NUM<=Hours[7:4];
        SEGS<=8'b0111_1111;
        k<=k+1;
    end

    6:k<=0;
    default:k<=0;
endcase
end
endmodule


