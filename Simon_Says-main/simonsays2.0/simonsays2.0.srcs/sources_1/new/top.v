`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2023 18:06:45
// Design Name: 
// Module Name: top
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


module top
(
input clk_100MHz,
    input reset,
    output [3:0] led
    );
    wire w_1Hz;
    lfsr r4(
        .clk(w_1Hz),
        .reset(reset),
        .lfsr(led)
    );
    onegertzgen uno(
        .clk_100MHz(clk_100Mhz),
        .reset(reset),
        .clk_1Hz(w_1Hz)
    );
endmodule
