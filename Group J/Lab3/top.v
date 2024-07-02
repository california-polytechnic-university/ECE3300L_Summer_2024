`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2024 11:19:41 PM
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
    input reset_n,
    input enable,
    input sel,
    input [4:0] csel,
    output [6:0] sseg,
    output [7:0] AN,
    output DP
    );
    assign AN = 8'b11111110;
    assign DP = 1;
    
    wire done;
    clock_divider3 cd(
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .csel(csel),
        .done(done)
    );
    
    wire [3:0] Q;
    up_counter uc(
        .clk(done),
        .reset_n(reset_n),
        .enable(enable),
        .sel(sel),
        .Q(Q)
    );
    
    hex2sseg hs(
        .hex(Q),
        .sseg(sseg)
    );
    
    
endmodule

