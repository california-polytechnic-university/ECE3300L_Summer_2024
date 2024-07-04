`timescale 1ns / 1ps

module top(
   // input rst,
    input clk_rst,
    input clk,
    input enable,
    input select,
    input idp,
    input [4:0] speed,
    output [6:0] cc,
    output odp,
    output [7:0] an
    );
    
    wire [3:0] up_down;
    wire des_block;
    wire rst;
  //  assign clk_rst = rst;
    
    upcounter BCD_HEX(
            .clk(des_block),
            .enable(enable),
            .selector(select),
            .rst(clk_rst),
            .op(up_down)
          );
    
   // counter #(.SIZE(32)) NAG(
       counter NAG(
            .clk(clk),
            .rst(rst),
            .speed(speed),
            .count(des_block)   
          );
    
    ssd_driver NUM(
             .inp(up_down),
             .idp(idp),
             .cc(cc),
             .odp(odp),
             .an(an)
    
          );
    
    
endmodule
