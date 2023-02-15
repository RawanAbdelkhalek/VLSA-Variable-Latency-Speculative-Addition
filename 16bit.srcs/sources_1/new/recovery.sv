module recovery(A, B, Ci,en, S, Co, PG1, GG1);

input [15:0] A;
input [15:0] B;
input Ci;
input en;
output [15:0] S;
output Co;
output PG1;
output GG1;

wire [3:0] GG;
wire [3:0] PG;
wire [3:1] C;
wire Ci;

CLALogic CarryLogic_2 (PG[3:0], GG[3:0],Ci, en, C[3:1], Co, PG1, GG1);

// 4bit    A     B       Ci     S   PG        GG    Co
CLA4 u0 (A[3:0], B[3:0], en,Ci, S[3:0],PG[0], GG[0]);
CLA4 u1 (A[7:4], B[7:4], en,C[1],  S[7:4], PG[1], GG[1]);
CLA4 u2 (A[11:8], B[11:8], en,C[2], S[11:8], PG[2], GG[2]);
CLA4 u3 (A[15:12], B[15:12], en,C[3], S[15:12], PG[3], GG[3]);

endmodule

module CLA4(A, B,en, Ci, S, P, G);
   input [3:0] A;
   input [3:0] B;
   input en;
   input Ci;
   output [3:0] S;
   //output Co;
   output  P;
   output  G;
   wire Ci;
   wire [3:0] G;
   wire [3:0] P;
   wire [3:1] C;

   CLALogic CarryLogic (G, P, Ci,en, C, Co, PG, GG);
   GPFullAdder FA0 (A[0], B[0],en, Ci, G[0], P[0], S[0]);
   GPFullAdder FA1 (A[1], B[1],en ,C[1], G[1], P[1], S[1]);
   GPFullAdder FA2 (A[2], B[2], en,C[2], G[2], P[2], S[2]);
   GPFullAdder FA3 (A[3], B[3], en,C[3], G[3], P[3], S[3]);

endmodule

module CLALogic (G, P, Ci,en, C, Co, PG, GG);
   input [3:0] G;
   input [3:0] P;
   input Ci;
   input en;
   output reg [3:1] C;
   output reg Co;
   output reg PG;
   output reg GG;

   reg GG_int;
   reg PG_int;
always_comb 
if (en==1)begin 
    C[1] = G[0] | (P[0] & Ci);
    C[2] = G[1] | (P[1] & G[0])| (P[1] & P[0] & Ci);
    C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0])| (P[2] & P[1] & P[0] & Ci);


    PG_int = P[3] & P[2] & P[1] & P[0];
    GG_int = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
    Co = GG_int | (PG_int & Ci);
    PG = PG_int;
    GG = GG_int;
end 
else begin 
 C[1] = 0;
   C[2] = 0;
   C[3] = 0;
   PG_int = 0;
   GG_int =0;
   Co = 0;
   PG = 0;
   GG = 0;
  end 
   endmodule

   module GPFullAdder(X, Y,en, Cin, G, P, Sum);
      input X;
      input Y;
      input en;
      input Cin;
      output reg G;
      output reg P;
      output reg Sum;

      reg P_int;
      always_comb
      if (en==1) begin 
       G = X & Y;
       P = P_int;
      P_int = X ^ Y;
      Sum = P_int ^ Cin;
        end
        else begin 
           G = 0;
             P = 0;
             P_int = 0;
            Sum =0;
        end 
  endmodule
