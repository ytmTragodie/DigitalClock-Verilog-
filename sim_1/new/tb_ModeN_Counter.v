`timescale 1ns / 1ps

module tb_ModeN_Counter();

reg EN,Clk,LOAD,RST;
reg [4:0] Data,Mode;
wire Carry;
wire [4:0] CNT;

initial begin
    {EN,Clk,LOAD,RST}=4'b1000;
    Data=5'b10110;
    Mode=5'd6;
    #20
    RST=1'b1;
    #200
    LOAD=1'b1;
    #20
    LOAD=1'b0;
    #100
    RST=1'b0;
    #20
    RST=1'b1;
    #100
    EN=1'b0;
    #100
    $stop;
end
always #5 Clk=~Clk;
ModN_Counter MNC(
    .EN(EN),
    .Clk(Clk),
    .LOAD(LOAD),
    .RST(RST),
    .Data(Data),
    .Mode(Mode),
    .Carry(Carry),
    .CNT(CNT)
);
endmodule
