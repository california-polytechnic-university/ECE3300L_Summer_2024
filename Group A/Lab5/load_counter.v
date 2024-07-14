`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2024 04:44:43 PM
// Design Name: 
// Module Name: load_counter
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


module load_counter(
    input clk,
    input reset,
    input enable,
    input mode,
    input direction,
    input load,
    input [3:0] load_num,
    output reg enable_out,
    output reg [3:0] count
    );

    always@(posedge clk, posedge reset, posedge load)
    begin
        if(reset)
            count <= 0; // if reset, load count with zero
        else if(load)
            count <= load_num;  // if load button pressed, load the count from switches
        else if(enable)
        begin
            if(!mode && !direction) // bcd and up
            begin
                enable_out <= (count == 8);
                count <= (count == 9) ? 4'b0000 : count + 1;
            end
            else if(mode && !direction) // hex and up
            begin
                 enable_out <= (count == 14);
                 count <= (count == 15) ? 4'b0000 : count + 1;
            end
            else if(!mode && direction) // bcd and down
            begin
                 enable_out <= (count == 1);
                 count <= (count == 0) ? 4'b1001 : count - 1;
            end
            else    // hex and down
            begin
                 enable_out <= (count == 1);
                 count <= (count == 0) ? 4'b1111 : count - 1;
            end
        end
    end

endmodule