`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2024 03:10:48 PM
// Design Name: 
// Module Name: top_tb
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

// ECE 3300 Lab7: RGB LED PWM Control

module top_tb;
    parameter R_tb = 13;
    
    reg clk_tb;
    reg reset_tb;
    reg change_tb;
    reg [R_tb:0] intensity_tb;
    reg [2:0] selector_tb;
    wire red_tb, green_tb, blue_tb;
    
    top #(.R(R_tb)) uut_top(
        .clk(clk_tb),
        .reset(reset_tb),
        .change(change_tb),
        .intensity(intensity_tb),
        .selector(selector_tb),
        .red(red_tb),
        .green(green_tb),
        .blue(blue_tb)
    );

    initial
    begin
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb; // 100MHz clk (10ns)
    end

    initial 
    begin
        clk_tb = 0;
        reset_tb = 1;
        change_tb = 0;
        intensity_tb = 0;
        selector_tb = 3'b000;
        
        #10 
        reset_tb = 0;
        
        
        // red
        intensity_tb = 14'd1000;
        selector_tb = 3'b100;
        change_tb = 1; 
        #2000
        
        change_tb = 0; #10
        
        $finish;
    end
    
endmodule

