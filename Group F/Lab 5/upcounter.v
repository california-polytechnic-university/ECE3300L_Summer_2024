`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/17/2024 03:53:07 PM
// Design Name: 
// Module Name: upcounter
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


module upcounter(
    input clk,
    input rst,
    input enable,
    input selector,
    input dir,
    input load,
    input [3:0] load_num,
    output reg enable_out,
    output reg [3:0] tmp
);

    always @(posedge clk or posedge rst or posedge load) begin
        if (rst) begin
            tmp <= 4'b0000; // if reset, load tmp with zero
        end else if (load) begin
            tmp <= load_num; // if load button pressed, load the tmp from load_num
        end else if (enable) begin
            // Control logic based on selector and direction
            case({selector, dir})
                2'b00: begin // BCD and up
                    enable_out <= (tmp == 4'b1000);
                    tmp <= (tmp == 4'b1001) ? 4'b0000 : tmp + 1;
                end
                2'b01: begin // Hex and up
                    enable_out <= (tmp == 4'b1110);
                    tmp <= (tmp == 4'b1111) ? 4'b0000 : tmp + 1;
                end
                2'b10: begin // BCD and down
                    enable_out <= (tmp == 4'b0001);
                    tmp <= (tmp == 4'b0000) ? 4'b1001 : tmp - 1;
                end
                2'b11: begin // Hex and down
                    enable_out <= (tmp == 4'b0001);
                    tmp <= (tmp == 4'b0000) ? 4'b1111 : tmp - 1;
                end
                default: begin // Default case
                    enable_out <= 1'b0;
                end
            endcase
        end
    end

endmodule
