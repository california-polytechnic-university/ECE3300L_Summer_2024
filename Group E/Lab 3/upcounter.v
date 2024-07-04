`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2024 12:29:53 AM
// Design Name: 
// Module Name: upcounter
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


module upcounter(
            input clk, rst, sel, en,
            output [3:0] op
                );
    reg [3:0] tmp;
    always@(posedge clk or posedge rst)
    begin
    if (rst)
        tmp <= 4'b0;
    else
    begin 
        if (en == 1) 
        begin
            if (sel == 1)
                begin
                if (tmp < 4'b1001)
                    tmp <= tmp + 1;
                else
                    tmp <= 4'b0;
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
