`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 01:23:10 AM
// Design Name: 
// Module Name: up_counter
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

// ECE 3300 Lab3: BCD/HEX Counter
// Ethan McKendell and Logan Zimmerman

module bcd_hex_up_counter(
    input clk,
    input rst,
    input en,
    input sel,
    output [3:0] value
    );
    
    reg [3:0] tmp; // register to determine BCD/HEX value
    
    // execute following on clk or rst rising edge
    always @(posedge clk or posedge rst)
    begin
    
    // if rst = 1, set tmp = 0
    if(rst)
            tmp <= 0; // Non-blocking (all non-blocking lines execute at same time)
                      // The purpose to check other conditions first
                      // such as en and sel to set correct value
    
    else
        begin
        if(en) // if en = 1, start counting up
        
            begin
                if(sel) // if sel = 1, count 0-9 (BCD)
                        // else (sel = 0), count 0-f (HEX)
                        
                    begin
                        // if tmp = 10, then set tmp = 0
                        if(tmp < 9)  
                            tmp <= tmp + 1;
                        else
                            tmp <= 0;
                    end
                    
                else
                    begin
                        tmp <= tmp + 1; // count 0-15, 10-15 is a-f for HEX          
                    end
            end
        end
    end
            
    assign value = tmp; // set value = tmp after checking all conditions
            
endmodule