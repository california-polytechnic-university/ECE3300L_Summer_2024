`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2024 12:09:20 PM
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


module decoder_4x16_tb(

    );
    
    reg [3:0] I;    // store inputs
    wire [15:0] O;  // store output wire
    integer i;      // counter i
    
    decoder_4x16 test_bench (
        .I(I),      
        .O(O)
    );
    
    initial #200 $finish; // length of 200ns
    
//    initial                   // this one tests specific values
//    begin
//        #5 I = 4'b0000;       // testing if input were 0
//        #5 I = 4'b0101;       // if input were 5
//        #5 I = 4'b1010;       // if input were 10
//        #5 I = 4'b1111;       // if input were 15
//        #5;
//    end

    always 
    begin
        for (i = 0; i < 16; i = i + 1) begin // for all 16 outputs
            I = i;  // input will increment from 0-15
            #10;    // delay every 10ns
        end
        $finish;    // stop
    end
endmodule
