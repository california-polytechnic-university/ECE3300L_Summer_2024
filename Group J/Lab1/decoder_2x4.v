`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2024 03:06:31 AM
// Design Name: 
// Module Name: decoder_2x1
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


module decoder_2x4(
    input [1:0] w,
    input en,
    output [0:3]y
    );
    wire sn0,sn1;
    
    not N0 (sn0, w[0]);
    not N1 (sn1, w[1]);
    and A0 (y[0],en,sn0,sn1);
    and A1 (y[1],en,sn1,w[0]);
    and A2 (y[2],en,sn0,w[1]);
    and A3 (y[3],en,w[0],w[1]);
    
endmodule

