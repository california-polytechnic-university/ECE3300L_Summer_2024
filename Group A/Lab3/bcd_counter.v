`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2024 08:13:15 PM
// Design Name: 
// Module Name: bcd_counter
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


module bcd_counter(
    input clk,
    input reset,
    input enable,
    input selector,
    output [3:0] out
    );
    
    reg [3:0] temp; // temp is 4-bit (0-15)
    
    // reg value based on reset and enable
    always @(posedge clk or posedge reset)
    begin
    if(reset)                       // if reset, start at 0
            temp <= 0;
        else                        // continue otherwise
            begin
                if(enable)          // if enable, start counter
                begin
                    if(selector)    // if selector on count 0-9
                    begin
                        if(temp<9)  
                            temp <= temp + 1;   // while less than 9, count up
                        else
                            temp <= 0;          // otherwise reset to 0
                    end
                    else
                    begin
                        temp <= temp + 1;       // if selector off, count up to 4-bit max
                    end
                end
            end
    end
            
    assign out = temp;  // output temp value per clock edge (0-9 or 0-F based on selector)
            
endmodule
