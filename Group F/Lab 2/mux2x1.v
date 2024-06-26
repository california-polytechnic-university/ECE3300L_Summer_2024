`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2024 01:03:07 PM
// Design Name: 
// Module Name: mux2x1
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


module mux2x1(
    input sel,
    input [1:0] mux2x1_inp,
    output mux2x1_op
    );

    wire [2:0] tmp;

    not (tmp[2], sel);
    and (tmp[0], mux2x1_inp[0], tmp[2]);
    and (tmp[1], mux2x1_inp[1], sel);
    or (mux2x1_op,tmp[0], tmp[1]);
    
endmodule
