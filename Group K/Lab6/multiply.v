`timescale 1ns / 1ps

module multiply(number1,number2,x);
    input [3:0] number1,number2;
    output [7:0] x;
    wire [3:0] mL4,mL3,mL2,mL1,s1,s2,s3,carryout1,carryout2,carryout3;
    
    assign mL1=number1 & {4{number2[0]}};
    assign mL2=number1 & {4{number2[1]}};
    assign mL3=number1 & {4{number2[2]}};
    assign mL4=number1 & {4{number2[3]}};
    
   four_bit_adder FBA1(.number1({1'b0,mL1[3:1]}),.number2(mL2),.carry_in(0),.sum(s1),.cout(carryout1));
   four_bit_adder FBA2(.number1({carryout1,s1[3:1]}),.number2(mL3),.carry_in(0),.sum(s2),.cout(carryout2));
   four_bit_adder FBA3(.number1({carryout2,s2[3:1]}),.number2(mL4),.carry_in(0),.sum(s3),.cout(carryout3));
        
    assign x[0]=mL1[0];
    assign x[1]=s1[0];
    assign x[2]=s2[0];
    assign x[3]=s3[0];
    assign x[4]=s3[1];
    assign x[5]=s3[2];
    assign x[6]=s3[3];
    assign x[7]=carryout3;
    
endmodule
