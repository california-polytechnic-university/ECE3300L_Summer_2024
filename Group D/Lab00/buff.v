`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Daniele Ricciardelli
// 
// Create Date: 06/05/2024 10:33:54 AM
// Module Name: buff
// Project Name: Lab 0
// Target Devices: 
// Tool Versions: 
// Description: Lab 0 requires all participants to install properly Vivado 2019.1 and implement a straightforward connection between the 16 SW and 16 LEDs on the board just as a starting point. 
// The grade will be distributed between the following parts: 
// 1) 50% Demonstration 
// 2) 25% Random question 
// 3) 25% Testbench (Testing the code before it will be deployed on the board) 
//////////////////////////////////////////////////////////////////////////////////


module buff
(
    input  [15:0] SW,
    output [15:0] LED
);
    assign LED = SW;
endmodule
