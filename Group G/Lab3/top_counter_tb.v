`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 11:33:27 AM
// Design Name: 
// Module Name: top_counter_tb
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


module top_counter_tb();
    reg rst_tb, enable_tb, selector_tb;
    reg [4:0] SEL_tb;
    reg clk_tb;
    wire [6:0] SEG_tb;
    
    top_counter DUT(clk_tb, rst_tb, enable_tb, selector_tb, SEL_tb, SEG_tb);
    
    always
        begin
            #1 clk_tb = ~clk_tb;
        end
     
    initial begin
             rst_tb = 1; clk_tb = 0; SEL_tb = 5'b00010; selector_tb = 0; enable_tb = 1;
        #5   rst_tb = 0; 
        #100 enable_tb = 0;
        #20  enable_tb = 1; SEL_tb = 5'b00100;
        #20  selector_tb = 1;
        #100;
       $finish;
        end
endmodule
