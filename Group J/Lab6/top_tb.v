`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/30/2024 04:14:48 PM
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
    reg clk, reset_n;
    reg [4:0] a;
    reg [4:0] b;
    reg [1:0] op;
    wire [6:0] sseg;
    wire [7:0] AN;
    
    // Instantiate module under test
    top uut(
        .clk(clk),
        .reset_n(reset_n),
        .a(a),
        .b(b),
        .op(op),
        .sseg(sseg),
        .AN(AN)   
    );
    
    
    // Generate stimuli
    
    // Generating a clk signal
    localparam T = 10;
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
   
    initial
    begin
    
        // issue a quick reset for 2 ns
        reset_n = 1'b1;
        #2
        reset_n = 1'b0;
        #10 
        
        op = 2'b01; // add
        a = 5'b00110;
        b = 5'b00110; // 6 + 6 = 12
        #50 
        
        op = 2'b10; // subtract
        a = 5'b00110;
        b = 5'b00110; // 6 - 6 = 0
        #50
        
        op = 2'b11; // multiply
        a = 5'b00110;
        b = 5'b00110; // 6 * 6 = 36  
        #50
         
        op = 2'b01; // add
        a = 5'b00110;
        b = 5'b10110; // 6 + (-6) = 0
        #50 
        
        op = 2'b10; // subtract
        a = 10'b00110;
        b = 5'b10110; // 6 - (-6) = 12
        #50 
        
        op = 2'b11; // multiply
        a = 10'b00110;
        b = 5'b10110; // 6 * (-6) = -36
        #50 
        
        op = 2'b01; // add
        a = 5'b10110;
        b = 5'b10110; // (-6) + (-6) = -12
        #50 
        
        op = 2'b10; // subtract
        a = 5'b10110;
        b = 5'b10110; // (-6) - (-6) = 0
        #50 
        
        op = 2'b11; // multiply
        a = 5'b10110;
        b = 5'b10110; // (-6) * (-6) = 36
        #50
        
        //corner cases
        op = 2'b01; // add
        a = 5'b00110;
        b = 5'b01100; // (6) + (12) = 8, since 12 --> 10010 = 2
        #50
        
        op = 2'b11; // multiply
        a = 5'b00110;
        b = 5'b01100; // (6) * (12) = 12, since 12 --> 10010 = 2
        #50
        
        op = 2'b01; // add
        a = 5'b00000;
        b = 5'b10000; // (+0) + (-0) = 0
        #50
        
        op = 2'b01; // multiply
        a = 5'b10000;
        b = 5'b10000; // (-0) * (-0) = 0
        #50
       
        $stop;
     end
     
endmodule
