`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/21/2024 09:55:59 AM
// Design Name: 
// Module Name: top_tb
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


module top_tb(

    );
    
    reg clk;
    reg [9:0] switches;
    reg [1:0] operation;
    wire [4:0] x = switches[4:0]; // first 5 switches for BCD x value
    wire [4:0] y = switches[9:5]; // next 5 switches for BCD y value
    wire [7:0] result; // 8 bit signed result (+81 or -81 max from multiplying bc of BCD)
    wire sign; // sign bit
    
    bcd_calculator calculator( // instantiate bcd calculator
        .x(x),
        .y(y),
        .operation(operation),
        .reset_calculator(reset_calculator),
        .result(result),
        .sign(sign)
    );
    
    initial
    begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period clock (100MHz)
    end
    
    initial
    begin
        #10 
        
        #10 operation = 2'b00; // add
        #10 switches = 10'b0010100101; // 5 + 5 = 10
        
        #100 
        
        #10 operation = 2'b01; // subtract
        #10 switches = 10'b0010100101; // 5 - 5 = 0
        
        #100 
        
        #10 operation = 2'b10; // multiply
        #10 switches = 10'b0010100101; // 5 * 5 = 25
        
        #100 
        
        #10 operation = 2'b00; // add
        #10 switches = 10'b0010110101; // (-5) + 5 = 0
        
        #100 
        
        #10 operation = 2'b01; // subtract
        #10 switches = 10'b0010110101; // (-5) - 5 = -10
        
        #100 
        
        #10 operation = 2'b10; // multiply
        #10 switches = 10'b0010110101; // (-5) * 5 = -25
        
        #100 
        
        #10 operation = 2'b00; // add
        #10 switches = 10'b1010110101; // (-5) + (-5) = -10
        
        #100 
        
        #10 operation = 2'b01; // subtract
        #10 switches = 10'b1010110101; // (-5) - (-5) = 0
        
        #100 
        
        #10 operation = 2'b10; // multiply
        #10 switches = 10'b1010110101; // (-5) * (-5) = 25
        
        #100
        
        $finish;
    end
    
endmodule
