`timescale 1ns / 1ps

module sseg_driver_tb();
    reg clk_tb;
    reg reset_tb;
    reg [3:0] count0_tb;
    reg [3:0] count1_tb;
    reg [3:0] count2_tb;
    reg [3:0] count3_tb;
    wire dp_tb;
    wire [6:0] sseg_tb;
    wire [3:0] AN_tb;


    sseg_driver DUT(
        .clk(clk_tb),
        .reset(reset_tb),
        .count0(count0_tb),
        .count1(count1_tb),
        .count2(count2_tb),
        .count3(count3_tb),
        .dp(dp_tb),
        .sseg(sseg_tb),
        .AN(AN_tb)
    );
    
    always
    begin
        #1 clk_tb = ~clk_tb;
    end

    initial
    begin
        clk_tb = 0;
        reset_tb = 1;
        count0_tb = 4'd0;
        count1_tb = 4'd1;
        count2_tb = 4'd2;
        count3_tb = 4'd3;
    end

    initial
    begin
        #2 reset_tb = 0;
        #10 count0_tb = 4'd4;
        #10 count1_tb = 4'd5;
        #10 count2_tb = 4'd6;
        #10 count3_tb = 4'd7;
        #10 $finish;
    end

endmodule
