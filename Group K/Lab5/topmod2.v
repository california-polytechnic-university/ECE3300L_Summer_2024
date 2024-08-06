`timescale 1ns / 1ps

module topmod2(
//
input clk,
input selector,
input rst,
input enable,
input up_down,
input load,
input [8:5]numload,
input [4:0]SW,
//
output [7:0]AN,
output [6:0]display
);
//
wire [3:0] ones, tens, hundreds, thousands;
wire new_clk; //divided clock signal to use for all clk inputs instead of clk
wire [31:0] count;
wire enable1, enable2, enable3; //enables connecting the counters together
//
reg [1:0] select;
reg [3:0] selectop;
reg [20:0] clk_divider;
//
clk_speed u1( //clock divider module
    .clk(clk),
    .reset(rst),
    .sw(SW),
    .clk_adjust(new_clk), //clkspeed output
    .count(count)
    );
counter d1( //bit 0 counter
    .clk(new_clk),
    .reset(rst),
    .enable(enable),
    .selector(selector),
    .up_down(up_down),
    .load(load),
    .numload(numload),
    .op(ones),
    .enable_out(enable1)
      );
counter d2( //bit 1 counter
    .clk(new_clk),
    .reset(rst),
    .enable(enable1),
    .selector(selector),
    .up_down(up_down),
    .load(load),
    .numload(numload),
    .op(tens),
    .enable_out(enable2)
      );
counter d3( //bit 2 counter
    .clk(new_clk),
    .reset(rst),
    .enable(enable1 & enable2),
    .selector(selector),
    .up_down(up_down),
    .load(load),
    .numload(numload),
    .op(hundreds),
    .enable_out(enable3)
    );
counter d4( //bit 3 counter
    .clk(new_clk),
    .reset(rst),
    .enable(enable1 & enable2 & enable3),
    .selector(selector),
    .up_down(up_down),
    .load(load),
    .numload(numload),
    .op(thousands),
    .enable_out()
    );

always @(posedge clk or posedge rst)
    begin
        if (rst)
            clk_divider <= 0;
        else
            clk_divider <= clk_divider + 1;
    end

always @(posedge clk_divider[16] or posedge rst)
    begin
        if (rst)
            select <= 2'b00;
        else
            select <= select + 1;
    end

always @ (*)
    begin
        case (select)
            2'b00: selectop = ones;
            2'b01: selectop = tens;
            2'b10: selectop = hundreds;
            2'b11: selectop = thousands;
            default: selectop = 4'b0000;
        endcase
    end

segment_display u4( //7segment display driver
    .number_input(selectop),
    .number_output(display)
    );

    assign AN = (select == 2'b00) ? 8'b1111_1110 :
                (select == 2'b01) ? 8'b1111_1101 :
                (select == 2'b10) ? 8'b1111_1011 :
                (select == 2'b11) ? 8'b1111_0111 : 8'b1111_1111;

endmodule