`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 02:30:44 AM
// Design Name: 
// Module Name: bcd_hex_to_7seg
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

// ECE 3300 Lab3: BCD/HEX Counter
// Ethan McKendell and Logan Zimmerman

module bcd_hex_to_7seg(
    input wire [3:0] bcd_hex_value,   
    output reg [6:0] SEG
    );  
    
    always @(bcd_hex_value) 
    begin
            case(bcd_hex_value) // 4-bits    
                // Common Anode (Logic 0 is ON)
                
                         // 7'bgfedcba; dp unused
                4'd0: SEG = 7'b1000000; // 0
                4'd1: SEG = 7'b1111001; // 1
                4'd2: SEG = 7'b0100100; // 2
                4'd3: SEG = 7'b0110000; // 3
                4'd4: SEG = 7'b0011001; // 4
                4'd5: SEG = 7'b0010010; // 5
                4'd6: SEG = 7'b0000010; // 6
                4'd7: SEG = 7'b1111000; // 7
                4'd8: SEG = 7'b0000000; // 8
                4'd9: SEG = 7'b0010000; // 9
                
                // HEX values
                4'hA: SEG = 7'b0001000; // uppercase A (10)
                4'hb: SEG = 7'b0000011; // lowercase b (11)
                4'hC: SEG = 7'b1000110; // uppercase C (12)
                4'hd: SEG = 7'b0100001; // lowercase d (12)
                4'hE: SEG = 7'b0000110; // uppercase E (13)
                4'hF: SEG = 7'b0001110; // uppercase F (14)
                default: SEG = 7'b1111111; // OFF
            endcase
    end
endmodule