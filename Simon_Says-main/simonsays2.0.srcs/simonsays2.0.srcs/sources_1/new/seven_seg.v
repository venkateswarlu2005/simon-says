`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2023 00:36:48
// Design Name: 
// Module Name: seven_seg
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


module seven_seg(
input clk, reset,start, 
input [3:0] row,
input [323:0] sudoku,
output  [6:0] CA, 
output  [7:0] AN,
output  A, B, C, D, E, F,G,
output reg [9:1] led
);

reg [7:0] segment_state;
wire [6:0] cathode_out; 
reg [3:0] value;


assign AN = reset?(8'b1111_1111) : (start?  ~segment_state : 8'b1111_1111);
assign CA = reset? (7'b1111_111) : (start? ~cathode_out : 7'b1111_111); //(~reset || start) ? cathode_out : 7'b1111_111;


//wire [323:0] sudoku = 324'h00195706_3_00080607_0_76913080_5_00726135_0_31249578_6_05637800_0_10860950_7_09071060_8_6_74583000;
wire [6:0] nineth_digit;
binary_to_seven_seg S(sudoku[(3 + 36*row)-:4], nineth_digit);

assign {A, B, C ,D, E, F, G} = reset ? 7'b1111_111 : (start ? ~nineth_digit : 7'b1111_111);

/*always @(posedge clk)
    begin
    if(start == 0)
        led = 9'b0000_00000;
     else
        begin
        case(sudoku[(3 + 36*row)-:4])
        4'd1 : led = 9'b0000_00001;
        4'd2 : led = 9'b0000_00010;
        4'd3 : led = 9'b0000_00100;
        4'd4 : led = 9'b0000_01000;
        4'd5 : led = 9'b0000_10000;
        4'd6 : led = 9'b0001_00000;
        4'd7 : led = 9'b0010_00000;
        4'd8 : led = 9'b0100_00000;
        4'd9 : led = 9'b1000_00000;
        default : led = 9'b0000_00000;
        4'd1 : {A, B, C, D, E, F, G} <= 7'b1001111; //bc
        4'd2 : {A, B, C, D, E, F, G} <= 7'b       //abged
        4'd3 :  {A, B, C, D, E, F, G}     //abgcd
        4'd4 :  {A, B, C, D, E, F, G}   //fgbc
        4'd5 :  {A, B, C, D, E, F, G}  //afgcd
        4'd6 :  {A, B, C, D, E, F, G}  //afedcg
        4'd7 :  {A, B, C, D, E, F, G}  //abc
        4'd8 :  {A, B, C, D, E, F, G}  //abcdefg
        4'd9
        endcase
        end
    end*/
 always @(*)
 begin
    case(segment_state)
            8'b0000_0001:   value = sudoku[(7 + 36*row)-:4];
            8'b0000_0010:   value = sudoku[(11 + 36*row)-:4];
            8'b0000_0100:   value = sudoku[(15 + 36*row)-:4];
            8'b0000_1000:   value = sudoku[(19 + 36*row)-:4];
            8'b0001_0000:   value = sudoku[(23 + 36*row)-:4];
            8'b0010_0000:   value = sudoku[(27 + 36*row)-:4];
            8'b0100_0000:   value = sudoku[(31 + 36*row)-:4];
            8'b1000_0000:   value = sudoku[(35 + 36*row)-:4];
            default:        value = sudoku[(7 + 36*row)-:4];       
        endcase
 end
 
binary_to_seven_seg M(value, cathode_out);

reg[19:0] count; 
 
 always @(posedge clk)
 begin
    if(reset == 1 || start == 0)
        begin segment_state <= 8'b0000_0001; count <= 0; end
    else
        if(count >= 20'h186A0) begin segment_state <= {segment_state[6:0] , segment_state[7]}; count <= 0; end
        else begin segment_state <= segment_state; count <= count + 1; end
 end
 endmodule
 

 
 module binary_to_seven_seg(
 input [3:0] value,
 output reg [6:0] seven_seg
 );
 
 always @(*)
    begin
        case(value)
            4'd0 : seven_seg = 7'b1111_110;      //abcdef
            4'd1 : seven_seg = 7'b0110_000;     //bc
            4'd2 : seven_seg = 7'b1101_101;     //abged
            4'd3 : seven_seg = 7'b1111_001;     //abgcd
            4'd4 : seven_seg = 7'b0110_011;     //fgbc
            4'd5 : seven_seg = 7'b1011_011;    //afgcd
            4'd6 : seven_seg = 7'b1011_111;    //afedcg
            4'd7 : seven_seg = 7'b1110_000;    //abc
            4'd8 : seven_seg = 7'b1111_111;    //abcdefg
            4'd9 : seven_seg = 7'b1111_011;    //abcdfg
            default : seven_seg = 7'b0000_000;
          endcase
    end
 
 endmodule


