`timescale 1ns / 1ps

module half_adder(number1,number2,carry_out,sum);

input number1,number2;
output carry_out,sum;

assign sum = number1 ^ number2;
assign carry_out = number1 & number2;

endmodule
