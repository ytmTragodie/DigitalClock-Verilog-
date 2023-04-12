`timescale 1ns / 1ps
//设置闹钟信号
//通过按钮 every time u press the buttion the relevant number Added
module SetAlert(EN,RST,Clk_Hour,Mode,Clk_Min,AlertHour,AlertMin,APM,Clknew);
input EN,RST,Clk_Hour,Clk_Min,Mode,Clknew;
output [7:0]AlertHour,AlertMin;
output APM;

wire pulse;
wire [7:0] Hour,DATA,tmp_AlertHour;
Count_Second CM_AL(Clk_Min,EN,RST,AlertMin,pulse);//add minute
CountHour CH_AL(Clk_Hour,EN,1'b0,DATA,RST,tmp_AlertHour,Clknew);//add hour
newCountH newCH_AL(tmp_AlertHour,Mode,AlertHour,APM);
endmodule
