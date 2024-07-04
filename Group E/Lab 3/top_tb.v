`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2024 11:02:54 PM
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


module top_tb();
    reg clk, rst, sel, en;
    reg [4:0] sw;
    wire [3:0] counter_op;
    wire [6:0] seg;
    wire clk_div;
    
clock_divider clk_div_inst(
    .clk(clk),
    .sw(sw),
    .rst(rst),
    .clk_out(clk_div)
);

upcounter upcounter_inst(
    .clk(clk_div),
    .rst(rst),
    .sel(sel),
    .en(en),
    .op(counter_op)
);

seg seg_inst(
    .inp(counter_op),
    .seg(seg)
);
    
initial 
    begin
    clk = 0;
    rst = 1;
    sel = 1;
    en = 0;
    sw = 5'b00000;
    
    #10; rst = 0;
    
    #10; en = 1;
    #160; sw = 5'b00010;
    #160; sw = 5'b00100;
    
    #10; rst = 1;
    #10; rst = 0;
    
    #160; sel = 0;
    #160; sw = 5'b01111;
    
    #10; en = 0;
    #160;
    
    #1000; $stop;
    end
    
    begin
    always #5 clk = ~clk;
    end
endmodule
