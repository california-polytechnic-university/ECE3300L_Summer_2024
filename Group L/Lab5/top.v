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

// ECE 3300 Lab5: BCD/HEX Up/Down Counter with Loading Values
// Ethan McKendell and Logan Zimmerman

module top(
    input wire clk, // 100Mhz
    input wire rst,
    input wire en,
    input wire mode, // mode = 0 (HEX), mode = 1 (BCB)
    input wire direction, // direction = 0 (down), direction = 1 (up)
    input wire [4:0] clk_frequency,
    
    input wire load,
    input wire [3:0] load_count,
    
    output wire [7:0] AN, // active led 7seg display
    output wire [6:0] SEG
    );
    
    // needed within 2+ instantiations
    wire clk_divider;
    wire clk_refresh; // 10 000ns
    
    wire [15:0] value; // unpacked 4-bit bcd/hex numbers
    wire [3:0] bcd_hex_value;
    
    wire carry0, carry1, carry2, carry3;
    wire [3:0] count0, count1, count2, count3; // thousands, hundreds, tens, ones
    
    clk_up_counter clk_up_counter(
        .clk(clk),
        .rst(rst),
        .clk_frequency(clk_frequency),
        .clk_divider(clk_divider),
        .clk_refresh(clk_refresh)
    );
    
    bcd_hex_up_down_counter counter0(
        .clk_divider(clk_divider),
        .rst(rst),
        .en(en), // enable to start counting ones place
        .mode(mode),
        .direction(direction),
        .load(load),
        .load_count(load_count),
        .count(count0),
        .carry_out(carry0)
    );

    bcd_hex_up_down_counter counter1(
        .clk_divider(clk_divider),
        .rst(rst),
        .en(carry0), // enable to start counting tens place
        .mode(mode),
        .direction(direction),
        .load(load),
        .load_count(load_count),
        .count(count1),
        .carry_out(carry1)
    );

    bcd_hex_up_down_counter counter2(
        .clk_divider(clk_divider),
        .rst(rst),
        .en(carry0 & carry1), // enable to start counting tens place
        .mode(mode),
        .direction(direction),
        .load(load),
        .load_count(load_count),
        .count(count2),
        .carry_out(carry2)
    );

    bcd_hex_up_down_counter counter3(
        .clk_divider(clk_divider),
        .rst(rst),
        .en(carry0 & carry1 & carry2), // enable to start counting tens place
        .mode(mode),
        .direction(direction),
        .load(load),
        .load_count(load_count),
        .count(count3),
        .carry_out() // no cary_out needed
    );
    
    // unpacked 4-bit bcd/hex numbers
    // {thousands, hundreds, tens, ones}
    assign value = {count3, count2, count1, count0};
    
    refresh_up_counter refresh_up_counter(
        .clk_refresh(clk_refresh),
        .rst(rst),
        .value(value),
        .bcd_hex_value(bcd_hex_value),
        .AN(AN)
    );
    
    bcd_hex_to_7seg bcd_hex_to_7seg(
        .bcd_hex_value(bcd_hex_value),
        .SEG(SEG)
    ); 
    
endmodule