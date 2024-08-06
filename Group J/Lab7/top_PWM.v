`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2024 01:53:21 PM
// Design Name: 
// Module Name: top_PWM
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


module top_PWM #(parameter SIZE = 13) (
    input clk,
    input rst,
    input load_r,
    input load_g,
    input load_b,
    input [SIZE-1:0] Duty,
    output PWM_r,
    output PWM_g,
    output PWM_b
    );
    
    wire clk_slow;
    wire lock;
    wire clk_locked;
    
    clk_wiz_0 CLK_GEN_SLOW (
        // Clock out ports
        .clk_out1(clk_slow),
        // Status and control signals
        .reset(rst),
        .locked(lock),
        // Clock in ports
        .clk_in1(clk)
    );
    
    assign clk_locked = clk_slow & lock;
    
    PWM_CORE #(.R_SIZE(SIZE)) pwm_r (
        .clk(clk_locked),
        .rst(rst),
        .load(load_r),
        .Duty(Duty),
        .PWM(PWM_r)
    );
    
    PWM_CORE #(.R_SIZE(SIZE)) pwm_g (
        .clk(clk_locked),
        .rst(rst),
        .load(load_g),
        .Duty(Duty),
        .PWM(PWM_g)
    );
    
    PWM_CORE #(.R_SIZE(SIZE)) pwm_b (
        .clk(clk_locked),
        .rst(rst),
        .load(load_b),
        .Duty(Duty),
        .PWM(PWM_b)
    );
    
endmodule
