`timescale 1ns / 1ps

module dd_add3(
    input [3:0] i,
    output reg [3:0] o
    );
    always @(*)
        case(i)
            0: o = 0;
            1: o = 1;
            2: o = 2;
            3: o = 3;
            4: o = 4;
            5: o = 8;
            6: o = 9;
            7: o = 10;
            8: o = 11;
            9: o = 12;
            default: o = 0;
         endcase
endmodule