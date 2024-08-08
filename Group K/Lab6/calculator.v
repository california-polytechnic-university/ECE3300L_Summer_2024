`timescale 1ns / 1ps

module calculator(num1,num2,num1m,num2m,result,operation);
input signed [4:0]num1,num2;
input [3:0]num1m,num2m;
input [1:0] operation;
reg [7:0]temp;
output  [7:0]result;
always@*
    case(operation)
        2'b00:  temp <= temp;
        2'b01:  temp <= num1 + num2;
        2'b10:  temp <= num1 - num2;
        2'b11:  temp <= num1m * num2m; 
       
    endcase
assign result = temp;
endmodule
