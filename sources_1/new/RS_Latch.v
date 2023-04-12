`timescale 1ns / 1ps
module RS_Latch(R,S,Q,NQ);
input R,S,Q,NQ;
wire q,nq;
nor 
    X1(q,R,nq),
    X2(nq,S,q);
assign Q=q;
assign NQ=nq;
endmodule
