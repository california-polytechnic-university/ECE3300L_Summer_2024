`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/03/2024 10:59:51 PM
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


module buff_tb(
    
    );
    
    reg [15:0] SW;
    wire [15:0] LED;
    
    buff uut(
    .SW(SW),
    .LED(LED)
    );
    
    initial
    begin
        #40 $finish;
    end
    
    initial
    begin
        SW = 16'h0000;
        
        #10
        SW = 16'hFFFF;
        
        #10
        SW = 16'h0000;
        
        #10
        SW = 16'hFFFF;
    end
    
    initial
    begin
        $monitor("At time %t, Input SW = %h, Output LED = %h",
        $time, SW, LED);
    end
     
endmodule
