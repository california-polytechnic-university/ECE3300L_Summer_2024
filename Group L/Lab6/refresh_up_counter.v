`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2024 11:49:52 PM
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

// ECE 3300 Lab6: Alien Calculator
// Ethan McKendell and Logan Zimmerman

module refresh_up_counter(
    input wire clk,
    input wire rst,
    
    input wire [4:0] operand_a,
    input wire [4:0] operand_b,
    
    input wire [1:0] operator,
    
    input wire [7:0] result,
    input wire sign,
    
    output wire [3:0] bcd_value,
    output reg [7:0] AN
    );
    
    reg clk_refresh;
    reg [14:0] refresh_count;
    reg [2:0] refresh;
    reg [3:0] tmp_bcd_value;
    
    // execute following block on clk or rst rising edge
    always @(posedge clk or posedge rst)
    begin
        if(rst) 
            begin
                refresh_count <= 14'd0;
                clk_refresh <= 1'b0;
            end 
            else 
                begin
                if(refresh_count >= 9999) // 100 000ns update
                    begin
                        refresh_count <= 14'd0;  // reset counter to 0 when max_count is reached
                        clk_refresh <= ~clk_refresh;
                    end 
            else 
                begin
                    refresh_count <= refresh_count + 14'd1;
                end
        end
    end
    
    // execute following block on clk_refresh (100 000ns) or rst rising edge
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
    
    // refresh one 7seg display every 100 000ns
    always @(refresh)
    begin
        case(refresh)
        3'b000:
            begin
                AN = 8'b11111110;
                // Convert 10 to 15 as BCD (operand_a tens place truncated)
                if(operand_a[3:0] > 9) tmp_bcd_value = operand_a[3:0] + 3'd6;
                else tmp_bcd_value = operand_a[3:0];
            end
        3'b001:
            begin
                AN = 8'b11111101;
                // bcd_value = 10 (positive) or 11 (negative), (HEX values unused)
                tmp_bcd_value = operand_a[4] + 4'd10;
            end
        3'b010:
            begin
                AN = 8'b11111011;
                // Convert 10 to 15 as BCD (operand_b tens place truncated)
                if(operand_b[3:0] > 9) tmp_bcd_value = operand_b[3:0] + 3'd6;
                else tmp_bcd_value = operand_b[3:0];
            end
        3'b011:
            begin
                AN = 8'b11110111;
                // bcd_value = 10 (positive) or 11 (negative), (HEX values unused)
                tmp_bcd_value = operand_b[4] + 4'd10;
            end
        3'b100:
            begin
                AN = 8'b11101111;
                tmp_bcd_value = (result % 10); // ones place
            end
        3'b101:
            begin
                AN = 8'b11011111;
                tmp_bcd_value = (result / 10) % 10; // tens place (result hundreds place truncated)
            end
        3'b110:
            begin
                AN = 8'b10111111;
                // special case: ± 0 ± 0 = 0, bcd_value = 12, (HEX values unused)
                if(result == 0) tmp_bcd_value = 4'd12;
                else tmp_bcd_value = sign + 4'd10;
            end
        3'b111:
            begin
                AN = 8'b01111111;
                case(operator)
                    2'b00: tmp_bcd_value = 0; // idle
                    2'b01: tmp_bcd_value = 2; // addition
                    2'b10: tmp_bcd_value = 4; // subtraction
                    2'b11: tmp_bcd_value = 7; // multiplication
                endcase
            end
        endcase
    end
    assign bcd_value = tmp_bcd_value;
endmodule
