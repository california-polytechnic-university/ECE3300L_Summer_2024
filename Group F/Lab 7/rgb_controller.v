`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2024 09:28:43 PM
// Design Name: 
// Module Name: rbg_controller
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


module rgb_controller
 #(parameter CNT_WIDTH = 8)
 (
    input wire clk,
    input wire reset,
    input wire [CNT_WIDTH-1:0] red_intensity,
    input wire [CNT_WIDTH-1:0] green_intensity,
    input wire [CNT_WIDTH-1:0] blue_intensity,
    output wire red_output,
    output wire green_output,
    output wire blue_output
);

    pwm_generator #(.CNT_WIDTH(CNT_WIDTH)) red_pwm_inst (
        .clk(clk),
        .reset(reset),
        .duty_val(red_intensity),
        .pwm_out(red_output)
    );

    pwm_generator #(.CNT_WIDTH(CNT_WIDTH)) green_pwm_inst (
        .clk(clk),
        .reset(reset),
        .duty_val(green_intensity),
        .pwm_out(green_output)
    );

    pwm_generator #(.CNT_WIDTH(CNT_WIDTH)) blue_pwm_inst (
        .clk(clk),
        .reset(reset),
        .duty_val(blue_intensity),
        .pwm_out(blue_output)
    );

endmodule

