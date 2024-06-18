`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2024 01:14:38 AM
// Design Name: 
// Module Name: rgb_mux_tb
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

// ECE 3300 Lab2: RGB Mux Testbench
// Ethan McKendell and Logan Zimmerman

module rgb_mux_tb;
    reg [14:3] SW_tb;
    reg [1:0] SEL_tb;
    wire LED16_R_tb, LED16_G_tb, LED16_B_tb;
    
    rgb_mux uut(
        .SW(SW_tb),
        .SEL(SEL_tb),
        .LED16_R(LED16_R_tb),
        .LED16_G(LED16_G_tb),
        .LED16_B(LED16_B_tb)
    );

    initial 
    begin
        SEL_tb = 2'b00;
        SW_tb = 12'b000000000000; // off
        #10;
        
        SW_tb = 12'b000100000000; #10; // red
        SW_tb = 12'b000000010000; #10; // green
        SW_tb = 12'b000000000001; #10; // blue
        SW_tb = 12'b000100010001; #10; // white
        
        SEL_tb = 2'b01;
        SW_tb = 12'b000000000000; // off
        #10;
        
        SW_tb = 12'b001000000000; #10; // red
        SW_tb = 12'b000000100000; #10; // green
        SW_tb = 12'b000000000010; #10; // blue
        SW_tb = 12'b001000100010; #10; // white
        
        SEL_tb = 2'b10;
        SW_tb = 12'b000000000000; // off
        #10;
        
        SW_tb = 12'b010000000000; #10; // red
        SW_tb = 12'b000001000000; #10; // green
        SW_tb = 12'b000000000100; #10; // blue
        SW_tb = 12'b010001000100; #10; // white
        
        SEL_tb = 2'b11;
        SW_tb = 12'b000000000000; // off
        #10;
        
        SW_tb = 12'b100000000000; #10; // red
        SW_tb = 12'b000010000000; #10; // green
        SW_tb = 12'b000000001000; #10; // blue
        SW_tb = 12'b100010001000; #10; // white
        
        // all unselected mux inputs are all HIGH
        // won't turn on the RGB LED
        SEL_tb = 2'b00;
        SW_tb = 12'b111011101110; // off
        #10;
        
        $finish;
    end
endmodule
