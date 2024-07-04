`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 10:22:48 PM
// Design Name: 
// Module Name: lab3_tb
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

module lab3_tb(
 
    );

    // Inputs
    reg clk;
    reg rst;
    reg enable;
    reg selector;
    reg [4:0] speed;
    reg SW;

    // Outputs
    wire [6:0] seg;
    wire AN;

    upcounter upcount (
        .clk(slow),
        .rst(rst),
        .enable(enable),
        .selector(selector),
        .op(upcounter_out)
    );
    
    bcd_to_7seg bcd_to_7seg_inst (
        .bcd(upcounter_out),
        .seg(seg)
    );
        
    initial 
        begin
            clk = 0;
            forever #5 clk = ~clk; // 10ns period clock (100 MHz)
        end
    
        initial 
        begin     
            rst = 1;      // initial reset
            enable = 0;     // do not start
            selector = 0;     // 0-F
    
            #10 rst = 0; // no reset
    
            #10 enable = 1; // enable counter
            
            #160    // let it count for 160ns
            
            #10 rst = 1;      // reset for 10ns
            #10 rst = 0;      // disable reset
            #10 selector = 1;   // 0-9
            
            
            #160    // let it run for another 160ns
    
            #10 enable = 0; // disable counter
            
            $finish;    // stop
        end

    
endmodule
