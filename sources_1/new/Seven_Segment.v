`timescale 1ns / 1ps
module Seven_Segment(Q,Segs);
input [3:0] Q;
output reg [6:0] Segs;
always@(Q)
begin
case(Q)
    4'h0:Segs<=7'b0000001;
    4'h1:Segs<=7'b100_1111;
    4'h2:Segs<=7'b001_0010;
    4'h3:Segs<=7'b000_0110;
    4'h4:Segs<=7'b1001_100;
    4'h5:Segs<=7'b010_0100;
    4'h6:Segs<=7'b010_0000;
    4'h7:Segs<=7'b000_1111;
    4'h8:Segs<=7'b000_0000;
    4'h9:Segs<=7'b000_0100;
    default:Segs<=7'b111_1111;
endcase
end
endmodule
