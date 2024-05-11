`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2023 08:49:14
// Design Name: 
// Module Name: clock_devider
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


module clock_devider(
input clk,
output reg divided_clk

    );
    integer counter_value=0;
    always @ (posedge clk)
    begin
        if(counter_value==4999)
        begin
            counter_value<=0;
            divided_clk<=~divided_clk;
        end
        else counter_value<= counter_value+1;
        
        
    end
endmodule
