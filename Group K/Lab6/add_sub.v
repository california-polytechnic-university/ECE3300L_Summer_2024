`timescale 1ns / 1ps

module add_sub(number1,number2,sel,cout,over_flow,x);
input [3:0] number1,number2;
input sel;
output cout,over_flow;
output [3:0] x;
wire [3:0] NUM2XORED;

assign NUM2XORED[0] = number2[0] ^ sel; 
assign NUM2XORED[1] = number2[1] ^ sel; 
assign NUM2XORED[2] = number2[2] ^ sel; 
assign NUM2XORED[3] = number2[3] ^ sel; 

four_bit_adder u7(.carry_in(sel),.number1(number1),.number2(NUM2XORED),.cout(cout),.sum(x));

assign over_flow = cout ^ (number1[2] & number2[2]);

endmodule
