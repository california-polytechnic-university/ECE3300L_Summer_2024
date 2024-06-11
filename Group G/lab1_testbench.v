`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2024 02:00:58 PM
// Design Name: 
// Module Name: lab1_testbench
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


module lab1_testbench();

    reg [3:0] SW;
    wire [15:0] LED;
    lab1 DUT(SW,LED);
    
initial begin
    
    SW = 4'b0000;
#1  SW = 4'b0001;
#1  SW = 4'b0010;
#1  SW = 4'b0011;
#1  SW = 4'b0100;
#1  SW = 4'b0101;
#1  SW = 4'b0111;
#1  SW = 4'b1000;
#1  SW = 4'b1001;
#1  SW = 4'b1010;
#1  SW = 4'b1011;
#1  SW = 4'b1100;
#1  SW = 4'b1101;
#1  SW = 4'b1110;
#1  SW = 4'b1111;
#1 $finish;

end    
    

endmodule
