`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 10:04:22 PM
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

    reg clk, reset_n, enable;
    reg [1:0] sel;
    reg [4:0] csel;
    reg [3:0] load;
    reg load_enable;
    wire [6:0] sseg;
    wire [7:0] AN;
    
    // Instantiate module under test
    top uut(
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .sel(sel),
        .csel(csel),
        .load(load),
        .load_enable(load_enable),
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
        enable = 1'b1;
        sel = 2'b00; // counting UP in BCD
        csel = 5'b00011;
        #200000;
  
        load = 4'b0110; // loading the value 6
        load_enable = 1'b1;
        #100
        load_enable = 1'b0;
        #100000;
        
        sel = 2'b10; // counting DOWN in BCD
        #200000;
        
        reset_n = 1'b1; // reseting to 0
        #2
        reset_n = 1'b0;
        sel = 2'b01; // counting UP in HEX
        #200000;
        
        load = 4'b1100; // loading the value C
        load_enable = 1'b1;
        #100
        load_enable = 1'b0;
        #100000;
        
        sel = 2'b11; // counting DOWN in HEX
        #200000;
        
     end
     
endmodule
