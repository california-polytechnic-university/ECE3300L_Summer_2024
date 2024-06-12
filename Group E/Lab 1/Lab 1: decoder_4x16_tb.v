`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Raymond Palacio
// 
// Create Date: 06/10/2024 11:15:36 PM
// Design Name: 
// Module Name: decoder_4x16_tb
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


module decoder_4x16_tb();

    reg [3:0] sw;        // 4-bit input for the decoder
    wire [15:0] led;     // 16-bit output from the decoder

    // Instantiate the decoder
    decoder_4x16 TESTING (
        .x(sw),         // Connect the input
        .y(led)         // Connect the output
    );

    initial begin
        // Initialize input and apply test vectors
        sw = 4'b0000; 
        #10;
        sw = 4'b0001; 
        #10;
        sw = 4'b0010; 
        #10;
        sw = 4'b0011; 
        #10;
        sw = 4'b0100; 
        #10;
        sw = 4'b0101;
         #10;
        sw = 4'b0110;
         #10;
        sw = 4'b0111; 
        #10;
        sw = 4'b1000;
         #10;
        sw = 4'b1001; 
        #10;
        sw = 4'b1010; 
        #10;
        sw = 4'b1011; 
        #10;
        sw = 4'b1100; 
        #10;
        sw = 4'b1101; 
        #10;
        sw = 4'b1110; 
        #10;
        sw = 4'b1111; 
        #10;


        $finish;
    end
endmodule
