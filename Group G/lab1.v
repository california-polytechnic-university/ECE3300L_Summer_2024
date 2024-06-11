`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2024 02:00:10 PM
// Design Name: 
// Module Name: lab1
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


module lab1(input [3:0] SW, output [15:0] LED);

    assign LED[0] =  !SW[3] & !SW[2] & !SW[1] & !SW[0];
    assign LED[1] =  !SW[3] & !SW[2] & !SW[1] &  SW[0];
    assign LED[2] =  !SW[3] & !SW[2] &  SW[1] & !SW[0];
    assign LED[3] =  !SW[3] & !SW[2] &  SW[1] &  SW[0];
    assign LED[4] =  !SW[3] &  SW[2] & !SW[1] & !SW[0];
    assign LED[5] =  !SW[3] &  SW[2] & !SW[1] &  SW[0];
    assign LED[6] =  !SW[3] &  SW[2] &  SW[1] & !SW[0];
    assign LED[7] =  !SW[3] &  SW[2] &  SW[1] &  SW[0];
    assign LED[8] =   SW[3] & !SW[2] & !SW[1] & !SW[0];
    assign LED[9] =   SW[3] & !SW[2] & !SW[1] &  SW[0];
    assign LED[10] =  SW[3] & !SW[2] &  SW[1] & !SW[0];
    assign LED[11] =  SW[3] & !SW[2] &  SW[1] &  SW[0];
    assign LED[12] =  SW[3] &  SW[2] & !SW[1] & !SW[0];    
    assign LED[13] =  SW[3] &  SW[2] & !SW[1] &  SW[0];    
    assign LED[14] =  SW[3] &  SW[2] &  SW[1] & !SW[0];    
    assign LED[15] =  SW[3] &  SW[2] &  SW[1] &  SW[0];
    
endmodule
