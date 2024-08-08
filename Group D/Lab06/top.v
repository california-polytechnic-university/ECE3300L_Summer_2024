`timescale 1ns / 1ps
module top(
    input clk,
    input reset,
    input [4:0] x, 
    input [4:0] y, 
    input [1:0] op, 
    output [6:0] sseg,
    output [7:0] AN 
    );
    wire [7:0] result;
    wire sign;
    bcd calc(
        .reset(reset),
        .x(x),
        .y(y),
        .op(op),
        .result(result),
        .sign(sign)
    ); 
    sseg sd(
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y),
        .op(op),
        .result(result),
        .sign(sign),
        .sseg(sseg),
        .AN(AN)
    );
endmodule
