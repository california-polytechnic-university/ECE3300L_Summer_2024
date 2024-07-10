`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2024 02:45:07 PM
// Design Name: 
// Module Name: multi_decade_counter
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


module multi_decade_counter(
    input clk,
    input reset_n,
    input enable,
    input [1:0] sel,
    output [3:0] ones, tens, hundreds, thousands  
    );
    
    wire done0, done1, done2, done3;
    wire a0, a1, a2, a3;
    
    updown_counter D0(
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .sel(sel),
        .done(done0),
        .Q(ones)
    );
    assign a0 = enable & done0;
    
    updown_counter D1(
        .clk(clk),
        .reset_n(reset_n),
        .enable(a0),
        .sel(sel),
        .done(done1),
        .Q(tens)
    );
    assign a1 = a0 & done1;
     
    updown_counter D2(
        .clk(clk),
        .reset_n(reset_n),
        .enable(a1),
        .sel(sel),
        .done(done2),
        .Q(hundreds)
    );
    assign a2 = a1 & done2;
    
   updown_counter D3(
        .clk(clk),
        .reset_n(reset_n),
        .enable(a2),
        .sel(sel),
        .done(done3),
        .Q(thousands)
    );
    assign a3 = a2 & done3;
    
endmodule
