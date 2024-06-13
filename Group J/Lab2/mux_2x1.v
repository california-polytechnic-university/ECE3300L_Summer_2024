`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2024 09:10:24 PM
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
    input x1, x2, s,
    output f
    );
    wire sn,g0,g1;
    
    not (sn, s);
    and A0 (g0, x1, sn);
    and A1 (g1, x2, s);
    or O0 (f, g0, g1);
    
endmodule

