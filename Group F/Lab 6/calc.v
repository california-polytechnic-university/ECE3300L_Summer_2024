`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2024 01:58:24 PM
// Design Name: 
// Module Name: calc
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


module calc(
    input [4:0] a,             
    input [4:0] b,
    input [1:0] op,            
    input reset,               
    output reg [7:0] result,   
    output reg negative        
    );

    reg signed [4:0] signed_a;
    reg signed [4:0] signed_b;
    reg signed [7:0] signed_res;
    reg [7:0] abs_res;
    
    always @(*)
    begin
        // Default reset logic
        if (reset) begin
            result = 8'b00000000; // clear result
            negative = 1'b0; // clear sign
        end else begin
            // Determine signed values based on input sign bits
            signed_a = (a[4]) ? -{1'b0, a[3:0]} : {1'b0, a[3:0]};
            signed_b = (b[4]) ? -{1'b0, b[3:0]} : {1'b0, b[3:0]};
            
            // Perform the operation
            case (op)
                2'b00: signed_res = signed_a + signed_b; // addition
                2'b01: signed_res = signed_a - signed_b; // subtraction
                2'b10: signed_res = signed_a * signed_b; // multiplication
                default: signed_res = 8'b00000000;
            endcase
            
            // Determine the absolute result and the sign
            if (signed_res < 0) begin
                abs_res = -signed_res; // get the magnitude
                negative = 1'b1; // result is negative
            end else begin
                abs_res = signed_res; // get the magnitude
                negative = 1'b0; // result is positive
            end
            
            // Assign the result
            result = abs_res;
        end
    end
    
endmodule

