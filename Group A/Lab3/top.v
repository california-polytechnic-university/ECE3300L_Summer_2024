`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2024 09:17:06 PM
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
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk,
    input reset,
    input enable,
    input selector,
    input [4:0] speed,
    input SW,
    output AN,
    output [6:0] sseg
    );
    
    reg [31:0] counter_divider; // counter for clock division
    reg slow_clk;               // slowed down clock for counter
    wire [3:0] count;           // 4-bit count for bcd output
    
    assign AN = SW;
    
    always @(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            counter_divider <= 32'd0;
            slow_clk <= 1'b0;
        end
        else
        begin
            if(counter_divider >= (32'd100000000 >> speed))
            begin
            counter_divider <= 32'd0;
            slow_clk <= ~slow_clk;
            end
            else
            begin
            counter_divider <= counter_divider + 1;
            end
        end
    end
    
    bcd_counter bcd_count(
        .clk(slow_clk),
        .reset(reset),
        .enable(enable),
        .selector(selector),
        .out(count)
    );
    
    hex2sseg hextosseg(
        .hex(count),
        .sseg(sseg)
    );
    
endmodule
