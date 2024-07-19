`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2024 10:10:44 PM
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


module top_tb(
    reg clk_tb;
    reg rst_tb;
    reg en_tb;
    reg mode_tb;
    reg direction_tb;
    reg [4:0] clk_frequency_tb;  
    
    reg load_tb;
    reg [3:0] load_count_tb;
    
    wire [7:0] AN_tb;
    wire [6:0] SEG_tb;
    
    top uut(
        .clk(clk_tb),
        .rst(rst_tb),
        .en(en_tb),
        .mode(mode_tb),
        .direction(direction_tb),
        .clk_frequency(clk_frequency_tb),
        .load(load_tb),
        .load_count(load_count_tb),
        .AN(AN_tb),
        .SEG(SEG_tb)
    );
    
    initial 
    
    begin
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb; // 100 MHz clk (10ns)
    end

    initial 
    begin
        rst_tb = 1;
        en_tb = 0;
        mode_tb = 0; // mode_tb = 0 (HEX), mode_tb = 1 (BCD)
        direction_tb = 1; // direction_tb = 0 (DOWN), direction_tb = 1 (UP)
        clk_frequency_tb = 5'b11010; // max_count = 49999 (1ms clk)
        #10;
        
        // Start counting UP in BCD every 10 000ns
        rst_tb = 0;
        en_tb = 1;
        mode_tb = 1;
        direction_tb = 1;
        #2000000;
        
        load_tb = 1;
        load_count_tb = 4'b1000; // Load 8 to every 7seg display
        
        #2000000;
        
        $finish;
    end
    );
endmodule
