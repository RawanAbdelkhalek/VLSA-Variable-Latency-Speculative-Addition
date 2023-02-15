`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2021 06:25:01 PM
// Design Name: 
// Module Name: mainmodule
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
` include "lastbit.sv"
` include "inbetween.sv"
` include "sixbit.sv"

module mainmodule(
 input [15:0] A,
input [15:0]B,
input Cin,
output [15:0] Sum,
output Cout

    );
     sixbit S1to5(.A(A[5:0]),.B(B[5:0]),.Cin(Cin),.Sum(Sum[5:0]));
     inbetween S6(.A(A[6:1]),.B(B[6:1]),.Cin(Cin),.s(Sum[6]));
     inbetween S7(.A(A[7:2]),.B(B[7:2]),.Cin(Cin),.s(Sum[7]));
     inbetween S8(.A(A[8:3]),.B(B[8:3]),.Cin(Cin),.s(Sum[8]));
     inbetween S9(.A(A[9:4]),.B(B[9:4]),.Cin(Cin),.s(Sum[9]));
     inbetween S10(.A(A[10:5]),.B(B[10:5]),.Cin(Cin),.s(Sum[10]));
     inbetween S11(.A(A[11:6]),.B(B[11:6]),.Cin(Cin),.s(Sum[11]));
     inbetween S12(.A(A[12:7]),.B(B[12:7]),.Cin(Cin),.s(Sum[12]));
     inbetween S13(.A(A[13:8]),.B(B[13:8]),.Cin(Cin),.s(Sum[13]));
     inbetween S14(.A(A[14:9]),.B(B[14:9]),.Cin(Cin),.s(Sum[14]));
     inbetween S15(.A(A[15:10]),.B(B[15:10]),.Cin(Cin),.s(Sum[15]));
     lastbit S16(.A(A[15:10]),.B(B[15:10]),.Cin(Cin),.Cout(Cout));

endmodule
