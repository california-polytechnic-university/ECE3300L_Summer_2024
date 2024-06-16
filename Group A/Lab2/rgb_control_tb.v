`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2024 08:45:55 PM
// Design Name: 
// Module Name: rgb_control_tb
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


module rgb_control_tb(
    
    );
    
    reg [13:0] sw;
    wire r, g, b;
    
    rgb_control test_bench (
    .SW(sw),
    .LED16_R(r), 
    .LED16_G(g), 
    .LED16_B(b)
    );
    
    // testing red led control using select switches 0-1 and LED16_R switches 2-5
    
    initial #50 $finish;
    
    initial
    begin
        #5 sw = 6'b000100; // testing if LED turns red at first switch if select is 0 (should give us 1)
        #5 sw = 6'b001000; // testing if LED turns red at seceond switch if select is 0 (should give us 0)
        #5 sw = 6'b001001; // testing if LED turns red at second switch if select is 1 (should give us 1)
        #5 sw = 6'b100010; // testing if LED turns red at fourth switch if select is 2 (should give us 0)
        #5 sw = 6'b100011; // testin if LED turns red at fourth switch if select is 3 (should give us 1)
        #5;
        $finish;
    end
    
endmodule
