`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/27/2024 03:38:55 PM
// Design Name: 
// Module Name: sseg
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


module ssg(
    input [3:0] digit,
    output reg [6:0] a_to_g
    );
    
   always@(digit)
        begin
            case(digit)
                0: a_to_g = 7'b1000000;
                1: a_to_g = 7'b1111100;
                2: a_to_g = 7'b0100100;
                3: a_to_g = 7'b0110000;
                4: a_to_g = 7'b0011001;
                5: a_to_g = 7'b0010010;
                6: a_to_g = 7'b0000010;
                7: a_to_g = 7'b1111000;
                8: a_to_g = 7'b0000000;
                9: a_to_g = 7'b0010000;
                'HA: a_to_g = 7'b0001000;
                'hB: a_to_g = 7'b0000011;
                'hC: a_to_g = 7'b1000110;
                'hD: a_to_g = 7'b0100001;
                'hE: a_to_g = 7'b0000110;
                'hF: a_to_g = 7'b0001110;
                default: a_to_g = 7'b1111111;    
            endcase
      end
endmodule