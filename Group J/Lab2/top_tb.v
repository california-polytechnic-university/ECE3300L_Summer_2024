`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2024 09:55:09 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb(
   
    );
    
    reg [13:0] SW;
    wire [2:0] LED;
    
    top uut (
        .SW(SW[13:0]),
        .LED(LED[2:0])
    );
    
    initial
    begin
        #40 $finish;
    end
    
    initial
    begin
        SW[13:0] = 14'b_0000_0000_0001_00;
     
        #10
        SW[13:0] = 14'b_1101_1101_0010_01;
        #10
        SW[13:0] = 14'b_1011_0100_1011_10;
        #10
        SW[13:0] = 14'b_1000_0111_0111_11;
     
    end
        
endmodule
