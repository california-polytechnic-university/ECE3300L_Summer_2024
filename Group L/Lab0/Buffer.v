`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
// 
// Create Date: 06/05/2024 11:18:50 AM
// Design Name: 
// Module Name: Buffer
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


// ECE3300 Lab0
// Ethan McKendell and Logan Zimmerman

module Buffer(
    input [15:0] SW,
    output [15:0] LED
    );

assign LED = SW; // input = output

endmodule
