`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2024 12:03:46 AM
// Design Name: 
// Module Name: Decoder_4x16_tb
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

// ECE 3300 Lab1: Decoder 4x16 Testbench
// Ethan McKendell and Logan Zimmerman

module Decoder_4x16_tb;
    reg [3:0] SW_tb;
    reg enable_tb;
    wire [15:0] LED_tb;

    Decoder_4x16 uut(.SW(SW_tb), .enable(enable_tb), .LED(LED_tb));

    initial begin
        SW_tb = 4'b0000;
        enable_tb = 0;
        
        // Test cases with enable_tb = 1
        enable_tb = 1;
    
        SW_tb = 4'b0000; #10; // SW = 0000 for 10ns
        SW_tb = 4'b0001; #10;
        SW_tb = 4'b0010; #10;
        SW_tb = 4'b0011; #10;
        SW_tb = 4'b0100; #10;
        SW_tb = 4'b0101; #10;
        SW_tb = 4'b0110; #10;
        SW_tb = 4'b0111; #10;
        SW_tb = 4'b1000; #10;
        SW_tb = 4'b1001; #10;
        SW_tb = 4'b1010; #10;
        SW_tb = 4'b1011; #10;
        SW_tb = 4'b1100; #10;
        SW_tb = 4'b1101; #10;
        SW_tb = 4'b1110; #10;
        SW_tb = 4'b1111; #10;
        
        // Test cases with enable_tb = 0
        enable_tb = 0;
        
        SW_tb = 4'b0000; #10;
        SW_tb = 4'b0001; #10;
        SW_tb = 4'b0010; #10;
        SW_tb = 4'b0011; #10;
        SW_tb = 4'b0100; #10;
        SW_tb = 4'b0101; #10;
        SW_tb = 4'b0110; #10;
        SW_tb = 4'b0111; #10;
        SW_tb = 4'b1000; #10;
        SW_tb = 4'b1001; #10;
        SW_tb = 4'b1010; #10;
        SW_tb = 4'b1011; #10;
        SW_tb = 4'b1100; #10;
        SW_tb = 4'b1101; #10;
        SW_tb = 4'b1110; #10;
        SW_tb = 4'b1111; #10;
        
        $finish;
    end
endmodule
