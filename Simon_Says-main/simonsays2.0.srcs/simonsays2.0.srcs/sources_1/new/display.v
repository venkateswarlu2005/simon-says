`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2023 21:00:53
// Design Name: 
// Module Name: display
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


module display(
input [31:0]s,
input clk,
output reg [7:0]display,c


    );
 wire [3:0]ds[7:0];         
 parameter S0=3'd0,S1=3'd1,S2=3'd2,S3=3'd3,S4=3'd4,S5=3'd5,S6=3'd6,S7=3'd7; 
 reg [2:0] state, nextstate;
                       
     assign ds[0]=s[3:0];
     assign ds[1]=s[3:0];
     assign ds[2]=s[3:0];
     assign ds[3]=s[3:0];
     assign ds[4]=s[3:0];
     assign ds[5]=s[3:0];
     assign ds[6]=s[3:0];
     assign ds[7]=s[3:0];
     
     always @ (posedge clk) begin
       state<=nextstate;
     end           
     
     always        
                       
                       
     always @(posedge clk)
     begin                  
                       ds[0]= s[3:0];
                       c=8'b11111110;                                           
                       case (ds[0])
                        4'd0:display=8'b10000001;
                        4'd1:display=8'b11001111;
                        4'd2:display=8'b10010010;
                        4'd3:display=8'b10000110;
                        4'd4:display=8'b11001100;
                        4'd5:display=8'b10100100;
                        4'd6:display=8'b10100000;
                        4'd7:display=8'b10001111;
                        4'd8:display=8'b10000000;
                        4'd9:display=8'b10000100;
                        endcase
                       ds[1]= s[7:4];
                       c=8'b11111101;              
                        case (ds[1])
                        4'd0:display=8'b01111110;
                        4'd1:display=8'b00110000;
                        4'd2:display=8'b01101101;
                        4'd3:display=8'b01111001;
                        4'd4:display=8'b00110011;
                        4'd5:display=8'b01011011;
                        4'd6:display=8'b01011111;
                        4'd7:display=8'b01110000;
                        4'd8:display=8'b01111111;
                        4'd9:display=8'b01111011;
                        endcase
                   
                       ds[2]= s[11:8];
                       c=8'b11111011;                 
                       case (ds[2])
                       4'd0:display=8'b01111110;
                        4'd1:display=8'b00110000;
                        4'd2:display=8'b01101101;
                        4'd3:display=8'b01111001;
                        4'd4:display=8'b00110011;
                        4'd5:display=8'b01011011;
                        4'd6:display=8'b01011111;
                        4'd7:display=8'b01110000;
                        4'd8:display=8'b01111111;
                        4'd9:display=8'b01111011;
                       endcase


                        ds[3]= s[15:12];
                        c=8'b11110111;
                      
                        case (ds[3])
                        4'd0:display=8'b01111110;
                        4'd1:display=8'b00110000;
                        4'd2:display=8'b01101101;
                        4'd3:display=8'b01111001;
                        4'd4:display=8'b00110011;
                        4'd5:display=8'b01011011;
                        4'd6:display=8'b01011111;
                        4'd7:display=8'b01110000;
                        4'd8:display=8'b01111111;
                        4'd9:display=8'b01111011;
                       endcase

                       ds[4]= s[19:16];
                       c=8'b11101111;
                    case(ds[4])
                       4'd0:display=8'b01111110;
                        4'd1:display=8'b00110000;
                        4'd2:display=8'b01101101;
                        4'd3:display=8'b01111001;
                        4'd4:display=8'b00110011;
                        4'd5:display=8'b01011011;
                        4'd6:display=8'b01011111;
                        4'd7:display=8'b01110000;
                        4'd8:display=8'b01111111;
                        4'd9:display=8'b01111011;
                        endcase

                       ds[5]= s[23:20];
                        c=8'b11011111;
                       case (ds[5])
                     4'd0:display=8'b01111110;
                        4'd1:display=8'b00110000;
                        4'd2:display=8'b01101101;
                        4'd3:display=8'b01111001;
                        4'd4:display=8'b00110011;
                        4'd5:display=8'b01011011;
                        4'd6:display=8'b01011111;
                        4'd7:display=8'b01110000;
                        4'd8:display=8'b01111111;
                        4'd9:display=8'b01111011;
                       endcase

                       ds[6]= s[27:24];
                       c=8'b10111111;
                      case (ds[6])
                       4'd0:display=8'b01111110;
                        4'd1:display=8'b00110000;
                        4'd2:display=8'b01101101;
                        4'd3:display=8'b01111001;
                        4'd4:display=8'b00110011;
                        4'd5:display=8'b01011011;
                        4'd6:display=8'b01011111;
                        4'd7:display=8'b01110000;
                        4'd8:display=8'b01111111;
                        4'd9:display=8'b01111011;
                        endcase
                       
                        ds[7]= s[31:28];
                        c=8'b01111111;
                        case (ds[7])
                       4'd0:display=8'b01111110;
                        4'd1:display=8'b00110000;
                        4'd2:display=8'b01101101;
                        4'd3:display=8'b01111001;
                        4'd4:display=8'b00110011;
                        4'd5:display=8'b01011011;
                        4'd6:display=8'b01011111;
                        4'd7:display=8'b01110000;
                        4'd8:display=8'b01111111;
                        4'd9:display=8'b01111011;
                       endcase
end
endmodule
