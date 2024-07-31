`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2024 01:41:07 PM
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
    input [9:0] SW,
    input [1:0] op,
    input reset,
    output [6:0] seg,
    output [7:0] AN
);

    wire [4:0] a = SW[4:0];
    wire [4:0] b = SW[9:5];
    wire [7:0] result;
    wire negative;

    calc calculator(
        .a(a),
        .b(b),
        .op(op),
        .reset(reset),
        .result(result),
        .negative(negative)
    );

    wire [3:0] ones = result % 10;
    wire [3:0] tens = result / 10;

    wire [6:0] seg_a, seg_b, seg_ones, seg_tens, seg_op;

    bcd_to_7seg seg_a_inst(
        .bcd(a[3:0]),
        .seg(seg_a)
    );

    bcd_to_7seg seg_b_inst(
        .bcd(b[3:0]),
        .seg(seg_b)
    );

    bcd_to_7seg seg_ones_inst(
        .bcd(ones),
        .seg(seg_ones)
    );

    bcd_to_7seg seg_tens_inst(
        .bcd(tens),
        .seg(seg_tens)
    );

    bcd_to_7seg seg_op_inst(
        .bcd((op == 2'b00) ? 4'd2 :
             (op == 2'b01) ? 4'd4 :
             (op == 2'b10) ? 4'd7 : 4'd0),
        .seg(seg_op)
    );

    reg [6:0] seg_reg [7:0];
    reg [15:0] clk_divider;
    reg [2:0] anode_select;

    parameter CLK_DIV_LIMIT = 16'd10000;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            clk_divider <= 16'd0;
        end else begin
            clk_divider <= clk_divider + 1;
            if (clk_divider == CLK_DIV_LIMIT) begin
                clk_divider <= 16'd0;
            end
        end
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            anode_select <= 3'd0;
        end else if (clk_divider == CLK_DIV_LIMIT) begin
            anode_select <= anode_select + 1;
        end
    end

    always @(*) begin
        if (reset) begin
            seg_reg[0] = 7'b0000000;
            seg_reg[1] = 7'b0000000;
            seg_reg[2] = 7'b0000000;
            seg_reg[3] = 7'b0000000;
            seg_reg[4] = 7'b0000000;
            seg_reg[5] = 7'b0000000;
            seg_reg[6] = 7'b0000000;
            seg_reg[7] = 7'b0000000;
        end else begin
            case (anode_select)
                3'b000: seg_reg[0] = seg_a;
                3'b001: seg_reg[1] = (a[4]) ? 7'b0100101 : 7'b0101110;
                3'b010: seg_reg[2] = seg_b;
                3'b011: seg_reg[3] = (b[4]) ? 7'b0100101 : 7'b0101110;
                3'b100: seg_reg[4] = seg_ones;
                3'b101: seg_reg[5] = seg_tens;
                3'b110: seg_reg[6] = (result == 8'b00000000) ? 7'b1111111 :
                                      (negative) ? 7'b0100101 : 7'b0101110;
                3'b111: seg_reg[7] = seg_op;
                default: seg_reg[0] = 7'b0000000;
            endcase
        end
    end

    assign AN = ~(8'b00000001 << anode_select);
    assign seg = seg_reg[anode_select];

endmodule


