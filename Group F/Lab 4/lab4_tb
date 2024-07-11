`timescale 1ns / 1ps

module top_module_tb;

    // Constants
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Inputs
    reg clk;
    reg rst;
    reg selector;
    reg enable;
    reg dir;
    reg [4:0] speed;

    // Outputs
    wire [6:0] seg;
    wire [7:0] AN;

    // Instantiate the module under test
    top_module dut (
        .clk(clk),
        .rst(rst),
        .selector(selector),
        .enable(enable),
        .dir(dir),
        .speed(speed),
        .seg(seg),
        .AN(AN)
    );

    // Clock generation
    always begin
        #CLK_PERIOD / 2 clk = ~clk; // Toggle clock every half period
    end

    // Initial stimulus
    initial begin
        // Initialize inputs
        rst = 1'b1;
        selector = 1'b0;
        enable = 1'b0;
        dir = 1'b0;
        speed = 5'b00000;

        // Apply reset
        #20 rst = 1'b0;

        // Test case 1: Basic operation without enable
        #100;
        // Toggle selector to test different modes
        selector = 1'b1;
        #100;
        selector = 1'b0;
        #100;
        // Toggle direction to test counting up and down
        dir = 1'b1;
        #100;
        dir = 1'b0;

        // Test case 2: Enable counting
        enable = 1'b1;
        #1000;
        enable = 1'b0;

        // Add more test cases as needed

        // End simulation
        $finish;
    end

endmodule
