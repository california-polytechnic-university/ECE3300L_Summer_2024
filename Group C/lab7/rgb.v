`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2024 02:19:25 AM
// Design Name: 
// Module Name: rgb
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
module rgb
    #(parameter WIDTH = 8) (
    input wire clk,
    input wire rst,
    input wire [WIDTH - 1:0] red_intensity, green_intensity, blue_intensity,
    output wire red_output, green_output, blue_output
    );

    pwm #(.WIDTH(WIDTH)) pwm_red (
        .clk(clk),
        .rst(rst),
        .duty_cycle(red_intensity),
        .pwm_signal(red_output)
    );

    pwm #(.WIDTH(WIDTH)) pwm_green (
        .clk(clk),
        .rst(rst),
        .duty_cycle(green_intensity),
        .pwm_signal(green_output)
    );

    pwm #(.WIDTH(WIDTH)) pwm_blue (
        .clk(clk),
        .rst(rst),
        .duty_cycle(blue_intensity),
        .pwm_signal(blue_output)
    );

endmodule

