`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2024 09:46:30 PM
// Design Name: 
// Module Name: bcd_to_7seg
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

module bcd_to_7seg(
    input wire [3:0] bcd_value, 
    output reg [6:0] SEG
    );  
    
    always @(bcd_value) 
    begin
        case(bcd_value) // 4-bits    
            // Common Anode (Logic 0 is ON)
                
                     // 7'xgfedcba; dp unused
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
                
            // SIGN values (HEX values unused)
            4'd10: SEG = 7'b0101110; // alien positive sign
            4'd11: SEG = 7'b0100101; // alien negative sign
            4'd12: SEG = 7'b1111111; // special case: ± 0 ± 0 = 0
            default: SEG = 7'b1111111; // OFF
        endcase
    end
endmodule
