`timescale 1ns / 1ps

module four_bit_adder(carry_in,number1,number2,cout,sum);
input carry_in;
input [3:0] number1,number2;
output cout;
output [3:0] sum;
wire   [2:0] c;

full_adder u3(.carry_in(carry_in),.number1(number1[0]),.number2(number2[0]),.sum(sum[0]),.carry_out(c[0]));
full_adder u4(.carry_in(c[0]),.number1(number1[1]),.number2(number2[1]),.sum(sum[1]),.carry_out(c[1]));
full_adder u5(.carry_in(c[1]),.number1(number1[2]),.number2(number2[2]),.sum(sum[2]),.carry_out(c[2]));
full_adder u6(.carry_in(c[2]),.number1(number1[3]),.number2(number2[3]),.sum(sum[3]),.carry_out(cout));

endmodule
