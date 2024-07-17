`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/17/2024 04:00:50 PM
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

    // Inputs
    reg clk;
    reg rst;
    reg selector;
    reg enable;
    reg dir;
    reg load;
    reg [3:0] load_num;
    reg [4:0] speed;

    // Outputs
    wire [6:0] seg;
    wire [7:0] AN;

    // Instantiate the Unit Under Test (UUT)
    top_module uut (
        .clk(clk), 
        .rst(rst), 
        .selector(selector), 
        .enable(enable), 
        .dir(dir), 
        .load(load),
        .load_num(load_num), 
        .speed(speed), 
        .seg(seg), 
        .AN(AN)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    initial begin
        // Initialize Inputs
        rst = 1;
        selector = 0;
        enable = 0;
        dir = 0;
        load = 0;
        load_num = 4'b0000;
        speed = 5'b00001;

        // Wait 100 ns for global reset to finish
        #100;
        rst = 0;

        // Test case 1: Load value into counter
        load_num = 4'b0101; // Load 5
        load = 1;
        #10;
        load = 0;
        #10;

        // Test case 2: Enable counter and count up in BCD mode
        enable = 1;
        selector = 0;
        dir = 0;
        #200;

        // Test case 3: Change speed and count up in BCD mode
        speed = 5'b00010;
        #200;

        // Test case 4: Change direction to count down in BCD mode
        dir = 1;
        #200;

        // Test case 5: Switch to hexadecimal mode and count up
        selector = 1;
        dir = 0;
        #200;

        // Test case 6: Reset the counter
        rst = 1;
        #20;
        rst = 0;
        #200;

        // Test case 7: Load a different value and count down in hexadecimal mode
        load_num = 4'b1010; // Load 10
        load = 1;
        #10;
        load = 0;
        dir = 1;
        selector = 1;
        enable = 1;
        #200;

        // End of simulation
        $stop;
    end

endmodule
