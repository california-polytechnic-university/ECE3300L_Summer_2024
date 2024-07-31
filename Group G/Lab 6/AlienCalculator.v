`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/30/2024 02:01:21 PM
// Design Name: 
// Module Name: AlienCalculator
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

module AlienCalculator (
    input [3:0] sw_val1,     // Switches for value of first number
    input sw_sign1,          // Switch for sign of first number
    input [3:0] sw_val2,     // Switches for value of second number
    input sw_sign2,          // Switch for sign of second number
    input [1:0] sw_op,       // Switches for operation selection
    input rst_calculator,    // Reset button for calculator
    input rst_display,       // Reset button for display
    input clk,               // Clock signal
    //output sign_out,       //only for simulation
    output [7:0] seg_out,    // 7-segment display outputs
    output [7:0] digit_en    // Digit enable signals for 7-segment display
    //output [7:0] result_out //only for simulation
);

wire [3:0] num1_bcd, num2_bcd;
wire signed [7:0] result_bcd;
wire [2:0] operation; // 2 for add, 4 for sub, 7 for mul
wire sign1, sign2, result_sign;

// Instantiate Input Interface
InputInterface input_interface (
    .sw_val1(sw_val1),
    .sw_val2(sw_val2),
    .sw_op(sw_op),
    .num1_bcd(num1_bcd),
    .num2_bcd(num2_bcd),
    .operation(operation)
);

// Instantiate Arithmetic Unit
ArithmeticUnit arithmetic_unit (
    .num1_bcd(num1_bcd),
    .num2_bcd(num2_bcd),
    .operation(operation),
    .result_bcd(result_bcd),
    .sign1(sw_sign1),
    .sign2(sw_sign2),
    .result_sign(result_sign)
);

// Instantiate Display Controller
DisplayController display_controller (
    .num1_bcd(num1_bcd),
    .num2_bcd(num2_bcd),
    .result_bcd(result_bcd),
    .operation(operation),
    .sign1(sw_sign1),
    .sign2(sw_sign2),
    .result_sign(result_sign),
    .seg_out(seg_out),
    .digit_en(digit_en),
    .clk(clk),
    .rst_display(rst_display)
);

assign sign_out = result_sign;
assign result_out = result_bcd;

endmodule
