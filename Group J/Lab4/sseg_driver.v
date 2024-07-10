`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2024 02:48:38 PM
// Design Name: 
// Module Name: sseg_driver
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


module sseg_driver(
    input clk,
    input reset_n,
    input [3:0] ones,
    input [3:0] tens,
    input [3:0] hundreds,
    input [3:0] thousands,
    output reg [6:0] sseg,
    output reg [7:0] AN
);

    // Multiplexing logic
    reg [1:0] current_display;
    reg [19:0] clk_divider; // Slow down the clock for multiplexing

    // Clock divider for multiplexing
    always @(posedge clk or posedge reset_n) begin
        if (reset_n)
            clk_divider <= 0;
        else
            clk_divider <= clk_divider + 1;
    end

    // Digit select logic
    always @(posedge clk_divider[19] or posedge reset_n) begin
        if (reset_n)
            current_display <= 2'b00;
        else
            current_display <= current_display + 1;
    end

    // 7-segment display decoder
    reg [3:0] current_digit;
    always @(*) begin
        case (current_display)
            2'b00: current_digit = ones;
            2'b01: current_digit = tens;
            2'b10: current_digit = hundreds;
            2'b11: current_digit = thousands;
            default: current_digit = 4'b0000;
        endcase
    end

    // Display the current digit on the 7-segment display
    wire [6:0] sseg_wire;
    hex2sseg display1(
        .hex(current_digit),
        .sseg(sseg_wire)
    );
    
    always @(*) begin
        sseg = sseg_wire;
    end

    // Enable signals for each digit
   always @(*) begin
        case (current_display)
            2'b00: AN = 8'b1111_1110;
            2'b01: AN = 8'b1111_1101;
            2'b10: AN = 8'b1111_1011;
            2'b11: AN = 8'b1111_0111;
            default: AN = 8'b1111_1111;
        endcase
    end
                
endmodule
