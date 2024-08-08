`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2024 09:30:50 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input wire clk,
    input wire reset,
    input wire load_en,
    input wire [2:0] color_select,         
    input wire [12:0] cycle_switch, 
    output wire [2:0] rgb_output           
);

    reg [12:0] red_duty_cycle;
    reg [12:0] green_duty_cycle;
    reg [12:0] blue_duty_cycle;  

    reg [12:0] red_duty_reg;
    reg [12:0] green_duty_reg;
    reg [12:0] blue_duty_reg; 

    always @(*) begin
        case (color_select)
            3'b001: begin
                red_duty_cycle = cycle_switch;
                green_duty_cycle = 13'b0;
                blue_duty_cycle = 13'b0;
            end
            3'b010: begin
                red_duty_cycle = 13'b0;
                green_duty_cycle = cycle_switch;
                blue_duty_cycle = 13'b0;
            end
            3'b100: begin
                red_duty_cycle = 13'b0;
                green_duty_cycle = 13'b0;
                blue_duty_cycle = cycle_switch;
            end
            default: begin
                red_duty_cycle = 13'b0;
                green_duty_cycle = 13'b0;
                blue_duty_cycle = 13'b0;
            end
        endcase
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            red_duty_reg <= 13'b0;
            green_duty_reg <= 13'b0;
            blue_duty_reg <= 13'b0;
        end else if (load_en) begin
            red_duty_reg <= red_duty_cycle;
            green_duty_reg <= green_duty_cycle;
            blue_duty_reg <= blue_duty_cycle;
        end
    end

    rgb_controller #(.CNT_WIDTH(13)) rgb_inst (
        .clk(clk),
        .reset(reset),
        .red_intensity(red_duty_reg),
        .green_intensity(green_duty_reg),
        .blue_intensity(blue_duty_reg),
        .red_output(rgb_output[0]),
        .green_output(rgb_output[1]),
        .blue_output(rgb_output[2])
    );

endmodule

