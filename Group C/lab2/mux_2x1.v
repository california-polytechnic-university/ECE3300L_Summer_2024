`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 04:49:44 PM
// Design Name: 
// Module Name: mux_2x1
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


module mux_2x1(
        input sel_2,
        input [1:0] mux2x1_inp,
        output mux2x1_op
    );
    wire [2:0] tmp;
    
   not(tmp[2],sel_2);
   and(tmp[0], mux2x1_inp[0], sel_2 );
   and(tmp[1], mux2x1_inp[1], sel_2);
   or(mux2x1_op, tmp[0], tmp[1]);
endmodule

