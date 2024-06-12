`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Willy Quezada
// 
// Create Date: 06/08/2024 12:39:36 PM
// Design Name: 
// Module Name: Lab1_decoder
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


module Lab1_decoder
#(parameter N = 4)
 (
    input [ N-1 : 0] w,
    input en,
    output reg [0: 2**N-1] y
    );
    
  always @(w, en)
  begin 
    y = 'b0;
    if(en)
        y[w] = 1'b1;
    else 
        y = 'b0;
   end
  endmodule

