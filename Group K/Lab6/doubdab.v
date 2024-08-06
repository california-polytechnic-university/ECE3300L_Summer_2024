`timescale 1ns / 1ps

module doubdab(
    input [7:0] b_in,
    output [11:0] b_out
    );
    
// break the block up into 5 pieces, and define the 12 bit bus
// at the interface between each piece as a0, a1 .. a5
//
// a0[11:0] is the input to the block
// a5[11:0] is the output of the block

    wire [11:0] a0, a1, a2, a3, a4, a5;
    
    assign a0 = {4'b0,b_in};
    
    dd_add3 u1 (a0[8:5],a1[8:5]);
    assign a1[11:9] = a0[11:9];    
    assign a1[4:0] = a0[4:0];
    
    dd_add3 u2 (a1[7:4],a2[7:4]);
    assign a2[11:8] = a1[11:8];    
    assign a2[3:0] = a1[3:0];

    dd_add3 u3 (a2[6:3],a3[6:3]);
    assign a3[11:7] = a2[11:7];    
    assign a3[2:0] = a2[2:0];
    
    dd_add3 u4 (a3[5:2],a4[5:2]);
    dd_add3 u6 (a3[9:6],a4[9:6]);
    assign a4[11:10] = a3[11:10];    
    assign a4[1:0] = a3[1:0]; 
    
    dd_add3 u5 (a4[4:1],a5[4:1]);
    dd_add3 u7 (a4[8:5],a5[8:5]);
    assign a5[11:9] = a4[11:9];    
    assign a5[0] = a4[0]; 
     
    assign b_out = a5;
    
endmodule