`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2021 02:19:25 AM
// Design Name: 
// Module Name: finalmodule
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

` include "mainmodule.sv"
` include "Errordetection.sv"
` include "CLA16Bit.sv"
` include "mux.sv"
module finalmodule(
    input  clk,
    input [15:0]A,
    input [15:0]B,
    output [15:0]Sumfin,
    output Cout,
    output err
    );
    reg stall, valid;
    wire [15:0] sumadd,sumrecov;  
    wire carradd,carrrec;
     assign  valid= ~stall;
    mainmodule adder(.A(A),.B(B),.Cin(0),.Sum(sumadd),.Cout(carradd));
    Errordetection errdet(.A(A),.B(B),.err(err));
   always_ff @(posedge clk)
   if (err==1) begin
        stall=1;
   end  
   else begin
        stall=0;
   end
 CLA16Bit recov(.A(A), .B(B),.Cin(0),.en(stall), .Sum(sumrecov), .Cout(carrrec));
 mux mux1(.sumad(sumadd), .sumrec(sumrecov),  .stall(stall),  .FinalSum(Sumfin));  
  mux muxcarr(.sumad(carradd), .sumrec(carrrec),  .stall(stall),  .FinalSum(Cout));  

endmodule

