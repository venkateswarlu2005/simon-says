`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2023 19:29:18
// Design Name: 
// Module Name: top3
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


module top3
(
    input ready,
    input [15:0] SW,
    output reg [15:0] ANS,
    output reg red
    );
    wire a;
   assign a=SW[0]||SW[1]||SW[2]||SW[3]||SW[4]||SW[5]||SW[6]||SW[7]||SW[8]||SW[9]||SW[10]||SW[11]||SW[12]||SW[13]||SW[14]||SW[15];
    always @(posedge ready) 
    begin
       
        if (a==0)begin
        ANS[0]=SW[0];
        ANS[1]=SW[1];
        ANS[2]=SW[2];
        ANS[3]=SW[3];
        ANS[4]=SW[4];
        ANS[5]=SW[5];
        ANS[6]=SW[6];
        ANS[7]=SW[7];
        ANS[8]=SW[8];
        ANS[9]=SW[9];
        ANS[10]=SW[10];
        ANS[11]=SW[11];
        ANS[12]=SW[12];
        ANS[13]=SW[13];
        ANS[14]=SW[14];
        ANS[15]=SW[15];
          end
        else begin
           red<= a;
        end  
    end
    
endmodule
