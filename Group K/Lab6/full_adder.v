`timescale 1ns / 1ps

module full_adder(carry_in,number1,number2,sum,carry_out);
input carry_in,number1,number2;
output sum,carry_out;
wire w0,w1,s0;

half_adder u1(.number1(number1),.number2(number2),.carry_out(w0),.sum(s0));
half_adder u2(.number1(s0),.number2(carry_in),.carry_out(w1),.sum(sum));

endmodule
