`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2021 01:49:18 AM
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(
   input a,
   input b,
   input cin,
   input en,
   output reg s,
   output reg g,
   output reg p
    );
    always_comb
    if (en==1)begin
      g = a & b;
      p = a ^ b;
      s = p ^ cin;
      end
      else begin
      g=0;
      p=0;
      s=0;
      end
endmodule
