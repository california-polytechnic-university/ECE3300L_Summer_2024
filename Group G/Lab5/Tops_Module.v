module Tops_Modules(
    input clk, reset, up_down, sel, enable,
    input load, // Load button
    input [3:0] switch_input, // 4-bit switch input
    input [4:0] speed_ctrl, // 5-bit speed control
    output [6:0] seg, // 7-segment display segments
    output [3:0] AN, // other 4 anodes to turn off
    output [3:0] an, // 4 anodes
    output dp // decimal point
);

    wire divided_clk, dc_ones, dc_tens, dc_hundreds, dc_thousands;
    wire [3:0] w_ones, w_tens, w_hundreds, w_thousands, num_out;
    wire [1:0] digit_select;
    wire [20:0] sevenseg_clk;
    
    ClockDivider cd (
        .clk(clk),
        .reset(reset),
        .speed_ctrl(speed_ctrl),
        .divided_clk(divided_clk),
        .sevenseg_clk(sevenseg_clk)
    );

    BCDHexCounter Ones (
        .clk(divided_clk),
        .reset(reset),
        .up_down(up_down),
        .sel(sel),
        .enable(enable),
        .load(load),
        .initial_value(switch_input),
        .digit_change(dc_ones),
        .count(w_ones)
    );
    
    BCDHexCounter Tens (
        .clk(divided_clk),
        .reset(reset),
        .up_down(up_down),
        .sel(sel),
        .enable(dc_ones),
        .load(load),
        .initial_value(switch_input),
        .digit_change(dc_tens),
        .count(w_tens)
    );

    BCDHexCounter Hundreds (
        .clk(divided_clk),
        .reset(reset),
        .up_down(up_down),
        .sel(sel),
        .enable(dc_ones & dc_tens),
        .load(load),
        .initial_value(switch_input),
        .digit_change(dc_hundreds),
        .count(w_hundreds)
    );

    BCDHexCounter Thousands (
        .clk(divided_clk),
        .reset(reset),
        .up_down(up_down),
        .sel(sel),
        .enable(dc_ones & dc_tens & dc_hundreds),
        .load(load),
        .initial_value(switch_input),
        .digit_change(dc_thousands),
        .count(w_thousands)
    );

    SevenSegOutput ssout(
        .clk(sevenseg_clk),
        .reset(reset),
        .ones(w_ones),
        .tens(w_tens),
        .hundreds(w_hundreds),
        .thousands(w_thousands),
        .num_out(num_out),
        .digit_select(digit_select)
    );

    HexToSevenSeg hexout(
        .count(num_out),
        .digit_select(digit_select),
        .seg(seg)
    );

    assign AN = 4'b1111;  // Assume other anodes are turned off
    assign dp = 1;        // Decimal point off
    assign an = (digit_select == 2'b00) ? 4'b1110 :
                (digit_select == 2'b01) ? 4'b1101 :
                (digit_select == 2'b10) ? 4'b1011 :
                (digit_select == 2'b11) ? 4'b0111 : 4'b1111;
endmodule