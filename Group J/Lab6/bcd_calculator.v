`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/30/2024 03:37:26 PM
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
    input reset_n,
    input [4:0] a, b,
    input [1:0] op,
    output reg [7:0] result,
    output reg sign
    );
    
    reg signed [4:0] signed_a;
    reg signed [4:0] signed_b;
    reg signed [7:0] signed_result;
    
    wire [4:0] bcd_a;
    wire [4:0] bcd_b;
    
    assign bcd_a = ( a[3:0] > 4'd9) ? a[3:0] + 4'd6 : a;
    assign bcd_b = ( b[3:0] > 4'd9) ? b[3:0] + 4'd6 : b;
    
    always @(*)
    begin
        if(reset_n)
        begin
            result = 8'b00000000; 
            sign = 1'b0;
        end
        else
        begin
            
            signed_a = a[4] ? -{1'b0, bcd_a[3:0]} : {1'b0, bcd_a[3:0]};
            signed_b = b[4] ? -{1'b0, bcd_b[3:0]} : {1'b0, bcd_b[3:0]};
            
            case(op)
                2'b01: signed_result = signed_a + signed_b; 
                2'b10: signed_result = signed_a - signed_b; 
                2'b11: signed_result = signed_a * signed_b; 
                default: signed_result = 8'b00000000;
            endcase
            if(signed_result < 0)
            begin
                result = -signed_result;
                sign = 1'b1; 
            end
            else
            begin
                result = signed_result; 
                sign = 1'b0; 
            end
        end    
    end
    
endmodule
