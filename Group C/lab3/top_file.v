`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2024 04:02:50 PM
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


module top_file(
    input clk,
    input sysrst,
    input SWmode,
    input [4:0] speed, 
    input en,
    input sel,
    output AN,
    output [6:0] seg
    );
    reg [31:0] c_div;
    reg slow_clk;
    wire [3:0] count;
   
//);
     assign AN = SWmode;
     //(
     //);

     always @(posedge clk or posedge sysrst)
    begin
        if(sysrst)
        begin
            c_div <= 32'd0;
            slow_clk <= 1'b0;
        end
        else
        begin
            if(c_div >= (32'd100000000 >> speed))
            begin
            c_div <= 32'd0;
            slow_clk <= ~slow_clk;
            end
            else
            begin
            c_div <= c_div + 1;
            end
        end
    end

    counter bcd (
        .clk(slow_clk),
        .rst(sysrst),
       // .speed(SWmode),
        .enable(en),
        .selector(sel),
        .op(count)
    );

    sseg hexseg (
        .digit(count),
        .a_to_g(seg)
    );

endmodule
