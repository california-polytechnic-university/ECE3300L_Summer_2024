`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 03:05:06 AM
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
     //localparam FINAL_VALUE = 49_999;
    //localparam BITS = $clog2(FINAL_VALUE);

    reg clk, reset_n;
    reg [1:0] sel;
    reg [4:0] csel;
    wire [6:0] sseg;
    wire [7:0] AN;
    
    // Instantiate module under test
    top uut(
        .clk(clk),
        .reset_n(reset_n),
        .sel(sel),
        .csel(csel),
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
    
    initial #(49999 * T * 3) $stop;
    initial
    begin
        // issue a quick reset for 2 ns
        reset_n = 1'b1;
        #2
        reset_n = 1'b0;
        sel = 2'b00;
        csel = 5'b01011;
        #500000;
        
        sel = 2'b10;
        #250000;
        
        reset_n = 1'b1;
        #2
        reset_n = 1'b0;
        sel = 2'b01;
        #500000;
         
     end
