`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2023 08:43:37
// Design Name: 
// Module Name: checker
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


module checker(
    input [15:0]Ledwire,
    input Ans,
    input check,
    output reg red2,
    output reg green
    );
    always @(posedge check)
    begin
    if(Ledwire^Ans==0)
    begin
    green=1'b1;
    end 
    else
    begin
    red2=1'b1;
    end
    end
endmodule
