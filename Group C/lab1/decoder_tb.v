`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2024 12:42:42 PM
// Design Name: 
// Module Name: decoder_tb
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


module decoder_tb();
    reg [15:12] SW;
    wire [15:0] LED;
 
decoderSRC TEST(
    .SW(SW),
    .LED(LED)
);

    initial begin

    SW = 4'b0000; #10
    SW = 4'b0001; #10
    SW = 4'b0010; #10
    SW = 4'b0011; #10
    SW = 4'b0100; #10
    SW = 4'b0101; #10
    SW = 4'b0110; #10
    SW = 4'b0111; #10
    SW = 4'b1000; #10
    SW = 4'b1001; #10
    SW = 4'b1010; #10
    SW = 4'b1011; #10
    SW = 4'b1100; #10
    SW = 4'b1101; #10
    SW = 4'b1110; #10
    SW = 4'b1111; #10

    $finish;
    end    
endmodule
