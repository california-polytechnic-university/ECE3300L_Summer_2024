`timescale 1ns / 1ps


module topmod(
input [13:0] top_sw,
output [2:0]top_led
    );
 
   Mux4x1 LEDR(
        .sel(top_sw[1:0]), 
        .mux4x1_input(top_sw[5:2]),
         .mux4x1_output(top_led[0])
         );
         
         Mux4x1 LEDG(
        .sel(top_sw[1:0]), 
        .mux4x1_input(top_sw[9:6]),
         .mux4x1_output(top_led[1])
         );
         
         Mux4x1 LEDB(
        .sel(top_sw[1:0]), 
        .mux4x1_input(top_sw[13:10]),
        .mux4x1_output(top_led[2])
         );
    
endmodule