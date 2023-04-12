`timescale 1ns / 1ps
module Mux2_1 (In1, In2, sel, Out);
parameter n=32;
// ДњТы
  input [n-1:0] In1,In2;
  input sel;
  output [n-1:0] Out;
  assign Out=(sel==0)?In1:In2;
endmodule