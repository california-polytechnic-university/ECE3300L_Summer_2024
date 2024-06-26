`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2024 12:45:09 PM
// Design Name: 
// Module Name: Lab2
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


module Lab2(
    input [1:0] sel, 
    input [3:0] mux4x1_inp,
    output mux4x1_op
    );
    
    wire [1:0] mux4x1_tmp;
     
    mux2x1 MUX0 (
        .sel(sel[0]),
        .mux2x1_inp(mux4x1_inp[1:0]),
        .mux2x1_op(mux4x1_tmp[0])
        );
 
     mux2x1 MUX1 (
        .sel(sel[0]),
        .mux2x1_inp(mux4x1_inp[3:2]),
        .mux2x1_op(mux4x1_tmp[1])
        );
        
     mux2x1 MUX2 (
        .sel(sel[1]),
        .mux2x1_inp(mux4x1_tmp),
        .mux2x1_op(mux4x1_op)
        ); 
endmodule
