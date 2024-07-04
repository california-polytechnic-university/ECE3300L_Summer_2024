`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2024 05:59:46 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk, rst, sel, en,
    input [4:0] sw,
    output [6:0] seg,
    output AN
    );
    
    wire [3:0] op;    
    wire clk_out;
    wire [31:0] counter;
    assign AN = 0;
    
upcounter count(
    .clk(clk_out),
    .rst(rst),
    .en(en),
    .sel(sel),
    .op(op)
    );
    
clock_divider clock(
    .clk(clk),
    .rst(rst),
    .sw(sw),
    .clk_out(clk_out),
    .counter(counter)
    );
    
seg display(
    .inp(op),
    .seg(seg)
    );
    
endmodule
