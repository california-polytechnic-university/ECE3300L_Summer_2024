`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2024 09:56:44 AM
// Design Name: 
// Module Name: bcd_calculator
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


module bcd_calculator(
    input [4:0] x, y,
    input [1:0] operation,
    input reset_calculator,
    output reg [7:0] result,
    output reg sign
    );
    
    reg signed [4:0] signed_x;
    reg signed [4:0] signed_y;
    reg signed [7:0] signed_result;
    
    always @(*)
    begin
        if(reset_calculator) // reset not functional bc the switches override reset right after
        begin
            result = 8'b00000000; // clear result
            sign = 1'b0; // clear sign
        end
        else
        begin
            // if bit 4 is negative, make it a negative bcd, otherwise leave positve
            signed_x = x[4] ? -{1'b0, x[3:0]} : {1'b0, x[3:0]};
            signed_y = y[4] ? -{1'b0, y[3:0]} : {1'b0, y[3:0]};
            
            case(operation)
                2'b00: signed_result = signed_x + signed_y; // addition
                2'b01: signed_result = signed_x - signed_y; // subtraction
                2'b10: signed_result = signed_x * signed_y; // multiplication
                default: signed_result = 8'b00000000;
            endcase
            if(signed_result < 0) // if negative
            begin
                result = -signed_result; // obtain the magnitude of the result 
                sign = 1'b1; // assign sign as 1 to indicate negative
            end
            else
            begin
                result = signed_result; // obtain the magnitude of the result
                sign = 1'b0; // assign sign as 0 to indicate positive
            end
        end    
    end
    
endmodule
