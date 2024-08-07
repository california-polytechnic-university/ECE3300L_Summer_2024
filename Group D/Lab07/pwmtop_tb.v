`timescale 1ns / 1ps
module top_PWM_tb(
    );
    localparam SIZE = 13;
    reg clk;
    reg rst;
    reg r;
    reg g;
    reg b;
    reg [SIZE-1:0] x;
    wire PWM_r;
    wire PWM_g;
    wire PWM_b;
    top_PWM uut(
        .clk(clk),
        .rst(rst),
        .r(r),
        .g(g),
        .b(b),
        .x(x),
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
    r = 0;
    g = 0;
    b = 0;
    x = 13'b0_0000_0000_0000;
    #10
    rst = 1'b1;
    #2
    rst = 1'b0;
    r = 1;
    g = 0;
    b = 0;
    x = 13'b0_1111_1111_1111;
    #4_000_000
    rst = 1'b1;
    #2
    rst = 1'b0;
    r = 0;
    g = 1;
    b = 0;
    x = 13'b0_1111_1111_1111;
    #4_000_000
    rst = 1'b1;
    #2
    rst = 1'b0;
    r = 0;
    g = 0;
    b = 1;
    x = 13'b0_1111_1111_1111;
    #4_000_000
    rst = 1'b1;
    #2
    rst = 1'b0;
    r = 1;
    g = 0;
    b = 0;
    x = 13'b1_1111_1111_1111;
    #4_000_000
    rst = 1'b1;
    #2
    rst = 1'b0;
    r = 0;
    g = 1;
    b = 0;
    x = 13'b1_1111_1111_1111;
    #4_000_000
    rst = 1'b1;
    #2
    rst = 1'b0;
    r = 0;
    g = 0;
    b = 1;
    x = 13'b1_1111_1111_1111;
    #4_000_000
    $stop;
    end
endmodule
