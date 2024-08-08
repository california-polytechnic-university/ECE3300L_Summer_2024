`timescale 1ns / 1ps

module top_mod(OP,number1,number2,clk,reset,number1_sign,number2_sign,seg,digit); 

   input clk,reset,number1_sign,number2_sign;
   input [1:0] OP;
   input [3:0] number1,number2;
   output [6:0]seg;
   output [7:0]digit;
   wire [3:0]num1,num2;
   wire [7:0] out_to_bcd;
   wire [7:0]bcd_out;
   
   number_check u18(.number1(number1),.number2(number2),.num1(num1),.num2(num2));
   calculator u19(.num1({number1_sign,num1}),.num2({number2_sign,num2}),.result(out_to_bcd),.operation(OP),.num1m(num1),.num2m(num2));
   doubdab u13(.b_in(out_to_bcd),.b_out(bcd_out));
   seg7_control u17(.clk_output(clk),.reset(reset),.dig1(num2),.dig2(number2_sign),.dig3(num1),.dig4(number1_sign),.dig5(bcd_out[3:0]),.dig6(bcd_out[7:4]),.dig7({number1_sign,number2_sign}),.dig8(OP),.seg(seg),.digit(digit));

endmodule
