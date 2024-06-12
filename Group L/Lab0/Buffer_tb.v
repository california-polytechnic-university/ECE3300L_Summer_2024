`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2024 01:35:11 PM
// Design Name: 
// Module Name: Buffer_tb
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

// ECE 3300 Lab0 Testbench
// Ethan McKendell and Logan Zimmerman

module Buffer_tb;
    reg [15:0] SW_tb;
    wire [15:0] LED_tb;

    Buffer uut(.SW(SW_tb), .LED(LED_tb));

    initial begin
        // Test each switch for 10ns
        SW_tb = 16'b0000000000000000; #10;
        SW_tb = 16'b0000000000000001; #10;
        SW_tb = 16'b0000000000000010; #10;
        SW_tb = 16'b0000000000000100; #10;
        SW_tb = 16'b0000000000001000; #10;
        SW_tb = 16'b0000000000010000; #10;
        SW_tb = 16'b0000000000100000; #10;
        SW_tb = 16'b0000000001000000; #10;
        SW_tb = 16'b0000000010000000; #10;
        SW_tb = 16'b0000000100000000; #10;
        SW_tb = 16'b0000001000000000; #10;
        SW_tb = 16'b0000010000000000; #10;
        SW_tb = 16'b0000100000000000; #10;
        SW_tb = 16'b0001000000000000; #10;
        SW_tb = 16'b0010000000000000; #10;
        SW_tb = 16'b0100000000000000; #10;
        SW_tb = 16'b1000000000000000; #10;
        SW_tb = 16'b1111111111111111; #10; // Test all switches ON    
        $finish;
    end    
endmodule
