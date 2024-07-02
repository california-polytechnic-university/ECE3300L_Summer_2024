`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2024 11:30:20 PM
// Design Name: 
// Module Name: up_counter
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


module up_counter(
    input clk,
    input reset_n,
    input enable,
    input sel,
    output [3:0] Q  
    );
    
    reg [3:0] Q_reg, Q_next;
    wire done;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            Q_reg <= 'b0;
        else
            Q_reg <= Q_next;
    end
    
    // Next State Logic
    assign done = Q_reg == 9;
    always @(*)
    begin
        Q_next = Q_reg;
        case(sel)
            1'b0: Q_next = done? 'b0: Q_reg + 1;
            1'b1: Q_next = Q_reg + 1;
            default: Q_next = Q_reg;
        endcase
    end
    
    assign Q = Q_reg;
    
endmodule
