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
    input [3:0] value,
    output reg [6:0] display_7seg
    );
    
    always @(value)
        case(value)
            // Common Anode (Logic 0 is ON)
            
                              // 7'bgfedcba; dp unused
            4'd0: display_7seg = 7'b1000000; // 0
            4'd1: display_7seg = 7'b1111001; // 1
            4'd2: display_7seg = 7'b0100100; // 2
            4'd3: display_7seg = 7'b0110000; // 3
            4'd4: display_7seg = 7'b0011001; // 4
            4'd5: display_7seg = 7'b0010010; // 5
            4'd6: display_7seg = 7'b0000010; // 6
            4'd7: display_7seg = 7'b1111000; // 7
            4'd8: display_7seg = 7'b0000000; // 8
            4'd9: display_7seg = 7'b0010000; // 9
            
            // HEX values
            4'hA: display_7seg = 7'b0001000; // uppercase A (10)
            4'hb: display_7seg = 7'b0000011; // lowercase b (11)
            4'hC: display_7seg = 7'b1000110; // uppercase C (12)
            4'hd: display_7seg = 7'b0100001; // lowercase d (12)
            4'hE: display_7seg = 7'b0000110; // uppercase E (13)
            4'hF: display_7seg = 7'b0001110; // uppercase F (14)
            default: display_7seg = 7'b1111111; // OFF
        endcase
endmodule
