`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2024 03:14:44 AM
// Design Name: 
// Module Name: decoder_4x16
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


module decoder_4x16(
    input [3:0] w,
    input en,
    output [0:15] y
    );
    wire [0:3] eng;
    
    decoder_2x4 D1(
        .en(en),
        .w(w[3:2]),
        .y(eng[0:3])
    );
    
    decoder_2x4 D2(
        .en(eng[0]),
        .w(w[1:0]),
        .y(y[0:3])
    );
    
    decoder_2x4 D3(
        .en(eng[1]),
        .w(w[1:0]),
        .y(y[4:7])
    );
    
    decoder_2x4 D4(
        .en(eng[2]),
        .w(w[1:0]),
        .y(y[8:11])
    );
    
    decoder_2x4 D5(
        .en(eng[3]),
        .w(w[1:0]),
        .y(y[12:15])
    );
    
    
endmodule
