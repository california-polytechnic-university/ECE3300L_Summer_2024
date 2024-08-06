`timescale 1ns / 1ps

module sign_comparator(num1_sign,num2_sign,sign_output);
input num1_sign,num2_sign;
reg [6:0]temp;
output [6:0]sign_output;
    always@(num1_sign or num2_sign)
        if (num1_sign == num2_sign)
            temp<= 7'b0101110;
        else
            temp<=7'b0100101;
    assign sign_ouput=temp;
endmodule
