`timescale 1ns / 1ps

module top_tb;

    reg clk;
    reg rst;
    reg [3:0] numberA, numberB;
    reg numberAsign, numberBsign;
    reg [1:0] operation;
    wire [6:0] cc;
    wire [7:0] an;
    wire odp;

    top NAG (
        .clk(clk),
        .rst(rst),
        .numberA(numberA),
        .numberB(numberB),
        .numberAsign(numberAsign),
        .numberBsign(numberBsign),
        .operation(operation),
        .cc(cc),
        .an(an),
        .odp(odp)
    );

  
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        rst = 1;
        numberA = 0;
        numberB = 0;
        numberAsign = 0;
        numberBsign = 0;
        operation = 2'b00;
        #40;
        
        rst = 0;
        numberA = 4'd5;
        numberB = 4'd2;
        numberAsign = 0;
        numberBsign = 0;
        operation = 2'b00;
        #80;

        numberA = 4'd6;
        numberB = 4'd4;
        numberAsign = 0;
        numberBsign = 0;
        operation = 2'b01;
        #100;

        numberA = 4'd3;
        numberB = 4'd2;
        numberAsign = 1;
        numberBsign = 0;
        operation = 2'b10;
        #70;

        numberA = 4'd3;
        numberB = 4'd4;
        numberAsign = 0;
        numberBsign = 1;
        operation = 2'b00;
        #100;

        numberA = 4'd3;
        numberB = 4'd4;
        numberAsign = 0;
        numberBsign = 1;
        operation = 2'b01;
        #100;

        $finish;
    end

endmodule
