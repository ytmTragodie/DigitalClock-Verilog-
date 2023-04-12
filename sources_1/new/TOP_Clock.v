`timescale 1ns / 1ps
module TOP_Clock(Clk,Clk_Min,Clk_Hour,EN_Alert,Clk_Add_Hour,EN,Clk_Add_Min,RST,Mode,LedSharp,LedAlert,SegsChose,SegsValue,APM);
input Clk;
input Clk_Min,Clk_Hour,EN_Alert;//for alert set
input Clk_Add_Hour,Clk_Add_Min;//set clock
input EN,RST,Mode;//选择 0-12 or1- 24
output LedSharp,LedAlert;
output [7:0]SegsChose;
output [6:0]SegsValue;
output APM;

wire [7:0] Hours,Minutes,Seconds,DATA,tempHours;
wire newClk,sec_pulse,minute_pulse,ClkforMin,ClkforHour,DisClk;
wire [7:0] AlertHour,AlertMin;
wire [15:0] SegsShow;//选择数码管展示的内容是闹钟设置界面或者是时钟页面
wire [3:0] NUM;
wire [4:0]NumberHour;
wire AlertAPM;
assign NumberHour = Hours[3:0]+Hours[7:4]*10;
Frec_Divider FD(Clk,newClk);//分频
//assign newClk=Clk;
defparam FD.N=50_000_000;

Count_Second CS(.Clk(newClk),.EN(EN),.RST(RST),.Seconds(Seconds),.pulse(sec_pulse));
assign ClkforMin = sec_pulse | Clk_Add_Min;
Count_Minutes CM(.Clk(ClkforMin), .EN(EN),.RST(RST),.Seconds(Minutes), .pulse(minute_pulse));//计时分钟
assign ClkforHour = minute_pulse|Clk_Add_Hour;
CountHour CH(ClkforHour,EN,1'b0,DATA,RST,tempHours,newClk);//计时小时
newCountH newCH(tempHours,Mode,Hours,APM);

//设置闹钟，响闹钟
SetAlert SA(EN_Alert,RST,Clk_Hour,Mode,Clk_Min,AlertHour,AlertMin,AlertAPM,newClk);
ClockAlert CA(newClk,Hours,Minutes,{AlertHour,AlertMin,AlertAPM},LedAlert);

//整点报时
SharpShine SSH(minute_pulse,NumberHour,newClk,LedSharp);

//显示
Mux2_1 MS({Hours,Minutes},{AlertHour,AlertMin},EN_Alert,SegsShow);
defparam MS.n=16;
Frec_Divider FD2(Clk,DisClk);//分频
defparam FD2.N=1000;
//assign DisClk = Clk;
Displayer DPL(DisClk,EN,Seconds,SegsShow[7:0],SegsShow[15:8],SegsChose,NUM);
Seven_Segment SSG(NUM,SegsValue);
endmodule
