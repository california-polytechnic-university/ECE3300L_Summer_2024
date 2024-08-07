`timescale 1ns / 1ps
module top_PWM #(parameter SIZE = 13) (
    input clk,
    input rst,
    input r,
    input g,
    input b,
    input [SIZE-1:0] Duty,
    output PWM_r,
    output PWM_g,
    output PWM_b
    );
    wire clk_slow;
    wire lock;
    wire clk_locked;
    clk_wiz_0 CLK_GEN_SLOW (
        .clk_out1(clk_slow),
        .reset(rst),
        .locked(lock),
        .clk_in1(clk)
    );
    assign clk_locked = clk_slow & lock;
    pwm #(.R_SIZE(SIZE)) pwm_r (
        .clk(clk_locked),
        .rst(rst),
        .load(r),
        .Duty(Duty),
        .PWM(PWM_r)
    );
    pwm #(.R_SIZE(SIZE)) pwm_g (
        .clk(clk_locked),
        .rst(rst),
        .load(g),
        .Duty(Duty),
        .PWM(PWM_g)
    );
    pwm #(.R_SIZE(SIZE)) pwm_b (
        .clk(clk_locked),
        .rst(rst),
        .load(b),
        .Duty(Duty),
        .PWM(PWM_b)
    );
endmodule
