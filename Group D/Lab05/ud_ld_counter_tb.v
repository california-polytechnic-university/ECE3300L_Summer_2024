`timescale 1ns / 1ps

module ud_ld_counter_tb();
    reg clk_tb;
    reg reset_tb;
    reg enable_tb;
    reg updown_tb;
    reg load_tb;
    reg [3:0] load_count_tb;
    reg mode_tb;
    wire done_tb;
    wire [3:0] count_out_tb;

    ud_ld_counter DUT(
        .clk(clk_tb),
        .reset(reset_tb),
        .enable(enable_tb),
        .updown(updown_tb),
        .load(load_tb),
        .load_count(load_count_tb),
        .mode(mode_tb),
        .done(done_tb),
        .count_out(count_out_tb)
    );

    always
    begin
        #1 clk_tb = ~clk_tb;
    end

    initial
    begin
        clk_tb = 0;
        reset_tb = 1;
        enable_tb = 1;
        updown_tb = 1;
        mode_tb = 1;
        load_tb = 0;
        load_count_tb = 0;
    end

    initial
    begin
        #1 reset_tb = 0; 
        #15 load_tb = 1; load_count_tb = 4'he;
        #5 load_tb = 0;
        #20 updown_tb = 0;
        #40 enable_tb  = 0;
        #10 enable_tb = 1; mode_tb = 0; updown_tb = 1;
        #40 updown_tb = 0;
        #15 load_tb = 1; load_count_tb = 4'he;
        #5 load_tb = 0;
        #40 enable_tb = 0;
        #10 enable_tb = 1;
        #10 $finish;
    end

endmodule