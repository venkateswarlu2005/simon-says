`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2023 18:09:13
// Design Name: 
// Module Name: onegertzgen
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


module onegertzgen
(
input clk_100MHz,
    input reset,
    output clk_1Hz
    );
    reg[25:0] r_count=0;
    reg r_1hz=0;
    always @(posedge clk_100MHz or posedge reset) begin
        if(reset)
            r_count <=26'b0;
        else begin
            if(r_count==49_999_999)
            begin
               r_count <=26'b0;
               r_1hz <=~r_1hz;
            end
            else
                r_count <= r_count +1;
        end
      end
      assign clk_1Hz=r_1hz;
endmodule
