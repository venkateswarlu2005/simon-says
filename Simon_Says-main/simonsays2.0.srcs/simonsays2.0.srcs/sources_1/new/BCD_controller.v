`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2023 08:25:55
// Design Name: 
// Module Name: BCD_controller
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


module BCD_controller(
input [3:0] digit1,
input [3:0] digit2,
input [3:0] digit3,
input [3:0] digit4,
input [3:0] digit5,
input [3:0] digit6,
input [3:0] digit7,
input [3:0] digit8,
input [2:0] refreshcounter,
output reg [3:0] one_digit
    );
always @(refreshcounter)
   begin
        case (refreshcounter)
        3'b000: one_digit=digit1;
        3'b001: one_digit=digit2;
        3'b010: one_digit=digit3;
        3'b011: one_digit=digit4;
        3'b100: one_digit=digit5;
        3'b101: one_digit=digit6;
        3'b110: one_digit=digit7;
        3'b111: one_digit=digit8;
        endcase
    end    
endmodule
