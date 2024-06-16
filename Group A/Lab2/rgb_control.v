`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2024 08:17:43 PM
// Design Name: 
// Module Name: rgb_control
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


module rgb_control(
    input [13:0] SW,
    output LED16_R, LED16_G, LED16_B
    );
    
    mux4x1 red(
        .x0(SW[2]), 
        .x1(SW[3]), 
        .x2(SW[4]), 
        .x3(SW[5]),
        .s0(SW[0]), 
        .s1(SW[1]),
        .f(LED16_R)
    );
    
    mux4x1 green(
        .x0(SW[6]), 
        .x1(SW[7]), 
        .x2(SW[8]), 
        .x3(SW[9]),
        .s0(SW[0]), 
        .s1(SW[1]),
        .f(LED16_G)
    );
    
    mux4x1 blue(
        .x0(SW[10]), 
        .x1(SW[11]), 
        .x2(SW[12]), 
        .x3(SW[13]),
        .s0(SW[0]), 
        .s1(SW[1]),
        .f(LED16_B)
    );
    
endmodule
