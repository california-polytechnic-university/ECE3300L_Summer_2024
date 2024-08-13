`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2024 11:40:03 PM
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
    input clk,
    input rst,    
    input [4:0] x, 
    input [4:0] y, 
    input [1:0] op, 
    output [6:0] sseg,
    output [7:0] AN
    );
    
    wire [7:0] out; 
    wire sign;
    
    bcd X(
        .rst(rst),
        .x(x),
        .y(y),
        .op(op),
        .out(out),
        .sign(sign)
    ); 
    
    ssd X1(
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y),
        .op(op),
        .out(out),
        .sign(sign),
        .sseg(sseg),
        .AN(AN)
    );
    
endmodule
