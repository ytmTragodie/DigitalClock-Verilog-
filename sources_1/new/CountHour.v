`timescale 1ns / 1ps
module CountHour(Clk,EN,LOAD,DATA,RST,Hour,Clknew);
input Clk,EN,LOAD,RST,Clknew;
input [7:0]DATA;
output [7:0] Hour;


wire newRST,temp_pulse,h2_RST,Carry;
wire [3:0]hours_pre,hours;
wire [7:0] temphour,Hourt;
reg [7:0] LoadData;

ModN_Counter MC_H(.Clk(Clk), .EN(EN), .Data(LoadData[3:0]), .LOAD(LOAD),.RST(newRST),.Carry(temp_pulse),
    .CNT(hours_pre)
);
defparam MC_H.Mode=9;


ModN_Counter MC_H2(
    .Clk(temp_pulse),
    .EN(EN),
    .Data(LoadData[7:4]),
    .LOAD(LOAD),
    .RST(newRST),
    .Carry(Carry),
    .CNT(hours)
);
defparam MC_H2.Mode=9;
assign temphour={hours,hours_pre};
assign Hour =temphour;//(Mode==1'b0)?(({hours,hours_pre}==8'h09)?8'h10:temphour+1):temphour;
assign h2_RST = (temphour==8'h24);//((Mode==1'b0)&(temphour==8'h12))|((Mode==1'b1)&(temphour==8'h24));
//assign HourAPM= (h2_RST==1'b1)&&;(Mode==1'b0)
assign newRST =(~h2_RST)&RST;
//reg [7:0] HourChange;
/*
always@(posedge Clknew or posedge h2_RST)begin 
    if(Mode==1'b0)begin
        if(h2_RST==1'b1)begin
            HourAPM<=~HourAPM;
        end
        else if(Hour>8'h12)begin//存在数值转换的情况
            realLoad<=1'b1;
            LoadData<=Hour-8'h12;
            HourAPM<=1'b1;
        end 

        else realLoad<=1'b0;
    end
    else begin 
        if(HourAPM ==1'b1)begin
            realLoad<=1'b1;
            LoadData<=(temphour==8'h08 ||temphour==8'h07)?8'h19+temphour[3:0]:temphour+8'h13;
            HourAPM<=1'b0;
        end
        else realLoad<=1'b0;
    end
end
*/
/*
always @(*)begin
    if(Mode ==1'b0)begin//12
        if(Hourt>8'h12)begin//存在数值转换的情况
            Hour<=Hourt-8'h12;
        end
        else if(Hourt==8'h00) Hour<=8'h12;
        else begin//没有转换的情况
            Hour<=Hourt;
        end
    end
    else begin//24
        if(HourAPM==1'b1)begin  
            Hour<=temphour+8'h12;
            //HourAPM<=1'b0;
        end
        else //没有转换情况
            Hour<=Hourt;
        //HourAPM=1'b0;
    end
end
 */
 /*
always @(posedge h2_RST)begin
    if(Mode==1'b0)begin //如果为12小时制
        HourAPM=~HourAPM;//上下午指示转换
    end
end
*/
endmodule
