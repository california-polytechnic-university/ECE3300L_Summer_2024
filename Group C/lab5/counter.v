`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2024 09:08:47 PM
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
    input up_down,
    input load,
    input [3:0] load_input,
    output reg enable_op,
    output reg [3:0] op 
    );

    always@(posedge clk, posedge rst, posedge load)
    begin
        if(rst)
            op <= 0;
         else if(load)
            op <= load_input;
        else if(enable)
        begin
                if(!selector && !up_down) 
                begin
                    enable_op <= (op == 8);
                    op <= (op == 9) ? 4'b0000 
                    : op + 1;
                end
                else if(selector && !up_down) 
                begin
                     enable_op <= (op == 14);
                     op <= (op == 15) ? 4'b0000 
                     : op + 1;
                end
                else if(!selector && up_down) 
                begin
                     enable_op <= (op == 1);
                     op <= (op == 0) ? 4'b1001 
                     : op - 1;
                end
                else
                begin
                     enable_op <= (op == 1);
                     op <= (op == 0) ? 4'b1111
                     : op - 1;
                end
        end
    end
endmodule