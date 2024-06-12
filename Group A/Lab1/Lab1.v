`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2024 11:38:42 AM
// Design Name: 
// Module Name: decoder_4x16
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


module decoder_4x16(
    input [3:0] I,
    output reg [15:0] O
    );
    
    always @(I) // check for changes at I
    begin
        O = 16'd0;      // default is zero
        O[I] = 1'b1;    // for each input combination of I[3:0], toggle the corresponding output bit
    end
    
endmodule
