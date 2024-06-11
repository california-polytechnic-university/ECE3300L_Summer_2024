`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2024 01:47:37 PM
// Design Name: 
// Module Name: lab0_testbench
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


module lab0_testbench();

    reg [15:0] SW;
    wire [15:0] LED;
    lab0 DUT(SW,LED);
    
initial begin

    SW[0] = 1'b1;
#1  SW[1] = 1'b1;
#1  SW[2] = 1'b1;
#1  SW[3] = 1'b1;
#1  SW[4] = 1'b1;
#1  SW[5] = 1'b1;
#1  SW[6] = 1'b1;
#1  SW[7] = 1'b1;
#1  SW[8] = 1'b1;
#1  SW[9] = 1'b1;
#1  SW[10] = 1'b1;
#1  SW[11] = 1'b1;
#1  SW[12] = 1'b1;
#1  SW[13] = 1'b1;
#1  SW[14] = 1'b1;
#1  SW[15] = 1'b1;
#1  SW = 0;
#1 $finish;

end

endmodule
