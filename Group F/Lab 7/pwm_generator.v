`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2024 07:53:55 PM
// Design Name: 
// Module Name: pwm_generator
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


module pwm_generator
#(parameter CNT_WIDTH = 8)
(
    input wire clk,
    input wire reset,
    input wire [CNT_WIDTH-1:0] duty_val, 
    output reg pwm_out
);

    reg [CNT_WIDTH-1:0] cnt_reg;

    always @(posedge clk or posedge reset) begin
        if (reset)
            cnt_reg <= 0;
        else
            cnt_reg <= cnt_reg + 1;
    end

    always @(*) begin
        pwm_out = (cnt_reg < duty_val);  
    end

endmodule


