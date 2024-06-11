`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2024 04:04:12 AM
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
    reg [3:0] w;
    reg en;
    wire [0:15] y;
    
    decoder_4x16 uut(
        .w(w[3:0]),
        .en(en),
        .y(y[0:15])
    );
    
    initial
    begin
        #40 $finish;
    end
    
    initial
    begin
    en = 1'b1;
    w = 4'b0000;
    #5 w = 4'b0001;
    #5 w = 4'b0010;
    #5 w = 4'b0011;
    #5 w = 4'b0100;
    #5 w = 4'b1000;
    #5 w = 4'b1111;
    
    end
    
    
    
endmodule

