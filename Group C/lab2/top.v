`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ECE 3300 Lab
// Engineer: Alisha Mehta
//
// Create Date: 07/04/2024 04:21:28 AM
// Design Name: Lab#2
// Module Name: top
// Project Name: Lab#2
// Target Devices: FPGA
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

//Structural modeling 

module top(
    input [13:0] SW,
    output [2:0] LED
    );

    mux_4x1 RED(
        .sel_4(SW[1:0]),
        .mux4_in(SW[5:2]),
        .mux4_out(LED[0])
        );
    mux_4x1 GREEN(
        .sel_4(SW[1:0]),
        .mux4_in(SW[9:6]),
        .mux4_out(LED[1])
        );
    mux_4x1 BLUE(
        .sel_4(SW[1:0]),
        .mux4_in(SW[13:10]),
        .mux4_out(LED[2])       
        );
        
endmodule