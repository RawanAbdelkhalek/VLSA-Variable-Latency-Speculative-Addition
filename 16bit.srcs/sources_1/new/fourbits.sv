`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2021 06:05:59 PM
// Design Name: 
// Module Name: fourbits
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

` include "singlebit.sv"

module fourbits(
  input [5:0] A,
 input [5:0]B,
 input Cin,
 output [5:0] Sum
    );
    wire [4:0] c;
            singlebit A1(.a(A[0]),.b(B[0]),.cin(Cin),.s(Sum[0]),.cou(c[0]));
            singlebit A2(.a(A[1]),.b(B[1]),.cin(c[0]),.s(Sum[1]),.cou(c[1]));
            singlebit A3(.a(A[2]),.b(B[2]),.cin(c[1]),.s(Sum[2]),.cou(c[2]));
            singlebit A4(.a(A[3]),.b(B[3]),.cin(c[2]),.s(Sum[3]),.cou(c[3]));
            singlebit A5(.a(A[4]),.b(B[4]),.cin(c[3]),.s(Sum[4]),.cou(c[4]));
            singlebit A6(.a(A[5]),.b(B[5]),.cin(c[4]),.s(Sum[5])/*,.cou(Cout)*/);
endmodule
