`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2024 09:55:15 PM
// Design Name: 
// Module Name: alien_calculator
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

module alien_calculator(
    input wire rst,
    input wire [4:0] operand_a, operand_b,
    input wire [1:0] operator,
    output reg [7:0] result,
    output reg sign
    );
    
    wire [4:0] a = operand_a;
    wire [4:0] b = operand_b;
    
    reg signed [4:0] signed_a;
    reg signed [4:0] signed_b;
    reg signed [8:0] signed_result;
    
    always @(*)
    if(rst)
        begin
            result = 8'b00000000;
            sign = 1'b0;
        end
    else
        begin
            signed_a = a[4] ? -{1'b0, a[3:0]} : {1'b0, a[3:0]};
            signed_b = b[4] ? -{1'b0, b[3:0]} : {1'b0, b[3:0]};
            
            case(operator)
                2'b00: signed_result = 9'b000000000; // idle
                2'b01: signed_result = signed_a + signed_b; // addition
                2'b10: signed_result = signed_a - signed_b; // subtraction
                2'b11: signed_result = signed_a * signed_b; // multiplication
            endcase
            
            if(signed_result < 0)
                begin
                    // negative result
                    result = -signed_result;
                    sign = 1'b1;
                end
            else
                begin
                    // positive result
                    result = signed_result;
                    sign = 1'b0;
                end   
        end
endmodule