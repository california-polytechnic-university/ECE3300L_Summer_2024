`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2024 12:32:01 AM
// Design Name: 
// Module Name: clk_up_counter
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

module clk_up_counter(
    input wire clk, // 100Mhz
    input wire rst,
    input wire [4:0] clk_frequency,
    
    output reg clk_divider,
    output reg clk_refresh
    );
    
    reg [31:0] clk_count;
    reg [31:0] max_count;
    reg [10:0] fresh_count;
    
    
    // 32x5 mux: changes max_count depending on clk_frequency switches
    always @(clk_frequency) 
    begin
        case (clk_frequency)
            
            // clk = 100Mhz = 1 0000 0000Hz (1 0000 0000 cycles/second)
            // each cycle is 10ns
            // the clk is slowed down using an up_counter to waste cycles
            // if the up_counter is counting up to 5000 0000 it will take 0.5 seconds to complete this action
            // every 0.5 seconds the clk_divider = ~clk_divider
            // using this information, the posedge of the clk will occur every second
            // max_count should not exceed 42 9496 7295 (32-bit integer limit)
            // one less (-10ns) due to how it need to check regardless if the clk_count - max_count
                       
            5'b00000 : max_count = 32'd499999999; // every 10 seconds 7seg updates
            5'b00001 : max_count = 32'd249999999;  // every 5 seconds 7seg updates
            5'b00010 : max_count = 32'd149999999;  // every 3 seconds 7seg updates
            5'b00011 : max_count = 32'd99999999;  // every 2 seconds 7seg updates
            5'b00100 : max_count = 32'd49999999;   // every 1 second 7seg updates
            
            5'b00101 : max_count = 32'd40000000;
            5'b00110 : max_count = 32'd30000000;
            5'b00111 : max_count = 32'd20000000;
            5'b01000 : max_count = 32'd10000000;
            5'b01001 : max_count = 32'd9000000;
            5'b01010 : max_count = 32'd8000000;
            5'b01011 : max_count = 32'd7000000;
            5'b01100 : max_count = 32'd6000000;
            5'b01101 : max_count = 32'd5000000;
            5'b01110 : max_count = 32'd4000000;
            5'b01111 : max_count = 32'd3000000;
            5'b10000 : max_count = 32'd2000000;
            5'b10001 : max_count = 32'd1000000;
            5'b10010 : max_count = 32'd900000;
            5'b10011 : max_count = 32'd800000;
            5'b10100 : max_count = 32'd700000;
            5'b10101 : max_count = 32'd600000;
            5'b10110 : max_count = 32'd500000;
            5'b10111 : max_count = 32'd400000;
            5'b11000 : max_count = 32'd300000;
            5'b11001 : max_count = 32'd200000;
            
            5'b11010 : max_count = 32'd49999;      // every millisecond 7seg updates
            
            5'b11011 : max_count = 32'd39999;
            5'b11100 : max_count = 32'd29999;
            5'b11101 : max_count = 32'd19999;
            5'b11110 : max_count = 32'd9999;
            5'b11111 : max_count = 32'd999;        // every 1000ns
            default: max_count = 32'd3000000000;   // every minute 7seg updates
        endcase
    end
    
    // execute following block on clk or rst rising edge
    always @(posedge clk or posedge rst)
    begin
        if(rst) 
            begin
                // rst button will reset counter and clk_divider
                // if held the clk_divider will continue to be LOW
                // meaning there is no posedge clk so the 7seg will not count up
                
                clk_count <= 32'd0;
                clk_divider <= 1'b0;
            end 
            else 
                begin
                if(clk_count >= max_count) 
                    begin
                        clk_count <= 32'd0;  // reset counter to 0 when max_count is reached
                        clk_divider <= ~clk_divider;
                    end 
            else 
                begin
                    clk_count <= clk_count + 32'd1;
                end
        end
    end
    
    // execute following block on clk or rst rising edge
    always @(posedge clk or posedge rst)
    begin
        if(rst) 
            begin
                fresh_count <= 10'd0;
                clk_refresh <= 1'b0;
            end 
            else 
                begin
                if(fresh_count >= 999) // 10 000ns update
                    begin
                        fresh_count <= 10'd0;  // reset counter to 0 when max_count is reached
                        clk_refresh <= ~clk_refresh;
                    end 
            else 
                begin
                    fresh_count <= fresh_count + 10'd1;
                end
        end
    end
endmodule
