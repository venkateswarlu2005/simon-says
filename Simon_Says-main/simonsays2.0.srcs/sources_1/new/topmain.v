`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2023 10:19:59
// Design Name: 
// Module Name: topmain
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


module topmain(
        input clk_100MHz,
        input [15:0]SW,
        input ready,
        input reset,
        input check,
        output reg green,
        output reg red,
        output reg [15:0]LED
        
    );
     onegertzgen uno(
        .clk_100MHz(clk_100MHz),
        .reset(reset), 
        .clk_1Hz(w_1Hz)
        );
    wire [3:0] outin;
    wire [15:0]ledwire;
    reg [1:0]i=2'b0;
    reg [15:0]Seq;
    reg [15:0]Ans;
    lfsr l1(
        .clk(w_1Hz),
        .reset(reset),
        .lfsr(outin)
    );
    lfsr l2(
        .clk(outin[0]),
        .reset(reset),
        .lfsr(ledwire[15:12])
    );
    lfsr l3(
        .clk(outin[1]),
        .reset(reset),
        .lfsr(ledwire[11:8])
    );
    lfsr l4(
        .clk(outin[2]),
        .reset(reset),
        .lfsr(ledwire[7:4])
    );
    lfsr l5(
        .clk(outin[3]),
        .reset(reset),
        .lfsr(ledwire[3:0])
    );
       always @(posedge w_1Hz)
       begin
               i=i+1;
       
               case (i)
               2'd1 : begin
                        green=1'b0;
                        red=1'b0;
                        LED=ledwire;
                        Seq=ledwire;
                      end
               2'd2 : if(ready==1)
                                    begin
                                        LED=16'd0;
                                    end
                       else 
                            begin 
                                LED=Seq;
                                i=i-1;
                            end
               2'd3 : if(|SW==0) 
                                    begin 
                                        green=1'b1;
                                    end
                       else 
                                    begin 
                                        i=0;
                                    end
               
               2'd0 : if(check==1)
                                    begin
                                            Ans=SW;
                                            if ((Ans^Seq)==16'd0)
                                                                   begin
                                                                        green=1'b1;
                                                                   end
                                            else 
                                                                    begin
                                                                         red=1'b1;
                                                                    end 
                                    end 
                      else
                                    begin
                                        green=1'b0;
                                        Ans=SW;
                                        i=i-1;
                                    end              
               endcase
       end
endmodule
