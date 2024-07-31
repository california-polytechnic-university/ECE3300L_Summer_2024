`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/30/2024 04:01:12 PM
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
    input reset_n,
    input [4:0] a, 
    input [4:0] b, 
    input [1:0] op, 
    output [6:0] sseg,
    output [7:0] AN 
    );

    wire [7:0] result;
    wire sign;
    
    bcd_calculator calc(
        .reset_n(reset_n),
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .sign(sign)
    );
    
    sseg_driver sd(
        .clk(clk),
        .reset_n(reset_n),
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .sign(sign),
        .sseg(sseg),
        .AN(AN)
    );

endmodule
