`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2024 12:05:01 PM
// Design Name: 
// Module Name: SevenSegOutput
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


module SevenSegOutput(
        input [20:0] clk,
        input reset,
        input [3:0] ones,
        input [3:0] tens,
        input [3:0] hundreds,
        input [3:0] thousands,
        output reg [3:0] num_out,
        output reg [1:0] digit_select
    );
        initial digit_select = 0;
        
        always@(posedge clk[16] or posedge reset)
        begin
            if (reset)
                digit_select <= 2'b00;
            else begin
                if (digit_select >= 2'b11)
                    digit_select <= 2'b00;
                else
                    digit_select <= digit_select + 1;
            end
        end
        
        always@(*) begin
            case(digit_select)
                2'b00: num_out = ones;
                2'b01: num_out = tens;
                2'b10: num_out = hundreds;
                2'b11: num_out = thousands;
                default: num_out = 0;
            endcase
        end
        
endmodule
