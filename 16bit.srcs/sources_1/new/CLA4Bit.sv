`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2021 02:18:33 AM
// Design Name: 
// Module Name: CLA4Bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// `include "FullAdder.sv"
//////////////////////////////////////////////////////////////////////////////////

`include "FullAdder.sv"
`include "LCU.sv"

module CLA4Bit(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    input en,
    output reg [3:0] Sum,
    output reg PG,
    output reg GG
    );
    // (A   ,B  ,Cin    ,Sum    ,   PG,     GG)
    wire [3:0] G;
    wire [3:0] P;
    wire [2:0] C;
       // FullAdder FA0 (in    ,in     ,in       ,out      ,out    ,out    )
    FullAdder FA0 (.a(A[0]),.b(B[0]),.cin(Cin),.en(en),.s(Sum[0]),.g(G[0]),.p(P[0]));
    FullAdder FA1 (.a(A[1]),.b(B[1]),.cin(C[0]),.en(en),.s(Sum[1]),.g(G[1]),.p(P[1]));
    FullAdder FA2 (.a(A[2]),.b(B[2]),.cin(C[1]),.en(en),.s(Sum[2]),.g(G[2]),.p(P[2]));
    FullAdder FA3 (.a(A[3]),.b(B[3]),.cin(C[2]),.en(en),.s(Sum[3]),.g(G[3]),.p(P[3]));
    // Carry logic
    LCU carrylogic (G, P, Cin,en, C, cout, PG, GG);
    //LCU carrylogic (G,P,cin,c,cout,PG,GG)
    
endmodule
