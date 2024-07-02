`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2024 10:26:45 PM
// Design Name: 
// Module Name: clock_divider3
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


module clock_divider3 (
    input clk,
    input reset_n,
    input enable,
    input [4:0] csel,
    output reg done
    );
    
    wire [31:0] Q;
    reg [31:0] Q_reg, Q_next;
    
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            Q_reg <= 'b0;
        else if(enable)
            Q_reg <= Q_next;
        else
            Q_reg <= Q_reg;
    end
    
    always @(Q_reg)
    begin
        Q_next = Q_reg + 1;
    end
    assign Q = Q_reg;
    
    integer k;
    always @(Q,csel)
    begin
    done = 1'bx;
    for(k = 0; k < 32; k = k+1)
        if(k==csel)
        done = Q[k];
    end
    
endmodule
