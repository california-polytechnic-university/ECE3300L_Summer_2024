`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 10:03:10 PM
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
    input [4:0] csel,
    input [1:0] sel,
    input [3:0] load,
    input load_enable,
    output [6:0] sseg,
    output [7:0] AN
);

    // Clock divider for counter
    wire cdone;
    clock_divider module0(
        .csel(csel),
        .cdone(cdone),
        .clk(clk),
        .reset_n(reset_n)
    );
    
    wire [3:0] ones, tens, hundreds, thousands;
    multi_decade_counter mdc(
        .clk(cdone),
        .reset_n(reset_n),
        .enable(enable),
        .sel(sel),
        .load(load),
        .load_enable(load_enable),
        .ones(ones),
        .tens(tens),
        .hundreds(hundreds),
        .thousands(thousands)
    );
    
    sseg_driver sd(
        .clk(clk),
        .reset_n(reset_n),
        .ones(ones),
        .tens(tens),
        .hundreds(hundreds),
        .thousands(thousands),
        .sseg(sseg),
        .AN(AN)
    );

endmodule
