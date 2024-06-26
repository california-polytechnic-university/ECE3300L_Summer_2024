`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2024 01:17:32 PM
// Design Name: Joshua Castillo
// Module Name: top
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


module top(
        input [13:0] top_sw,
        output [2:0] top_led
             );
    
    
    Lab2 LEDRCONT (
                        .sel(top_sw[1:0]), 
                        .mux4x1_inp(top_sw[5:2]),
                        .mux4x1_op(top_led[0])
                   );
    
     Lab2 LEDGCONT (
                        .sel(top_sw[1:0]), 
                        .mux4x1_inp(top_sw[9:6]),
                        .mux4x1_op(top_led[1])
                   );

    Lab2 LEDBCONT (
                        .sel(top_sw[1:0]), 
                        .mux4x1_inp(top_sw[13:10]),
                        .mux4x1_op(top_led[2])
                   );
endmodule
