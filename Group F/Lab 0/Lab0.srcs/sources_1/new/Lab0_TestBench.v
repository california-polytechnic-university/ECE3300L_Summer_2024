`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2024 04:23:09 PM
// Design Name: 
// Module Name: Lab0_TestBench
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

module Lab0_TestBench;

    // Inputs
    reg [15:0] SW;

    // Outputs
    wire [15:0] LED;

    // Instantiate the Unit Under Test (UUT)
    Lab0 uut (
        .SW(SW), 
        .LED(LED)
    );

    initial begin
        // Initialize Inputs
        SW = 16'b0000000000000000;
        
        // Wait for some time
        #100;
        
        // Apply test vectors
        SW = 16'b0000000000000001; #10;
        SW = 16'b0000000000000010; #10;
        SW = 16'b0000000000000100; #10;
        SW = 16'b0000000000001000; #10;
        SW = 16'b0000000000010000; #10;
        SW = 16'b0000000000100000; #10;
        SW = 16'b0000000001000000; #10;
        SW = 16'b0000000010000000; #10;
        SW = 16'b0000000100000000; #10;
        SW = 16'b0000001000000000; #10;
        SW = 16'b0000010000000000; #10;
        SW = 16'b0000100000000000; #10;
        SW = 16'b0001000000000000; #10;
        SW = 16'b0010000000000000; #10;
        SW = 16'b0100000000000000; #10;
        SW = 16'b1000000000000000; #10;
        
        // Add additional test cases if needed

        // Wait and finish
        #100;
        $finish;
    end
      
endmodule
