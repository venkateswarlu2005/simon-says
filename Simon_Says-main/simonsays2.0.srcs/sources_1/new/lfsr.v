`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2023 18:06:45
// Design Name: 
// Module Name: lfsr
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


module lfsr
(
input clk,   
input reset,
output reg [3:0] lfsr=4'b0000
    );
    always @(posedge clk or posedge reset) begin
     if(reset)
        lfsr<=4'b0000;
     else begin
        lfsr[3:1]<=lfsr[2:0];
        lfsr[0]<=~(lfsr[3]^lfsr[0]);
//        lfsr<={~(lfsr[3]^lfsr[0]),lfsr[3:1]};
     end
     end
endmodule
