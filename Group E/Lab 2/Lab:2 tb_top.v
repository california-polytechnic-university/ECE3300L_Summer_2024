`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2024 11:06:36 AM
// Design Name: 
// Module Name: top_tb
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


module tb_top;

    reg [13:0] sw;
    wire [13:0] led;
    wire [2:0] led_color;

    // Instantiate the top module
    top X (
        .top_sw(sw),
        .top_led(led),
        .top_led_color(led_color)
          );

    initial 
        begin 

        
        sw = 14'b0000_0000_0000_00;
        #10; 

        
        sw = 14'b0000_0000_0001_01; 
        #10;

        sw = 14'b0000_0010_0001_01; 
        #10;

        sw = 14'b0001_1001_0011_01; 
        #10;

        sw = 14'b1100_1010_0100_10; 
        #10;
        
        sw = 14'b1000_1000_1000_11;

       

        
        $finish;
        end

endmodule
