`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2021 03:22:11 AM
// Design Name: 
// Module Name: CLA16Bit
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
// 
//////////////////////////////////////////////////////////////////////////////////
`include "FullAdder.sv"
`include "LCU.sv"
`include "CLA4Bit.sv"

module CLA16Bit(
    input [15:0] A,
    input [15:0] B,
    input Cin,
    input en,
    output reg [15:0] Sum,
    output reg Cout
    );
    wire [3:0] GG;
    wire [3:0] PG;
    wire [2:0] C;
    // (A   ,B  ,Cin    ,Sum    ,   PG,     GG)
    
    LCU CarryLogicUint (GG[3:0], PG[3:0], Cin,en, C[2:0], Cout, PG15, GG15);
    // 4 CLA 4 Bit
    // CLA4Bit CLA0 (A,     B         ,Cin  ,Sum    ,  PG,     GG)
    CLA4Bit CLA0 (A[3:0],   B[3:0],   Cin,en,  Sum[3:0],  PG[0], GG[0]);
    CLA4Bit CLA1 (A[7:4],   B[7:4],   C[0],en, Sum[7:4],  PG[1], GG[1]);
    CLA4Bit CLA2 (A[11:8],  B[11:8],  C[1],en, Sum[11:8], PG[2], GG[2]);
    CLA4Bit CLA3 (A[15:12], B[15:12], C[2],en, Sum[15:12],PG[3], GG[3]);
    
endmodule
