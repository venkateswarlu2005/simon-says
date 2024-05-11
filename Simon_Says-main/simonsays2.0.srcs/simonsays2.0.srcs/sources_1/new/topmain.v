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
        output reg [15:0]LED,
        output wire[7:0]anode,
        output wire [7:0] cathode
                  
    );
    wire [3:0] outin;
    wire [15:0]ledwire;
    reg [1:0]i=2'b0;
    reg [31:0]s=32'b0,d=32'b0;
    reg[3:0]ds[7:0];
    reg [15:0]Seq;
    reg [15:0]Ans;
    wire refresh_clock;
    wire [2:0] refreshcounter;
    wire [3:0] One_digit;
     onegertzgen uno(
        .clk_100MHz(clk_100MHz),
        .reset(reset), 
        .clk_1Hz(w_1Hz)
        );
   
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
    
    clock_devider refreshclock_genrator(
    .clk(clk_100MHz),
    .divided_clk(refresh_clk)
    );
    refreshcounter refreshcounter_wrapper(
    .refresh_clock(refresh_clk),
    .refreshcounter(refreshcounter)
    ); 
    anode_control anode_control_wrapper(
    .refreshcounter(refreshcounter),
    .anode(anode)   
    );
    BCD_controller BCD_controller_wrapper(
    .digit1(s[3:0]),
    .digit2(s[7:4]),
    .digit3(s[11:8]),
    .digit4(s[15:12]),
    .digit5(s[19:16]),
    .digit6(s[23:20]),
    .digit7(s[27:24]),
    .digit8(s[31:28]),
    .refreshcounter(refreshcounter),
    .one_digit(One_digit)
    );
    cathode_control cathode_control_wrapper(
    .digit(One_digit),
    .cathode(cathode)
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
                        if(s>32'd9)
                        begin
                        s=s+32'h6;
                        if(s>32'd99)
                        begin
                        s=s+32'h60;
                        if(s>32'd999)
                        begin
                        s=s+32'h600;
                        if(s>32'd9999)
                        begin
                        s=s+32'h6000;
                        if(s>32'd99999)
                        begin
                        s=s+32'h60000;
                        if(s>32'd999999)
                        begin
                        s=s+32'h600000;
                        if(s>32'd9999999)
                        begin
                        s=s+32'h6000000;
                        if(s>32'd99999999)
                        begin
                        s=s+32'h60000000;
                        end
                        end
                        end
                        end
                        end
                        end
                        end
                        end
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
                                        s=32'b0;
                                    end
               
               2'd0 : if(check==1)
                                    begin
                                    Ans=SW;
                                    if ((Ans^Seq)==16'd0)
                                    begin
                                    green=1'b1;
                                    s=s+32'b1;
                                    end
                                    else 
                                    begin
                                    red=1'b1;
                                    s=32'b0;
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
