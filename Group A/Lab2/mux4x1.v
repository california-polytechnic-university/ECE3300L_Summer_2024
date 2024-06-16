`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2024 06:14:24 PM
// Design Name: 
// Module Name: mux4x1
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


module mux4x1(
    input x0, x1, x2, x3,
    input s0, s1,
    output f
    );
    
    wire f0, f1;
    
    mux2x1 M0 (
        .x0(x0), 
        .x1(x1), 
        .s(s0), 
        .f(f0)
    );
    
    mux2x1 M1 (
        .x0(x2),
        .x1(x3),
        .s(s0),
        .f(f1)
    );
    
    mux2x1 M2 (
        .x0(f0),
        .x1(f1),
        .s(s1),
        .f(f)
    );
    
endmodule
