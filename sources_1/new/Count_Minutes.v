`timescale 1ns / 1ps
module Count_Minutes(
    input Clk,
    input EN,
    input RST,
    output [7:0] Seconds,
    output pulse
    );
reg LOAD=1'b0;
reg [3:0] Data=4'b0;

wire [3:0] count_Six,count_Ten;
wire pass_Six,pass_Ten;

ModN_Counter MC2_10(
    .Clk(Clk),
    .EN(EN),
    .Data(Data),
    .LOAD(LOAD),
    .RST(RST),
    .Carry(pass_Ten),
    .CNT(count_Ten)
);
defparam MC2_10.Mode=9;

ModN_Counter MC2_6(
    .Clk(pass_Ten),
    .EN(EN),
    .Data(Data),
    .LOAD(LOAD),
    .RST(RST),
    .Carry(pass_Six),
    .CNT(count_Six)
);
defparam MC2_6.Mode=5;
assign pulse = pass_Six;
assign Seconds = {count_Six,count_Ten};
endmodule
