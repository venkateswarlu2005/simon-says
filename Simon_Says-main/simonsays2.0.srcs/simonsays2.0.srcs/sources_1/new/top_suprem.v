`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2023 20:17:29
// Design Name: 
// Module Name: top_suprem
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


module top_suprem(
    input check,
    input [15:0]gennum,
    input [15:0]ANS,
    output reg red,
    output reg green
    );
    reg a;
    always @(posedge check)begin
    a=(gennum^ANS);
    if (a==16'b0)begin
        green= 1;
        end
     else begin
        red=1;     
     end
    end
    
endmodule
