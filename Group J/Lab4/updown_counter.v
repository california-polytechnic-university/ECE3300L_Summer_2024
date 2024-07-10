`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2024 02:44:25 PM
// Design Name: 
// Module Name: updown_counter
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


module updown_counter(
    input clk,
    input reset_n,
    input enable,
    input [1:0] sel,
    output done,
    output [3:0] Q  
    );

    reg [3:0] Q_reg, Q_next;
   
    always @(posedge clk or posedge reset_n) begin
        if (reset_n)
            Q_reg <= 4'b0000;
        else if (enable)
            Q_reg <= Q_next;
    end
   
    // Done signal logic
    assign done = (sel[0] == 1'b0) ? (Q_reg == 4'b1001) : (Q_reg == 4'b1111);
   
    // Next State Logic
    always @(*) begin
        case(sel)
            2'b00: begin // BCD Up Counter
                if (Q_reg == 4'b1001)
                    Q_next = 4'b0000;
                else
                    Q_next = Q_reg + 1;
            end
            2'b10: begin // BCD Down Counter
                if (Q_reg == 4'b0000)
                    Q_next = 4'b1001;
                else
                    Q_next = Q_reg - 1;
            end
            2'b01: begin // HEX Up Counter
                Q_next = Q_reg + 1;
            end
            2'b11: begin // HEX Down Counter
                Q_next = Q_reg - 1;
            end
            default: Q_next = Q_reg;
        endcase
    end
   
    assign Q = Q_reg;
   
endmodule
