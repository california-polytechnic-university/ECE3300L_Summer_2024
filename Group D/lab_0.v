`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CPP
// Engineer:  Antonuos Kerollos
// 
// Create Date: 06/12/2024 02:14:09 AM
// Design Name:
// Module Name: switches
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


module switches(
   input [15:0] SW,
    output [15:0] LED
    );
    
    assign LED = SW;
endmodule

