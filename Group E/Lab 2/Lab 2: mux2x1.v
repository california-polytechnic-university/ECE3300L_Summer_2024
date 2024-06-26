`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Raymond Palacio
// 
// Create Date: 06/16/2024 09:24:39 AM
// Design Name: mux2x1
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
    
    wire [2:0] temp;
    
    not(temp[2], sel);
    and(temp[0], mux2x1_inp[0], temp[2]);
    and(temp[1], mux2x1_inp[1], sel);
    
    or(mux2x1_op, temp[0], temp[1]);
    
endmodule
