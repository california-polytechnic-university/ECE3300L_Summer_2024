`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2024 12:41:35 PM
// Design Name: 
// Module Name: decoderSRC
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


module decoderSRC(
    input [15:12] SW,
    output [15:0] LED
    );
    
    assign LED[15] = ~SW[15] & ~SW[14] & ~SW[13] & ~SW[12];
    assign LED[14] = ~SW[15] & ~SW[14] & ~SW[13] & SW[12];
    assign LED[13] = ~SW[15] & ~SW[14] & SW[13] & ~SW[12];
    assign LED[12] = ~SW[15] & ~SW[14] & SW[13] & SW[12];
    assign LED[11] = ~SW[15] & SW[14] & ~SW[13] & ~SW[12];
    assign LED[10] = ~SW[15] & SW[14] & ~SW[13] & SW[12];
    assign LED[9] = ~SW[15] & SW[14] & SW[13] & ~SW[12];
    assign LED[8] = ~SW[15] & SW[14] & SW[13] & SW[12];
    assign LED[7] = SW[15] & ~SW[14] & ~SW[13] & ~SW[12];
    assign LED[6] = SW[15] & ~SW[14] & ~SW[13] & SW[12];
    assign LED[5] = SW[15] & ~SW[14] & SW[13] & ~SW[12];
    assign LED[4] = SW[15] & ~SW[14] & SW[13] & SW[12];
    assign LED[3] = SW[15] & SW[14] & ~SW[13] & ~SW[12];
    assign LED[2] = SW[15] & SW[14] & ~SW[13] & SW[12];
    assign LED[1] = SW[15] & SW[14] & SW[13] & ~SW[12];
    assign LED[0] = SW[15] & SW[14] & SW[13] & SW[12];

endmodule
