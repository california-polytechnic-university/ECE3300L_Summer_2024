`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2024 12:20:43 AM
// Design Name: 
// Module Name: SW_Implementation_TB
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


module SW_Implementation_TB(
    
    );
    //setup
    reg [0:15] SW;
    wire [0:15] LED;
    //module under use
    SW_Implementation dut (
        .SW(SW),
        .LED(LED)
    );
    
   initial begin
   //initialize switches
   SW = 16'b0;
   //testing switches
   SW = 16'b1010_1010_1010_1010;
   end
   
endmodule
