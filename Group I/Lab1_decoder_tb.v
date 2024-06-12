`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Willy Quezada
// 
// Create Date: 06/08/2024 12:48:36 PM
// Design Name: 
// Module Name: Lab1_decoder_tb
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


module Lab1_decoder_tb(

    );
    
 parameter N = 4;
 reg [N-1 : 0] w;
 reg en;
 wire [0: 2**N-1] y;
 integer k;
 
 Lab1_decoder #(.N(N)) uut0(
    .w(w),
    .en(en),
    .y(y)
 );
 
 initial #170 $finish;
 
 initial
 begin
    en = 1'b0;
 #5 en = 1'b1;
 w = 0;
 for(k = 0; k < 2**N; k = k+1)
 begin
   #10 w = k;
 end
 end
 endmodule
    
