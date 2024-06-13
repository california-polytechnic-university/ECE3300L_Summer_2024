`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joshua Castillo
// 
// Create Date: 06/12/2024 04:40:50 PM
// Design Name: 
// Module Name: Lab1
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


module Lab1(
    input wire [3:0] SW, // 4-bit input
    output wire [15:0] LED // 16-bit output
    );
    wire [3:0] not_SW;

    assign not_SW = ~SW;
    
    assign LED[0]  = ~SW[0] & ~SW[1] & ~SW[2] & ~SW[3];
    assign LED[1]  = SW[0] & ~SW[1] & ~SW[2] & ~SW[3];
    assign LED[2]  = ~SW[0] & SW[1] & ~SW[2] & ~SW[3];
    assign LED[3]  = SW[0] & SW[1] & ~SW[2] & ~SW[3];
    assign LED[4]  = ~SW[0] & ~SW[1] & SW[2] & ~SW[3];
    assign LED[5]  = SW[0] & ~SW[1] & SW[2] & ~SW[3];
    assign LED[6]  = ~SW[0] & SW[1] & SW[2] & ~SW[3];
    assign LED[7]  = SW[0] & SW[1] & SW[2] & ~SW[3];
    assign LED[8]  = ~SW[0] & ~SW[1] & ~SW[2] & SW[3];
    assign LED[9]  = SW[0] & ~SW[1] & ~SW[2] & SW[3];
    assign LED[10] = ~SW[0] & SW[1] & ~SW[2] & SW[3];
    assign LED[11] = SW[0] & SW[1] & ~SW[2] & SW[3];
    assign LED[12] = ~SW[0] & ~SW[1] & SW[2] & SW[3];
    assign LED[13] = SW[0] & ~SW[1] & SW[2] & SW[3];
    assign LED[14] = ~SW[0] & SW[1] & SW[2] & SW[3];
    assign LED[15] = SW[0] & SW[1] & SW[2] & SW[3];

endmodule
