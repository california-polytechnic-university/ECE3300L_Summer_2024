`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2024 09:34:32 PM
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
    input [13:0] SW,
    output [2:0] LED
    );
    
    mux_4x1 LEDR(
        .x0(SW[2]),
        .x1(SW[3]),
        .x2(SW[4]),
        .x3(SW[5]),
        .f(LED[0]),
        .s0(SW[0]),
        .s1(SW[1])
    );
    
    mux_4x1 LEDG(
        .x0(SW[6]),
        .x1(SW[7]),
        .x2(SW[8]),
        .x3(SW[9]),
        .f(LED[1]),
        .s0(SW[0]),
        .s1(SW[1])
    );
    
    mux_4x1 LEDB(
        .x0(SW[10]),
        .x1(SW[11]),
        .x2(SW[12]),
        .x3(SW[13]),
        .f(LED[2]),
        .s0(SW[0]),
        .s1(SW[1])
    );
     
endmodule

