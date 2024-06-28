`timescale 1ns / 1ps

module Mux4x1(
input [1:0] sel, input [3:0] mux4x1_input, output mux4x1_output
    );
    wire [1:0]mux4x1_temp;
        Mux2x1 u0(
            .sel(sel[0]),.mux2x1_input(mux4x1_input[1:0]),.mux2x1_output(mux4x1_temp[0])
            );
            
        Mux2x1 u1(
            .sel(sel[0]),.mux2x1_input(mux4x1_input[3:2]),.mux2x1_output(mux4x1_temp[1])
            );
            
         Mux2x1 u2(
            .sel(sel[1]),.mux2x1_input(mux4x1_temp[1:0]),.mux2x1_output(mux4x1_output)
            );
            
           // assign mux4x1_output= mux4x1_temp[0] & mux4x1_temp[0];
endmodule