`timescale 1ns / 1ps

module tb_CountHour();
reg Clk, RST;
reg  [15:0]Alert;
reg [1:0]SET;
reg [7:0] SETDATA;
reg EN;
reg Mode;//Ñ¡Ôñ12 or 24
wire [7:0] Hours,Minutes,Seconds;
wire Hour_pulse,ALERT;
wire [5:0] Light;

initial begin
    Alert=16'h06_55;
    Clk=1'b0;RST=1'b0;
    SET=3'b000;
    SETDATA=8'b00010001;
    EN=1'b1;Mode=1'b1;
    #10 RST=1'b1;
    #200
    SET=3'b111;
    #20 SET=3'b000;
    
end
always #3 Clk=~Clk;
Count_Hour CH(Clk,Alert,SET,SETDATA,EN,RST,Mode, Hours,Minutes,Seconds, Hour_pulse,Light,ALERT);
endmodule
