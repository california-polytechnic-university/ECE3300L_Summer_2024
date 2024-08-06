`timescale 1ns / 1ps

module size_comparator(number1,number2,num1_switch,num2_switch,reset);
input reset;
input [3:0]number1,number2;
output [3:0]num1_switch,num2_switch;
reg [3:0]temp1,temp2;
    always@(number1 or number2)
        if (reset)
            begin
                temp1<=0;
                temp2<=0;
            end
        else if(number2>number1)
            begin
                    temp1<=number2;
                    temp2<=number1;
            end 
            else
                begin
                    temp1<=number1;
                    temp2<=number2;
                end
assign num1_switch = temp1;
assign num2_switch = temp2;
endmodule
