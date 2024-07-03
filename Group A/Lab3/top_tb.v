`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2024 10:59:38 PM
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

    );

    // inputs
    reg clk;
    reg reset;
    reg enable;
    reg selector;

    // outputs
    wire [6:0] sseg;  // sseg value
    wire [3:0] count; // bcd/hex value

    // instantiate the bcd counter
    bcd_counter uut_counter (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .selector(selector),
        .out(count)
    );

    // Instantiate the hex2sseg
    hex2sseg uut_hex2sseg (
        .hex(count),
        .sseg(sseg)
    );

    // clock
    initial 
    begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period clock (100 MHz)
    end

    initial 
    begin     
        reset = 1;      // initial reset
        enable = 0;     // do not start
        selector = 0;     // 0-F

        #10 reset = 0; // no reset

        #10 enable = 1; // enable counter
        
        #160    // let it count for 160ns
        
        #10 reset = 1;      // reset for 10ns
        #10 reset = 0;      // disable reset
        #10 selector = 1;   // 0-9
        
        
        #160    // let it run for another 160ns

        #10 enable = 0; // disable counter
        
        $finish;    // stop
    end

    
endmodule
