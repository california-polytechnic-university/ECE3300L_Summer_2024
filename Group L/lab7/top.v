`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2024 10:03:11 PM
// Design Name: 
// Module Name: top
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
// Logan and Ethan
//////////////////////////////////////////////////////////////////////////////////


module top
    #(parameter R = 13)
    (
        input clk,
        input reset,
        input change,
        input [R:0] intensity,
        input [2:0] selector,
        output wire red, green, blue
    );

    reg [R:0] R_reg, R_next, G_reg, G_next, B_reg, B_next;

    always @(posedge clk or negedge reset) // sequential
    begin
        if (!reset) 
        begin
            R_reg <= 'b0;
            G_reg <= 'b0;
            B_reg <= 'b0;
        end 
        else if (change)
        begin
            R_reg <= R_next;
            G_reg <= G_next;
            B_reg <= B_next;
        end
    end

    always @(*) // combinational
    begin
        R_next = R_reg;
        G_next = G_reg;
        B_next = B_reg;

        if (selector[2] == 1)
            R_next = intensity;

        if (selector[1] == 1)
            G_next = intensity;

        if (selector[0] == 1)
            B_next = intensity;
    end

    pwm #(.R(R)) LED_red (
        .clk(clk),
        .reset_n(reset),
        .duty(R_reg),
        .pwm_out(red)
    );

    pwm #(.R(R)) LED_green (
        .clk(clk),
        .reset_n(reset),
        .duty(G_reg),
        .pwm_out(green)
    );

    pwm #(.R(R)) LED_blue (
        .clk(clk),
        .reset_n(reset),
        .duty(B_reg),
        .pwm_out(blue)
    );
endmodule
