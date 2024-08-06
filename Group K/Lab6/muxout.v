`timescale 1ns / 1ps

module muxout(sel,in0,in1,out);
input sel;
input [7:0] in0,in1;
output reg [7:0]out;

    always@(sel)
        case(sel)
        1'b0:   out=in0;
        1'b1:   out=in1;
    endcase
endmodule
