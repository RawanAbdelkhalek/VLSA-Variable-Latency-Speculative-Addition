`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2021 02:49:18 AM
// Design Name: 
// Module Name: LCU
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


module LCU(
   input [3:0] G,
   input [3:0] P,
   input cin,
   input en,
   output reg [2:0] c,
   output reg cout,
   output reg PG,
   output reg GG
    );
    always_comb
    if(en==1)begin
    // Carry equantion
     c[0] = G[0] | (P[0] & cin);
     c[1] = G[1] | (P[1] & c[0]);
     c[2] = G[2] | (P[2] & c[1]);
        // Propagate and genarate gruop 
    
      PG = P[3] & P[2] & P[1] & P[0];
      GG = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
     // carry for the next four bits adder
      cout = GG | (PG & cin);
      end
      else begin
       c[0] = 0;
          c[1] = 0;
          c[2] = 0;
            PG = 0;
           GG = 0;
           cout = 0;
    end
endmodule
