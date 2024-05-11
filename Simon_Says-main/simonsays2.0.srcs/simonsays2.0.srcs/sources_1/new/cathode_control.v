`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2023 08:40:19
// Design Name: 
// Module Name: cathode_control
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


module cathode_control(
input [3:0]digit,
output reg [7:0] cathode

    );
    always @ (digit)
    begin
     case (digit)
                        4'd0:cathode=8'b10000001;
                        4'd1:cathode=8'b11001111;
                        4'd2:cathode=8'b10010010;
                        4'd3:cathode=8'b10000110;
                        4'd4:cathode=8'b11001100;
                        4'd5:cathode=8'b10100100;
                        4'd6:cathode=8'b10100000;
                        4'd7:cathode=8'b10001111;
                        4'd8:cathode=8'b10000000;
                        4'd9:cathode=8'b10000100;
                        endcase
       end
endmodule
