`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 05:29:09 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input clk,
    input rst,
    input enable,
    input selector,
    input [4:0] speed,
    input SW,
    output AN,
    output [6:0] seg
);

    reg [31:0] upcounter_divider; 
    reg slow;               
    wire [3:0] upcounter_out;           
    
    assign AN = SW;
    
    always @(posedge clk or posedge rst)
     begin
        if (rst) begin
            upcounter_divider <= 32'd0;
            slow <= 1'b0;
             end 
                    else 
                            begin
                                if (upcounter_divider >= (32'd100000000 >> speed)) 
                                begin
                                upcounter_divider <= 32'd0;
                                slow <= ~slow;
                                end 
                                   else 
                                        begin
                                        upcounter_divider <= upcounter_divider + 1;
                                        end
                    end
                end
    
    upcounter upcount (
        .clk(slow),
        .rst(rst),
        .enable(enable),
        .selector(selector),
        .op(upcounter_out)
    );
    
    bcd_to_7seg bcd_to_7seg_inst (
        .bcd(upcounter_out),
        .seg(seg)
    );
    


endmodule
