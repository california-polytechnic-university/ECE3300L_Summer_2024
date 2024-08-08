`timescale 1ns / 1ps

module lab6_tb();

reg clk,reset,number1_sign,number2_sign;
reg [1:0]OP;
reg [3:0]number1,number2;
wire [6:0] seg;
wire [7:0] digit;
top_mod u1(.OP(OP),.number1(number1),.number2(number2),.clk(clk),.reset(reset),.number1_sign(number1_sign),.number2_sign(number2_sign),.seg(seg),.digit(digit)); 

initial 
    begin
        clk=1'b0;
            forever #10 clk=~clk;
    end

initial 
    begin
        reset=1'b1;
         #10
         reset = 1'b0;
    end

initial 
    begin
        OP=2'b0;  number1=4'b0;    number2=4'b0;    number1_sign=1'b0; number2_sign=1'b0;#10
        OP=2'b01; number1=4'b0100; number2=4'b0011; number1_sign=1'b0; number2_sign=1'b0;#10
        OP=2'b10; number1=4'b0100; number2=4'b0011; number1_sign=1'b0; number2_sign=1'b0;#10
        OP=2'b11; number1=4'b0100; number2=4'b0011; number1_sign=1'b0; number2_sign=1'b0;#10
        OP=2'b11; number1=4'b0100; number2=4'b0011; number1_sign=1'b1; number2_sign=1'b0;#10
        OP=2'b11; number1=4'b0100; number2=4'b0011; number1_sign=1'b1; number2_sign=1'b1;#10
        OP=2'b01; number1=4'b0100; number2=4'b0011; number1_sign=1'b1; number2_sign=1'b1;
    end
endmodule
