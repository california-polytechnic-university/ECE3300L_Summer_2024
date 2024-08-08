`timescale 1ns / 1ps

module rgb
 #(parameter WIDTH = 8)
 (
    input clk,
    input rst,
    input [WIDTH-1:0] red_duty,
    input [WIDTH-1:0] green_duty,
    input [WIDTH-1:0] blue_duty,
    output red_led,
    output green_led,
    output blue_led
);

    pwm #(.WIDTH(WIDTH)) red_pwm (
        .clk(clk),
        .rst(rst),
        .duty_cycle(red_duty),
        .pwm(red_led)
    );

    pwm #(.WIDTH(WIDTH)) green_pwm (
        .clk(clk),
        .rst(rst),
        .duty_cycle(green_duty),
        .pwm(green_led)
    );

    pwm #(.WIDTH(WIDTH)) blue_pwm (
        .clk(clk),
        .rst(rst),
        .duty_cycle(blue_duty),
        .pwm(blue_led)
    );

endmodule
