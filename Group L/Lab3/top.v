`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 02:51:24 AM
// Design Name: 
// Module Name: bcd_hex_counter
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

module top(
    input clk,
    input rst,
    input en,
    input sel,
    input [4:0] clk_frequency,
    output [6:0] display_7seg
    );
    
    // value and clk_divider is needed within two instantiations
    wire clk_divider;
    wire [3:0] value;

    clk_up_counter divider(
        .clk(clk),
        .rst(rst),
        .clk_frequency(clk_frequency),
        .clk_divider(clk_divider)
    );
    
    bcd_hex_up_counter counter(
        .clk(clk_divider),
        .rst(rst),
        .en(en),
        .sel(sel),
        .value(value)
    );
    
    bcd_hex_to_7seg seven_segment(
        .value(value),
        .display_7seg(display_7seg)
    ); 
    
endmodule
