`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2021 04:23:57 AM
// Design Name: 
// Module Name: Errordetection
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


module Errordetection(
input [15:0] A,
input [15:0] B,
output reg err,
output reg err1
    );
logic [15:0] P;
/*reg err1;*/

assign P = A^B;
assign err1 = P[1]&P[2]&P[3]&P[4]&P[5] | P[2]&P[3]&P[4]&P[5]&P[6] |     P[7]&P[3]&P[4]&P[5]&P[6] 
            |  P[8]&P[7]&P[4]&P[5]&P[6] | P[8]&P[9]&P[7]&P[5]&P[6] | P[8]&P[7]&P[9]&P[10]&P[6] | P[8]&P[7]&P[9]&P[10]&P[11] |
            P[8]&P[12]&P[9]&P[10]&P[11] | P[13]&P[12]&P[9]&P[10]&P[11] | P[13]&P[12]&P[14]&P[10]&P[11] | P[13]&P[12]&P[14]&P[15]&P[11]  ; 
           
       always_comb 
       begin
         if ((A == 'b0 & B=='b1111111111111111) |(B == 'b0 & A=='b1111111111111111)|( err1==1 & P[0]==1)) 
           err = 0;
         else 
           err = err1;
     end
endmodule
