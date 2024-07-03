`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 06:22:53 AM
// Design Name: 
// Module Name: top_counter
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


module top_counter(
    input wire clk,
    input wire rst,
    input wire enable,
    input wire selector,
    input wire [4:0] SEL,
    output wire [6:0] SEG
    );
    
    wire divided_clk;
    wire [31:0] count;

    // Instantiate ClockDivider
    counter_divider clock_divider (
        .clk100MHz(clk),
        .reset(rst),
        .sel(SEL),
        .divided_clk(divided_clk)
    );

    // Instantiate UpCounter
    counter up_counter (
        .clk_count(divided_clk),
        .enable_count(enable),
        .selector_count(selector),
        .reset_count(rst),
        .count(count)
    );

    // Instantiate Display
    bcdto7seg display(
        .count(count),
        .seg(SEG)
    );
    
endmodule
