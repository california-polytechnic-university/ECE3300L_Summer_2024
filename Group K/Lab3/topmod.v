`timescale 1ns / 1ps

module topmod(selector, rst,clock,enable,SW,display,DP,AN);
input selector,rst,clock,enable;
output DP;
output [7:0]AN;
input [4:0]SW;
wire  [3:0]current_number;
wire  clk_adjusted;
output [6:0]display;

clk_speed   u1(.clk(clock),.reset(rst),.sw(SW),.clk_adjust(clk_adjusted));
upcounter u3(.clk(clk_adjusted),.reset(rst),.enable(enable),.selector(selector),.op(current_number));
segement_display u4(.number_input(current_number),.to_display(display),.an(AN),.dp(DP),.clk(clk_adjusted),.reset(rst));

endmodule
