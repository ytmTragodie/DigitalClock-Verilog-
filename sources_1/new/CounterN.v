`timescale 1ns / 1ps
module CounterN(
input [3:0] Data,//��������
input EN,
input LOAD,//���Ʋ���װ��
input Clk,
input rst,//ֱ��
output reg[3:0] Dout,
output reg carry
);
parameter MAX =4'd15;
//reg [3:0] mid=4'b0;
//assign Dout=mid;


//always@(LOAD)begin//����Ϊ�첽����ģ������ǳ�ϡ�٣�����ֱ������
  //  if(LOAD)Dout<=Data;
//end
//������0
always@(posedge Clk or negedge rst)begin
    if(~rst)Dout<=4'b0;
    //else if(LOAD)Dout<=Data;
    else if(EN)begin
        if(Dout==4'hf)begin
            Dout<=4'b0;
            carry<=1'b1;
         end
        else  begin
            Dout<=Dout+1;
            carry<=1'b0;
        end
    end
    else Dout <= 4'b0;
end

//assign carry = (Dout==MAX);

endmodule
