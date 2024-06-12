`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2024 10:13:54 AM
// Design Name: 
// Module Name: sw_to_led_tb
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


module sw_to_led_tb(     
    );
     reg [15:0] sw_tb;
     wire [15:0] led_tb;
     sw_to_led sw_test(
     .sw(sw_tb),
     .led(led_tb)
     );
     
     initial
        begin
            sw_tb= 16'b1111111111111111;
            #10
            sw_tb=16'b1111011011110111;
            #10
            sw_tb=16'b1110111011101101;
            #10
            sw_tb=16'b0101101101101011;
            #10
             sw_tb=16'b1010110111010101;
            #10
            sw_tb=16'b1110101011101011;
            #10
            sw_tb=16'b1000000000000011;
            #10
            sw_tb=16'b1001010110100111;
            #10
           $finish;
     end
endmodule
