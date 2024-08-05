`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2024 03:27:46 AM
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


module top_tb;
    reg clk_tb;
    reg rst_tb;
    
    reg [4:0] operand_a_tb;
    reg [4:0] operand_b_tb;
    reg [1:0] operator_tb;
    
    wire [6:0] SEG_tb;
    wire [7:0] AN_tb;
    
    wire [7:0] result_tb;
    
    top uut_top(
        .clk(clk_tb),
        .rst(rst_tb),
        .operand_a(operand_a_tb),
        .operand_b(operand_b_tb),
        .operator(operator_tb),
        .SEG(SEG_tb),
        .AN(AN_tb)
    );
     
    initial
    begin
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb; // 100MHz clk (10ns)
    end

    initial 
    begin
        rst_tb = 1;
        operand_a_tb = 5'b00000;
        operand_b_tb = 5'b00000;
        operator_tb = 2'b00;

        // Wait for global reset to finish
        #10;
        rst_tb = 0;
        
        // idle
//        operand_a_tb = 5'b00011; // 3
//        operand_b_tb = 5'b00101; // 5
//        operator_tb = 2'b01;     // 3 + 5 = _00 (idle)
//        #2000000;

//        // addition
//        operand_a_tb = 5'b10011; // -3
//        operand_b_tb = 5'b00101; // 5
//        operator_tb = 2'b01;     // -3 + 5 = +02
//        #200000;

//        // subtraction (positive result)
//        operand_a_tb = 5'b01100; // 12
//        operand_b_tb = 5'b00010; // 2
//        operator_tb = 2'b10;     // 12 - 2 = +10
//        #200000;
        
//        // subtraction (negative result)
//        operand_a_tb = 5'b10010; // -2
//        operand_b_tb = 5'b01100; // 12
//        operator_tb = 2'b10;     // -2 - 10 = -12
//        #200000;
        
//        // subtraction (zero result)
//        operand_a_tb = 5'b00100; // 2
//        operand_b_tb = 5'b00100; // 2
//        operator_tb = 2'b10;     // 2 - 2 = _00 (no sign)
//        #200000;

//        // multiplication
//        operand_a_tb = 5'b00101; // 5
//        operand_b_tb = 5'b00110; // 6
//        operator_tb = 2'b11;     // 5 * 6 = +30
//        #200000;
        
//        // multiplication (overflow)
//        operand_a_tb = 5'b01010; // 10
//        operand_b_tb = 5'b01010; // 10
//        operator_tb = 2'b11;     // 10 * 10 = +00 (+00 --> +x00)
//        #200000;
        
        // multiplication (overflow and double negative operands)
        operand_a_tb = 5'b11111; // -15
        operand_b_tb = 5'b11111; // -15
        operator_tb = 2'b11;     // -15 * -15 = +25 (+25 --> +x25)
        #20000;

        $finish;
    end
endmodule