`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2024 09:20:15 PM
// Design Name: 
// Module Name: mux_4x1
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


module mux_4x1(
    input x0, x1, x2, x3,
    output s0, s1,
    output f
    );
    wire g0, g1;
    
    mux_2x1 M0(
        .f(g0),
        .x1(x0),
        .x2(x1),
        .s(s0)
    );
    
     mux_2x1 M1(
        .f(g1),
        .x1(x2),
        .x2(x3),
        .s(s0)
    );
    
     mux_2x1 M2(
        .f(f),
        .x1(g0),
        .x2(g1),
        .s(s1)
    );
    
    
endmodule


