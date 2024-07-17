`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/17/2024 04:38:28 AM
// Design Name: 
// Module Name: Tops_tb
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


module Tops_tb();
    reg clk_tb, reset_tb, up_down_tb, sel_tb, enable_tb;
    reg load_tb; // Load button
    reg [3:0] switch_input_tb; // 4-bit switch input
    reg [4:0] speed_ctrl_tb; // 5-bit speed control
    wire [6:0] seg_tb; // 7-segment display segments
    wire [3:0] AN_tb; // other 4 anodes to turn off
    wire [3:0] an_tb; // 4 anodes
    wire dp_tb; // decimal point
    
    Tops_Modules DUT(
        .clk(clk_tb), 
        .reset(reset_tb), 
        .up_down(up_down_tb), 
        .sel(sel_tb), 
        .enable(enable_tb),
        .load(load_tb), // Load button
        .switch_input(switch_input_tb), // 4-bit switch input
        .speed_ctrl(speed_ctrl_tb), // 5-bit speed control
        .seg(seg_tb), // 7-segment display segments
        .AN(AN_tb), // other 4 anodes to turn off
        .an(an_tb), // 4 anodes
        .dp(dp_tb) // decimal point
    );
    
    initial begin
        clk_tb = 0;
        forever #1 clk_tb = ~clk_tb;
    end
    
    initial begin
                reset_tb = 1; load_tb = 0; up_down_tb = 1; sel_tb = 1; enable_tb = 1; switch_input_tb = 4'b1110; speed_ctrl_tb = 5'b00000;
        #1      reset_tb = 0;
        #50     up_down_tb = 0;
        #50     sel_tb = 0;
        #50     enable_tb = 0;
        #20     enable_tb = 1;
        #10     load_tb = 1;
        #1      load_tb = 0;
        #50     speed_ctrl_tb = 5'b00010;
        #100;
        $finish;
    end
    
endmodule
