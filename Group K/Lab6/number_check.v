`timescale 1ns / 1ps

module number_check(number1,number2,num1,num2);
input [3:0] number1,number2;
output [3:0] num1,num2;
reg [3:0] temp1,temp2;

always@(number1)
    if(number1 > 9)
        temp1<= number1 + 6;
     else
        temp1<= number1;
        
always@(number2)
    if(number2 > 9)
        temp2<= number2 + 6;
     else
        temp2<= number2;
 assign num1 = temp1;
 assign num2 = temp2;
endmodule
