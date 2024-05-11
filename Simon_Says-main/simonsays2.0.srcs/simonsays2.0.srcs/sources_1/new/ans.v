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


module ans(
input ready,
input [15:0]SW,
output reg [15:0]ans,
output reg red1
    );
   always @(posedge ready)
   begin
   red1=(|SW==1)?1'b1:1'b0;
   end 
   always @(negedge ready)
   begin
   ans=SW;
   end
endmodule
