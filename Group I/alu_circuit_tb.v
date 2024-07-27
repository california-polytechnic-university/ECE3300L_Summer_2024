`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2024 06:48:41 PM
// Design Name: 
// Module Name: alu_circuit_tb
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


module alu_circuit_tb();

    reg clk;
    reg reset;
    reg [1:0] op;
    reg [3:0] A;
    reg signA;
    reg signB;
    reg [3:0] B;
    wire [6:0] sseg;
    wire [7:0] an;
    wire dp;
   
    alu_circuit uut(
    
        .clk(clk),
        .reset(reset),
        .op(op),
        .A(A),
        .signA(signA),
        .signB(signB),
        .B(B),
        .sseg(sseg),
        .an(an),
        .dp(dp)
    );
    
    always
    begin
        clk = 0;
     #5 clk = ~clk;
    end
    
    initial
    begin
        reset = 1'b1;
    #10
        reset = 1'b0;
        op = 0;
        A = 0;
        B = 0;
        signA = 0;
        signB = 0;
    #10
    
        A = 3;
        B = 5;
        signA = 1;
    #10
        A = 3;
        B = 10;
        signB = 1;
    
    #10
    
        op = 1;
        A = 10;
        signA = 0;
        signB = 0;
        B = 12;
     #10
     
        A = 7;
        B = 10;
        signA = 1;
        
     #10
     
        A = 14;
        B = 6;
        signB = 1;
        
     #10
        A = 0;
        B = 0;
        
     #10
     
        op = 2;
        
        A = 4;
        B = 4;
        signB = 0;
        signB = 0;
     #10
        A = 5;
        B = 15;
        signB = 1;
     
     #10
        signB = 0;
        signA = 1;
        
     #10 
        
        signB = 1;
        A = 6;
        B = 6;
   
     #20
        op = 3;
        signB = 0;
        signA = 0;
        
        A = 9;
        B = 11;
        
     #10
     
        signA = 1;
        A = 10;
        B = 10;
        
     #10
        signB = 1;
        B = 15;
        A = 13;
        
     #10
        A = 0;
        B = 0;
        
      #20
      $finish; 
    end
endmodule
