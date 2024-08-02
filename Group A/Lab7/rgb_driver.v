`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2024 03:46:07 PM
// Design Name: 
// Module Name: rgb_driver
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


module rgb_driver
    #(parameter size = 8) // 8 bit or 256 count duty cycle
    (
    input clk,
    input reset,
    input [size - 1:0] red_duty, green_duty, blue_duty, // duty values for each color LED
    output red_led, green_led, blue_led // led select output
    );
    
    pwm #(.size(size)) red( // instantiate a pwm module for each rgb led
        .clk(clk),
        .reset(reset),
        .duty_load(red_duty),
        .pwm_out(red_led)
    );
    
        pwm #(.size(size)) green(
        .clk(clk),
        .reset(reset),
        .duty_load(green_duty),
        .pwm_out(green_led)
    );
    
        pwm #(.size(size)) blue(
        .clk(clk),
        .reset(reset),
        .duty_load(blue_duty),
        .pwm_out(blue_led)
    );
    
endmodule
