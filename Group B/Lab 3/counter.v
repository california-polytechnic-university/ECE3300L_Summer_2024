`timescale 1ns / 1ps

module counter
   // #(parameter SIZE = 16)
(
    input clk,
    input rst,
    input [31:0] speed,
   // input [$clog2(SIZE)-1:0] speed,
    output count
    );
    
    reg[31:0] tmp;
  //  reg [SIZE-1:0] tmp;
        always@(posedge clk)
            begin
                if(rst)
                    tmp <=0;
                else
                    tmp <= tmp+1;
                end
     assign count = tmp[speed];
    
endmodule
