`timescale 1ns / 1ps
module newCountH(Hour,Mode,ShowHour,ShowAPM);//
input [7:0] Hour;
input Mode;
output reg [7:0] ShowHour;
output reg ShowAPM=1'b0;//don't lighten

always @(*) begin
    if (Mode==1'b0) begin//which means 12 
        if(Hour==8'h00)begin
            ShowHour<=8'h12;
        end
        else if (Hour==8'h20 || Hour==8'h21) begin
            ShowHour<=Hour-8'h18;
            ShowAPM<=1'b1;
        end
        else if (Hour>8'h12) begin
            ShowHour<=Hour-8'h12;
            ShowAPM<=1'b1;
        end
        else begin
            ShowHour<=Hour;
        end
        
    end
    else if (Mode==1'b1) begin
        ShowHour<=Hour;//24 output directly
        ShowAPM=1'b0;
    end
end
endmodule
