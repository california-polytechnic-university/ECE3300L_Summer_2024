`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2024 02:12:59 PM
// Design Name: 
// Module Name: top_PWM_tb
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


module top_PWM_tb(
    
    );
    localparam SIZE = 13;
    
    reg clk;
    reg rst;
    reg load_r;
    reg load_g;
    reg load_b;
    reg [SIZE-1:0] Duty;
    wire PWM_r;
    wire PWM_g;
    wire PWM_b;
    
    top_PWM uut(
        .clk(clk),
        .rst(rst),
        .load_r(load_r),
        .load_g(load_g),
        .load_b(load_b),
        .Duty(Duty),
        .PWM_r(PWM_r),
        .PWM_g(PWM_g),
        .PWM_b(PWM_b)
    );
    
    localparam T = 10;
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    
    initial
    begin
    
    rst = 1'b1;
    #2
    rst = 1'b0;
    load_r = 0;
    load_g = 0;
    load_b = 0;
    Duty = 13'b0_0000_0000_0000;
    #10
    
    // red 50% Duty Cycle
    rst = 1'b1;
    #2
    rst = 1'b0;
    load_r = 1;
    load_g = 0;
    load_b = 0;
    Duty = 13'b0_1111_1111_1111;
    #4_000_000
    
    // green 50% Duty Cycle
    rst = 1'b1;
    #2
    rst = 1'b0;
    load_r = 0;
    load_g = 1;
    load_b = 0;
    Duty = 13'b0_1111_1111_1111;
    #4_000_000
    
    // blue 50% Duty Cycle
    rst = 1'b1;
    #2
    rst = 1'b0;
    load_r = 0;
    load_g = 0;
    load_b = 1;
    Duty = 13'b0_1111_1111_1111;
    #4_000_000
    
    // red 100% Duty Cycle
    rst = 1'b1;
    #2
    rst = 1'b0;
    load_r = 1;
    load_g = 0;
    load_b = 0;
    Duty = 13'b1_1111_1111_1111;
    #4_000_000
    
    // green 100% Duty Cycle
    rst = 1'b1;
    #2
    rst = 1'b0;
    load_r = 0;
    load_g = 1;
    load_b = 0;
    Duty = 13'b1_1111_1111_1111;
    #4_000_000
    
    // blue 100% Duty Cycle
    rst = 1'b1;
    #2
    rst = 1'b0;
    load_r = 0;
    load_g = 0;
    load_b = 1;
    Duty = 13'b1_1111_1111_1111;
    #4_000_000
    
    $stop;
    
    end
    
endmodule
