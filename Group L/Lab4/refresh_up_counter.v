`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2024 12:17:14 AM
// Design Name: 
// Module Name: refresh_up_counter
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

module refresh_up_counter(
    input wire clk_refresh,
    input wire rst,
    input wire [15:0] value,
    
    output wire [3:0] bcd_hex_value,
    output reg [7:0] AN
    );
    
    reg [1:0] refresh;
    reg [3:0] tmp_bcd_hex_value;
    
    // execute following block on clk_refresh (1ms) or rst rising edge
    always @(posedge clk_refresh or posedge rst)
    begin 
        if(rst)
            begin
                refresh <= 0;
            end
        else
            begin
                refresh <= refresh + 1;
            end
    end
    
    // refresh one 7seg display every 1ms
    always @(refresh)
    begin
        case(refresh)
        2'b00: 
            begin
                AN = 8'b11111110;
                tmp_bcd_hex_value = value[3:0];
            end
        2'b01: 
            begin
                AN = 8'b11111101;
                tmp_bcd_hex_value = value[7:4];
            end
        2'b10: 
            begin
                AN = 8'b11111011;
                tmp_bcd_hex_value = value[11:8];
            end
        2'b11: 
            begin
                AN = 8'b11110111;
                tmp_bcd_hex_value = value[15:12];
            end
        endcase
    end
    
    assign bcd_hex_value = tmp_bcd_hex_value;
endmodule
