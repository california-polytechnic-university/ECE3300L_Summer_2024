`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/30/2024 11:21:40 PM
// Design Name: 
// Module Name: AlienCalculator_tb
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


module AlienCalculator_tb();
    reg [3:0] value1, value2;
    reg sign1, sign2, rst_calc, rst_display, clk;
    reg [1:0] op;
    wire [7:0] seg_out, digit_en;
    
    AlienCalculator DUT(
        .sw_val1(value1),     // Switches for value of first number
        .sw_sign1(sign1),          // Switch for sign of first number
        .sw_val2(value2),     // Switches for value of second number
        .sw_sign2(sign2),          // Switch for sign of second number
        .sw_op(op),       // Switches for operation selection
        .rst_calculator(rst_calc),    // Reset button for calculator
        .rst_display(rst_display),       // Reset button for display
        .clk(clk),               // Clock signal
        .seg_out(seg_out),    // 7-segment display outputs
        .digit_en(digit_en)    // Digit enable signals for 7-segment display
    );
    
    initial begin
        forever #1 clk = ~clk;
    end
    
    initial begin
            value1 = 4'b1001; value2 = 4'b1001; sign1 = 0; sign2 = 0; clk = 0; op = 2'b00; rst_calc = 0; rst_display = 0;
        #1  value1 = 4'b1001; value2 = 4'b0001; sign2 = 1;
        #1  value1 = 4'b0111; value2 = 4'b1001; sign1 = 1; sign2 = 0; op = 2'b01;
        #1  value1 = 4'b0001; value2 = 4'b0001;
        #1  value1 = 4'b1001; value2 = 4'b1001; sign1 = 0; sign2 = 1; op = 2'b10;
        #1  sign1 = 1;
        $finish;
    end
    
endmodule

    
