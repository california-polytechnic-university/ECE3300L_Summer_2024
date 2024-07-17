`timescale 1ns / 1ps

module top(
    input clk,
    input reset_n,
    input an_rst,
    input cnt_rst,
    input [4:0] cnt_sel,
    input [1:0] an_sel,
    input enable,
    input mode,
    input updown,
    input load,
    input [3:0] load_count,
    output dp,
    output [6:0] sseg,
    output [7:0] AN
    );
    
    wire cnt_clk, an_clk;
    
    // Clock divider for counter
    wire div_clk;
    wire [3:0] count0, count1, count2, count3;
    
    clock_divider clkDiv(
        .clk_in(clk),
        .reset(~reset_n),
        .cnt_sel(cnt_sel),
        .an_sel(5'd17),
        .cnt_clk(cnt_clk),
        .an_clk(an_clk)
    );
    
    multi_decade_counter multiCnt(
        .clk(cnt_clk),
        .reset(cnt_rst),
        .enable(enable),
        .mode(mode),
        .updown(updown),
        .an_sel(an_sel),
        .load(load),
        .load_count(load_count),
        .count0(count0),
        .count1(count1),
        .count2(count2),
        .count3(count3)
    );
    
    sseg_driver ssegDriver(
        .clk(an_clk),
        .reset(an_rst),
        .count0(count0),
        .count1(count1),
        .count2(count2),
        .count3(count3),
        .dp(dp),
        .sseg(sseg),
        .AN(AN)
    );
    
endmodule
