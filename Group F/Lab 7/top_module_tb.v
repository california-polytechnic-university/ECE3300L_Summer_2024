`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2024 09:42:31 PM
// Design Name: 
// Module Name: top_module_tb
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


module top_module_tb;

    parameter CNT_WIDTH = 13;  
    reg clk;
    reg reset;
    reg load_en;
    reg [2:0] color_select;        
    reg [CNT_WIDTH-1:0] cycle_switch; 
    wire [2:0] rgb_output;           

    top_module uut (
        .clk(clk),
        .reset(reset),
        .load_en(load_en),
        .color_select(color_select),
        .cycle_switch(cycle_switch),
        .rgb_output(rgb_output)
    );

    always begin
        #5 clk = ~clk; 
    end

    initial begin
        clk = 0;
        reset = 1;
        load_en = 0;
        color_select = 3'b000;
        cycle_switch = 13'b0;
        #10;
        
        reset = 0;
        #10;
        
        cycle_switch = 13'b0000100000000; 
        color_select = 3'b001; 
        load_en = 1;
        #10;
        load_en = 0;
        #100;
        
        cycle_switch = 13'b0001000000000; 
        color_select = 3'b010; 
        load_en = 1;
        #10;
        load_en = 0;
        #100;
        
        cycle_switch = 13'b0010000000000;
        color_select = 3'b100; 
        load_en = 1;
        #10;
        load_en = 0;
        #100;
        
        cycle_switch = 13'b0000000000000; 
        color_select = 3'b000; 
        load_en = 1;
        #10;
        load_en = 0;
        #100;
        
        $finish;
    end
    
endmodule

