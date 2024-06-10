`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2024 04:47:22 PM
// Design Name: 
// Module Name: Lab_0
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


module Lab_0(
    input [15:0]I, // create I0-I15 (16 total input for switch)
    output [15:0]O // create O0-O15 (16 total output for LED)
    );
    
    assign O = I; // each output LED will be activated by its corresponding input switch

endmodule
