`timescale 1ns / 1ps

module tb_CountSecond();
reg Clk,EN,RST;
wire [6:0] SEC;
wire pulse;

initial begin
    {Clk,EN,RST}=3'b010;
    #20
    RST=1'b1;
end
always #5 Clk=~Clk;
Count_Second CS(
    .Clk(Clk),
    .EN(EN),
    .RST(RST),
    .Seconds(SEC),
    .pulse(pulse)
);

endmodule
