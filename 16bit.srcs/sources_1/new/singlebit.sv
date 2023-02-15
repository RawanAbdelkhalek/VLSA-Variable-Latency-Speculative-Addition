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


module singlebit(
 output a,
   output b,
   input cin,
   output cou,
   output s
    );
     logic  p, g,k;
         
           assign g = a & b;
           assign p = a ^ b;
           assign k = ~(a | b);
           
           assign cou = g | (~k & cin);
           assign s = p ^ cin;
endmodule
