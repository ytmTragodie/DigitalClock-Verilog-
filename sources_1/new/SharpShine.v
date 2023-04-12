`timescale 1ns / 1ps
module SharpShine(CP_Hour,Hour,CP_Second,LED);
input CP_Hour,CP_Second;
input [4:0] Hour; 
output reg LED=1'b0;
//reg [4:0]CNT;//=Hour[3:0]+Hour[7:4]*10;
reg [4:0] Q=5'b0;
always@(posedge CP_Hour or posedge CP_Second)begin
    if(CP_Hour)Q <= 5'b00000;
    else if(Q<(Hour-1)*2) begin
        Q<=Q+1;
        LED<=~LED;
    end
    else begin 
        LED<=1'b0;   
    end
end
endmodule
