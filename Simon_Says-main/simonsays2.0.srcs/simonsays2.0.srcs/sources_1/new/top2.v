`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2023 23:14:03
// Design Name: 
// Module Name: top2
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

 
module top2(
input clk_100MHz,
    input reset,
    input start,
    input ready,
     input check,
    input [15:0] SW,
    
    output reg [1:0]red,
    output reg green,
    output reg [15:0] LED
    );
    wire [1:0]data;
    reg [1:0]startcounter,redycounter,checkcounter;
    reg[15:0]gennum;
    reg [15:0] ANS;
    wire w_1Hz;
    wire [3:0] outin;
    wire [15:0]ledwire;
    wire [15:0]Ledwire;
    reg [15:0]a;
       
   // wire [15:0]led;
    onegertzgen uno(
        .clk_100MHz(clk_100MHz),
        .reset(reset), 
        .clk_1Hz(w_1Hz)
        );
    
    lfsr l1(
        .clk(w_1Hz && start ),
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
    assign Ledwire=ledwire;
    assign data=2'b0;
always@(posedge w_1Hz)

begin
startcounter<=data+start;
redycounter<=data+ready;
checkcounter<=data+check;
if(startcounter==2'b01)begin
  
LED=Ledwire;
red[1:0]=(|SW==0)?2'b1:2'b0;
end 
if (redycounter==2'b01)begin
gennum=Ledwire;
ANS=SW;
end
if(checkcounter==2'b01)begin
   
    a=(gennum^ANS);
    if (a==16'b0)
        begin
            green= 1;
        end
    else 
        begin
            red=2'b11;     
        end 
end
end
   
    
endmodule
