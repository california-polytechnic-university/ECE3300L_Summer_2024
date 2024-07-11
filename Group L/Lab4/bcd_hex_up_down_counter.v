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

// ECE 3300 Lab4: BCD/HEX Up/Down Counter
// Ethan McKendell and Logan Zimmerman

module bcd_hex_up_down_counter(
    input wire clk_divider,
    input wire rst,
    input wire en,
    input wire mode,
    input wire direction,
    
    output reg [3:0] count,
    output reg carry_out
    );
    
    // execute following block on clk_divider or rst rising edge
    always @(posedge clk_divider or posedge rst)
    begin
        if (rst) 
            begin
                count <= 0;
            end 
        else if(en)
            begin
                if(direction && mode) // UP && BCD
                begin
                    carry_out <= (count == 8);
                    count <= (count == 9) ? 0 : count + 1;
                end
                
                else if(direction && !mode) // UP && HEX
                begin
                     carry_out <= (count == 14);
                     count <= (count == 15) ? 0 : count + 1;
                end
                
                else if(!direction && mode) // DOWN && BCD
                
                begin
                     carry_out <= (count == 1);
                     count <= (count == 0) ? 9 : count - 1;
                end
                
                else // DOWN && HEX
                begin
                     carry_out <= (count == 1);
                     count <= (count == 0) ? 15 : count - 1;
                end
            end
    end

endmodule