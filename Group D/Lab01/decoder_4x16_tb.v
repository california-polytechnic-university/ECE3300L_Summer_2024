`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2024 01:11:57 AM
// Design Name: 
// Module Name: decoder_4x16_tb
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


module tb_decoder4x16;

    reg  [15:0] SW;
    wire [15:0] LED;

    Decoder4x16 uut 
    (
        .SW(SW), 
        .LED(LED)
    );

    initial begin
        // Input initialization
        SW = 16'b0000000000000000; // Enable = 0, SW[3:0] = 0000
        #10;
        
        // Test cases with enable = 1
        SW = 16'b1000000000000000; #10; // Enable = 1, SW[3:0] = 0000
        SW = 16'b1000000000000001; #10; // Enable = 1, SW[3:0] = ....
        SW = 16'b1000000000000010; #10; 
        SW = 16'b1000000000000011; #10; 
        SW = 16'b1000000000000100; #10; 
        SW = 16'b1000000000000101; #10; 
        SW = 16'b1000000000000110; #10; 
        SW = 16'b1000000000000111; #10; 
        SW = 16'b1000000000001000; #10; 
        SW = 16'b1000000000001001; #10; 
        SW = 16'b1000000000001010; #10; 
        SW = 16'b1000000000001011; #10; 
        SW = 16'b1000000000001100; #10; 
        SW = 16'b1000000000001101; #10; 
        SW = 16'b1000000000001110; #10; 
        SW = 16'b1000000000001111; #10; 

        // Case with enable 0 just in case
        SW = 16'b0000000000000000; #10; // Enable = 0, SW[3:0] = 0000

        $finish;
    end
      
endmodule




//module tb_decoder_4x16;

//    reg  [3:0] SW;
//    wire [15:0] LED;

//    Unit Under Test (UUT)
//    decoder_4x16 uut 
//    (
//        .SW(SW), 
//        .LED(LED)
//    );

//    initial begin
//        // Input initialization
//        SW = 4'b0000;
//        #10;
        
//        // Test cases
//        SW = 4'b0000; #5;
//        SW = 4'b0001; #5;
//        SW = 4'b0010; #5;
//        SW = 4'b0011; #5;
//        SW = 4'b0100; #5;
//        SW = 4'b0101; #5;
//        SW = 4'b0110; #5;
//        SW = 4'b0111; #5;
//        SW = 4'b1000; #5;
//        SW = 4'b1001; #5;
//        SW = 4'b1010; #5;
//        SW = 4'b1011; #5;
//        SW = 4'b1100; #5;
//        SW = 4'b1101; #5;
//        SW = 4'b1110; #5;
//        SW = 4'b1111; #5;

//        // Invalid case
//        SW = 4'b2222; #10; // LED to 0s
        
//        $finish;
//    end
      
//endmodule
