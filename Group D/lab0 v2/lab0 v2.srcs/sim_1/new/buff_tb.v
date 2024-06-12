`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2024 12:01:19 PM
// Design Name: 
// Module Name: buff_tb
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


module buff_tb;

    // signals
    reg  [15:0] SW_tb;
    wire [15:0] LED_tb;

    //DUT (Device Under Test)
    buff uut 
    (
        .SW(SW_tb),
        .LED(LED_tb)
    );

    initial 
        begin
        
        // Input initialization
        SW_tb = 16'h0000;

        // Testing
        #10 
        SW_tb = 16'b0001;
        
        #10 
        SW_tb = 16'hAAAA;
        
        #10 
        SW_tb = 16'o1234;

        #10 
        $stop;
        
        end

endmodule
