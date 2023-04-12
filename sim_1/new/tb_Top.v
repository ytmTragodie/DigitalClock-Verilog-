`timescale 1ns / 1ps
module tb_Top();
reg Clk;
reg Clk_Min,Clk_Hour,EN_Alert;//for alert set
reg Clk_Add_Hour,Clk_Add_Min;//set clock
reg EN,RST,Mode;//Ñ¡Ôñ 0-12 or1- 24

wire LedSharp,LedAlert;
wire [7:0]SegsChose;
wire [6:0]SegsValue;
wire APM;
integer i=0;
TOP_Clock TP(Clk,Clk_Min,Clk_Hour,EN_Alert,Clk_Add_Hour,EN,Clk_Add_Min,RST,Mode,LedSharp,LedAlert,SegsChose,SegsValue,APM);
initial begin
    {Clk,Clk_Min,Clk_Hour,Clk_Add_Hour,Clk_Add_Min}=5'b00000;
    EN=1'b1;RST=1'b0;Mode=1'b0;EN_Alert=1'b0;
    #20
    RST=1'b1;
    #100
    for(i=0;i<25;i=i+1)begin
        {Clk_Add_Hour,Clk_Add_Min}=2'b10;
        #10
        {Clk_Add_Hour,Clk_Add_Min}=2'b01;
        #10;
    end
    {Clk_Add_Hour,Clk_Add_Min}=2'b00;
    #100
    EN_Alert=1'b1;
    for(i=0;i<25;i=i+1)begin
        {Clk_Hour,Clk_Min}=2'b10;
        #10
        {Clk_Hour,Clk_Min}=2'b01;
        #10;
    end
    #20
    Mode = 1'b1;
    for(i=0;i<30;i=i+1)begin
        {Clk_Add_Hour,Clk_Add_Min}=2'b10;
        #10
        {Clk_Add_Hour,Clk_Add_Min}=2'b01;
        #10;
    end
    #400;
end
always #5 Clk=~Clk;
endmodule
