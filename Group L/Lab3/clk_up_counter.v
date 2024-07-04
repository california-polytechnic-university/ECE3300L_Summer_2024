`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 01:50:06 AM
// Design Name: 
// Module Name: clk_up_counter
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

// ECE 3300 Lab3: BCD/HEX Counter
// Ethan McKendell and Logan Zimmerman

module clk_up_counter(
    input wire clk,
    input wire rst,
    input wire [4:0] clk_frequency,
    output reg clk_divider
    );

    reg [31:0] clk_count;
    reg [31:0] max_count;

    always @(*) begin
        case (clk_frequency)
            
            // clk = 100Mhz = 1 0000 0000Hz (1 0000 0000 cycles/second)
            // the clk is slowed down using an up_counter to waste cycles
            // if the up_counter is counting up to 5000 0000 it will take ~0.5 seconds to complete this action
            // using this information, the posedge of the clk will occur every second
            
            5'b00000 : max_count = 1000000000; // every 2 seconds 7seg updates
            5'b00001 : max_count = 50000000;  // every second 7seg updates
            5'b00010 : max_count = 40000000;
            5'b00011 : max_count = 30000000;
            5'b00100 : max_count = 20000000;
            5'b00101 : max_count = 10000000;
            5'b00110 : max_count = 9000000;
            5'b00111 : max_count = 8000000;
            5'b01000 : max_count = 7000000;
            5'b01001 : max_count = 6000000;
            5'b01010 : max_count = 5000000;
            5'b01011 : max_count = 4000000;
            5'b01100 : max_count = 3000000;
            5'b01101 : max_count = 2000000;
            5'b01110 : max_count = 1000000;
            5'b01111 : max_count = 900000;
            5'b10000 : max_count = 800000;
            5'b10001 : max_count = 700000;
            5'b10010 : max_count = 600000;
            5'b10011 : max_count = 500000;
            5'b10100 : max_count = 400000;
            5'b10101 : max_count = 300000;
            5'b10110 : max_count = 200000;
            5'b10111 : max_count = 100000; // every 2 milliseconds 7seg updates
            5'b11000 : max_count = 90000;
            5'b11001 : max_count = 80000;
            5'b11010 : max_count = 70000;
            5'b11011 : max_count = 60000;
            5'b11100 : max_count = 50000; // every millisecond 7seg updates
            5'b11101 : max_count = 40000;
            5'd11110 : max_count = 30000;
            5'd11111 : max_count = 20000;
            default: max_count = 10000;
        endcase
    end

    always @(posedge clk or posedge rst)
    begin
        if(rst) 
            begin
                clk_count <= 0;
                clk_divider <= 1'b0;
            end 
            else 
            begin
                if(clk_count >= max_count) begin
                    clk_count <= 0;  // reset counter to 0 when max_count is reached
                    clk_divider <= ~clk_divider;
            end 
            else 
                begin
                clk_count <= clk_count + 1;
                end
        end
    end
endmodule
