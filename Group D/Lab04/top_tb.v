`timescale 1ns / 1ps

module top_tb(
    );
    wire [6:0] sseg;
    wire [3:0] count;
    reg clk;
    reg reset;
    reg enable;
    reg type;
    reg updown;
    multi_decade_counter uut_counter (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .type(type),
        .updown(updown),
        .count(count)
    );
    hex2sseg uut_hex2sseg (
        .hex(count),
        .sseg(sseg)
    );
    initial 
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial 
    begin     
        reset = 1;
        enable = 0;
        type = 0;
        updown = 0;
        #10 reset = 0;
        #10 enable = 1;
        #500
        #10 reset = 1;
        #10 reset = 0;
        #10 type = 1;
        #10 updown = 1;
        #500
        #10 enable = 0;
        $finish;
    end
endmodule
