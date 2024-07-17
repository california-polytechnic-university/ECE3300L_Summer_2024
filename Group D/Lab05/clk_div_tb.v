`timescale 1ns / 1ps

module clk_div_tb();
    reg clk_in_tb;
    reg reset_tb;
    reg [4:0] csel_tb;
    wire clk_out_tb;

    clock_divider DUT(
        .clk_in(clk_in_tb),
        .reset(reset_tb),
        .csel(csel_tb),
        .clk_out(clk_out_tb)
    );

    always
    begin
        #1 clk_in_tb = ~clk_in_tb;
    end

    initial
    begin
        clk_in_tb = 0;
        reset_tb = 1;
        csel_tb = 5'd1;
    end

    initial
    begin
        #1 reset_tb = 0; 
        #20 csel_tb = 5'd2;
        #40 csel_tb = 5'd3;
        #80 $finish;
    end

endmodule
