`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2024 02:19:53 AM
// Design Name: 
// Module Name: top_tb
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

module top_tb;

    parameter WIDTH = 13;
    reg clk;
    reg rst;
    reg color_change;
    reg [WIDTH-1:0] intensity;
    reg [2:0] color_sel;
    wire red_output, green_output, blue_output;

    top #(.WIDTH(WIDTH)) uut (
        .clk(clk),
        .rst(rst),
        .color_change(color_change),
        .intensity(intensity),
        .color_sel(color_sel),
        .red_output(red_output),
        .green_output(green_output),
        .blue_output(blue_output)
    );


    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial 
    begin
 
        rst = 1;
        color_change = 0;
        intensity = 0;
        color_sel = 3'b000;

        #20 
        rst = 0;

        #10
         intensity = 13'h1FFF; 
        color_sel = 3'b001;
        color_change = 1;
        #10
         color_change = 0;

       
        #10 
        intensity = 13'h0FFF; 
        color_sel = 3'b010;
        color_change = 1;
      
        #10 
        color_change = 0;

        #10
         intensity = 13'h07FF; 
        color_sel = 3'b100;
        color_change = 1;
        #10 color_change = 0;

        #10 
        rst = 1;
        #20 
        rst = 0;
        
        #50 
        $finish;
    end

endmodule

