`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2023 08:09:03
// Design Name: 
// Module Name: refreshcounter
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


module refreshcounter(input refresh_clock,
output reg [2:0] refreshcounter =0

    );
 always @(posedge refresh_clock) refreshcounter<=refreshcounter + 1;
endmodule
