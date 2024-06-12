`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2024 11:11:26 AM
// Design Name: 
// Module Name: Lab_0_tb
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


module Lab_0_tb(

    );
    
    reg [15:0] in;      // store input
    wire [15:0] out;    // store output wire
    
    Lab_0 test_bench (
        .I(in),
        .O(out)
    );
    
    initial
    begin
            in [15:0] = 16'b1010101010101010;   // testing input of every odd bit (bit 1, 3, 5, 7, 9, 11, 13, 15)
    end                                         // the output bit should match the input bit
    
endmodule
