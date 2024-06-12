`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CPP
// Engineer: Antonuos Kerollos
// 
// Create Date: 06/12/2024 02:16:30 AM
// Design Name: 
// Module Name: switchestb
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


module switchestb();

    reg [15:0] SW;
    wire [15:0] LED;
    
switches tb_testin(
    .SW(SW),
    .LED(LED)
);

initial begin
    SW = 16'b0000000000000000;
     #10;
    SW = 16'b0000000000000001;
     #10;
    SW = 16'b0000000000000010;
     #10;
    SW = 16'b0000000000000100;
     #10;
    SW = 16'b0000000000001000;
     #10;
    SW = 16'b0000000000010000;
     #10;
    SW = 16'b0000000000100000;
     #10;
    SW = 16'b0000000001000000;
     #10;
    SW = 16'b0000000010000000;
     #10;
    SW = 16'b0000000100000000;
     #10;
    SW = 16'b0000001000000000;
     #10;
    SW = 16'b0000010000000000;
     #10;
    SW = 16'b0000100000000000;
     #10;
    SW = 16'b0001000000000000;
     #10;
    SW = 16'b0010000000000000;
     #10;
    SW = 16'b0100000000000000;
     #10;
    SW = 16'b1000000000000000;
     #10;
    $finish;
    end
endmodule

