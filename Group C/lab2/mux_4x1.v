`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 07:34:03 AM
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
    input [1:0] sel_4,
    input [3:0] mux4_in,
    output mux4_out 
    );

    wire [1:0] mux4_temp;

    mux_2x1 MUX0(
        .sel_2(sel_4[0]),
        .mux2x1_inp(mux4_in[1:0]),
        .mux2x1_op(mux4_temp[0])
        );

    mux_2x1 MUX1(
        .sel_2(sel_4[0]),
        .mux2x1_inp(mux4_in[3:2]),
        .mux2x1_op(mux4_temp[1])
        );
        
    mux_2x1 MUX2(
        .sel_2(sel_4[1]),
        .mux2x1_inp(mux4_temp),    
        .mux2x1_op(mux4_out)
        );

endmodule

