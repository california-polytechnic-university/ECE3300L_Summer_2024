`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 06:56:13 AM
// Design Name: 
// Module Name: counter_divider
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


module counter_divider(
    input wire clk100MHz,
    input wire reset,
    input wire [4:0] sel,
    output wire divided_clk
    );
    reg [31:0] counter;
    wire [31:0] threshold;


    assign threshold = (1 << sel);

    always @(posedge clk100MHz or posedge reset) begin
        if (reset)
            counter <= 32'b0;
        else if (counter >= threshold)
            counter <= 32'b0;
        else
            counter <= counter + 1'b1;
    end

    assign divided_clk = (counter < (threshold >> 1)) ? 1'b0 : 1'b1;
endmodule
