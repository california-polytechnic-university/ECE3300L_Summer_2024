`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2024 03:26:43 AM
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

    reg clk, reset_n, enable, sel;
    reg [4:0] csel;
    wire [6:0] sseg;
    wire [7:0] AN;
    wire DP;
    
    // Instantiate module under test
    top uut (
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .sel(sel),
        .csel(csel),
        .sseg(sseg),
        .AN(AN),
        .DP(DP)
        
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
        enable = 1'b0;
        reset_n = 1'b0;
        #2
        reset_n = 1'b1;
        enable = 1'b1;
        sel = 1'b1;
        csel = 5'b01011;
        #500000
        sel = 1'b0;
        csel = 5'b01100;
     end
     
endmodule
