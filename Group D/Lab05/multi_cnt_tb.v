`timescale 1ns / 1ps

module multi_cnt_tb();
        reg clk_tb;
        reg reset_tb;
        reg enable_tb;
        reg mode_tb;
        reg updown_tb;
        reg [1:0] an_sel_tb;
        reg load_tb;
        reg [3:0] load_count_tb;
        wire [3:0] count0_tb;
        wire [3:0] count1_tb;
        wire [3:0] count2_tb;
        wire [3:0] count3_tb;

    multi_decade_counter DUT(
        .clk(clk_tb),
        .reset(reset_tb),
        .enable(enable_tb),
        .mode(mode_tb),
        .updown(updown_tb),
        .an_sel(an_sel_tb),
        .load(load_tb),
        .load_count(load_count_tb),
        .count0(count0_tb),
        .count1(count1_tb),
        .count2(count2_tb),
        .count3(count3_tb)
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
        an_sel_tb = 0;
        load_tb = 0;
        load_count_tb = 0;
    end

    initial
    begin
        #1 reset_tb = 0; 
        #150 load_tb = 1; load_count_tb = 4'he; an_sel_tb = 3;
        #50 load_tb = 0;
        #200 updown_tb = 0;
        #400 enable_tb  = 0;
        #100 enable_tb = 1; mode_tb = 0; updown_tb = 1;
        #400 updown_tb = 0;
        #150 load_tb = 1; load_count_tb = 4'he; an_sel_tb = 1;
        #50 load_tb = 0;
        #400 enable_tb = 0;
        #100 enable_tb = 1;
        #100 $finish;
    end


endmodule
