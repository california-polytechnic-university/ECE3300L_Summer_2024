`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2024 10:41:04 AM
// Design Name: 
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
    output [13:0] top_led,
    output [2:0] top_led_color
           );
    
        assign top_led = top_sw;
    
        mux4x1 LEDBCONT(
                        .sel(top_sw[1:0]),
                        .mux4x1_inp(top_sw[5:2]),
                        .mux4x1_op(top_led_color[0])
                        );
    
        mux4x1 LEDGCONT(
                        .sel(top_sw[1:0]),
                        .mux4x1_inp(top_sw[9:6]),
                        .mux4x1_op(top_led_color[1])
                        );

        mux4x1 LEDRCONT(
                        .sel(top_sw[1:0]),
                        .mux4x1_inp(top_sw[13:10]),
                        .mux4x1_op(top_led_color[2])
                        );

endmodule
