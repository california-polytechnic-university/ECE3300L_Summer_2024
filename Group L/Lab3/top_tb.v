`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 07:15:07 PM
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

// ECE 3300 Lab3: BCD/HEX Counter
// Ethan McKendell and Logan Zimmerman

module top_tb;   
    reg clk_tb;
    reg rst_tb;
    reg en_tb;
    reg sel_tb;
    reg [4:0] clk_frequency_tb;  
    
    wire [6:0] display_7seg_tb;
    
    top uut(
        .clk(clk_tb),
        .rst(rst_tb),
        .en(en_tb),
        .sel(sel_tb),
        .clk_frequency(clk_frequency_tb),
        .display_7seg(display_7seg_tb)
    );
    
//    clk_up_counter divider(
//        .clk(clk_tb),
//        .rst(rst_tb),
//        .clk_frequency(clk_frequency_tb),
//        .clk_divider(clk_divider_tb)
//    );
    
//    bcd_hex_up_counter counter(
//        .clk(clk_divider_tb),
//        .rst(rst_tb),
//        .en(en_tb),
//        .sel(sel_tb),
//        .value(value_tb)
//    );
    
//    bcd_hex_to_7seg seven_segment(
//        .value(value_tb),
//        .display_7seg(display_7seg_tb)
//    ); 
    
    initial 
    
    begin
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb; // 100 MHz clk (10ns)
    end

    initial 
    begin
        rst_tb = 0;
        en_tb = 1;
        sel_tb = 1;
        clk_frequency_tb = 5'b11111;
        
        #10000;
        
        $finish;
    end
    
endmodule
