`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2024 04:02:50 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input clk, 
    input rst,
    input enable,
    input selector,
    input [31:0] speed,
    output [3:0] op
    );

    reg [3:0] tmp; // temp is 4-bit 

    always @(posedge clk or posedge rst)
    begin
        if(rst)
            tmp <= 0;
    else
            begin
            if(enable)
                begin
                if(selector)
                    begin
                        if(tmp <9)
                            tmp <= tmp + 1;
                        else
                            tmp <= 0;
                    end
                else
                    begin
                        tmp <= tmp + 1;
                    end
                end
            end
        end

    assign op = tmp; 
   
endmodule