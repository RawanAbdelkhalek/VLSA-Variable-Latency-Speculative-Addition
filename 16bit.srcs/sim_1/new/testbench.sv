`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2021 06:07:32 PM
// Design Name: 
// Module Name: test
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

module test();
// 1. Declare testbench variables
  reg clk;
    reg [15:0] A;
   reg [15:0] B;
   wire [15:0] Sum;
   wire Cout;
   wire error;
  
  integer i;


	// 2. Instantiate the design and connect to testbench variables
 /* mainmodule  uut ( .A (A),
                  .B (B),
                  .Cin (Cin),
                  .Cout (Cout),
                  .Sum (Sum));
    Errordetection  uut1 ( .A (A),
                         .B (B),
                       .err (err),
                       .err1 (err1)
                      );
*/
 finalmodule  uut ( 
                  .clk(clk), 
                  .A (A),
                 .B (B),
                  .Sumfin (Sum),
                  .Cout(Cout),
                 .err(error)
                
                );
              
	// 3. Provide stimulus to test the design
	 initial begin 
               clk=0;
               forever begin 
                   #10;
                   clk=~clk;
                end
            end

   initial begin
      A <= 0;
      B <= 0;
       //Ci <= 0;
      $monitor ("a=0x%0h b=0x%0h  c_out=0x%0h sum=0x%0h error=0x%0h ", A, B,  Cout, Sum,error);
		// Use a for loop to apply random values to the input
      for (i = 0; i <150; i = i+1) begin
         #10 A <= $random;
             B <= $random;
         		 
         		  end
       /*  #50		 A=16'b1111111111111111;
         		     B=16'b1000111001000001;*/
     
   end
endmodule
