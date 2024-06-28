`timescale 1ns / 1ps

module Mux2x1(
input sel, input [1:0] mux2x1_input,output mux2x1_output
    );
   /* wire [2:0] temp;
    assign temp[2]=~sel;
    assign temp[0]=temp[2]& mux2x1_input[0];
    assign temp[1]=sel & mux2x1_input[1];
    assign mux2x1_output=temp[0] & temp[1];   */
    assign mux2x1_output=~sel & mux2x1_input[0] | sel & mux2x1_input[1];
    
endmodule