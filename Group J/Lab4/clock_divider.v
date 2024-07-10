`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2024 01:41:07 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    input clk,
    input reset_n,
    input [4:0] csel,
    output reg cdone
    );
    
    reg [31:0] Q_reg = 0, Q_next;

   // Clocking block
   always @(posedge clk or posedge reset_n)
   begin
       if (reset_n)
           Q_reg <= 0;
       else
           Q_reg <= Q_next;
   end

   // Next state logic
   always @(Q_reg)
   begin
       Q_next = Q_reg + 1;
   end

   // Frequency division logic
   integer k;
   always @(Q_reg or csel)
   begin
       cdone = 1'b0;
       for (k = 0; k < 32; k = k + 1)
           if (k == csel)
               cdone = Q_reg[k];
   end

endmodule
