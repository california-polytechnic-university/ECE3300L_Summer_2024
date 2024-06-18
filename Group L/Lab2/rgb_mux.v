`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2024 05:20:23 PM
// Design Name: 
// Module Name: rgb_mux
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

// ECE 3300 Lab2: RGB Mux
// Ethan McKendell and Logan Zimmerman

module rgb_mux (
    // red mux = SW[14:11]
    // blue mux = SW[10:7]
    // green mux = SW[6:3]
    input [14:3] SW,
    
    // SW[2] unused
    
    // red mux, blue mux, green mux use same SEL
    input [1:0] SEL,
    
    // RGB LED, registers to store muxs outputs
    output reg LED16_R,
    output reg LED16_G,
    output reg LED16_B 
);

// execute following if any signal changes
always @(*) 
begin
    case (SEL)
        // ex: SEL = 0 then red, green, blue = SW[11], SW[7], SW[3] respectively
        2'b00: begin
            LED16_R = SW[11];
            LED16_G = SW[7];
            LED16_B = SW[3];
        end
        2'b01: begin
            LED16_R = SW[12];
            LED16_G = SW[8];
            LED16_B = SW[4];
        end
        2'b10: begin
            LED16_R = SW[13];
            LED16_G = SW[9];
            LED16_B = SW[5];
        end
        2'b11: begin
            LED16_R = SW[14];
            LED16_G = SW[10];
            LED16_B = SW[6];
        end
        // Impossible case: turn RGB LED OFF
        default: begin
            LED16_R = 1'b0;
            LED16_G = 1'b0;
            LED16_B = 1'b0;
        end
    endcase
end

endmodule
