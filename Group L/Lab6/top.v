`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2024 11:58:19 PM
// Design Name: 
// Module Name: top
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

// ECE 3300 Lab6: Alien Calculator
// Ethan McKendell and Logan Zimmerman

module top(
    input wire clk,
    input wire rst,
    
    input wire [4:0] operand_a,
    input wire [4:0] operand_b,
    input wire [1:0] operator,
      
    output wire [6:0] SEG,
    output wire [7:0] AN
    );
    
    wire [7:0] result;
    wire sign;
    
    wire [3:0] bcd_value;
    
    alien_calculator alien_calculator(
        .rst(rst),
        .operand_a(operand_a),
        .operand_b(operand_b),
        .operator(operator),
        .result(result),
        .sign(sign)
    );
    
    refresh_up_counter refresh_up_counter(
        .clk(clk),
        .rst(rst),
        .operand_a(operand_a),
        .operand_b(operand_b),
        .operator(operator),
        .result(result),
        .sign(sign),
        .bcd_value(bcd_value),
        .AN(AN)
    );
    
    bcd_to_7seg bcd_to_7seg(
        .bcd_value(bcd_value),
        .SEG(SEG)
    );  
endmodule
