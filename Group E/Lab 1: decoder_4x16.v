`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Raymond Palacio
// 
// Create Date: 06/10/2024 09:31:17 PM
// Design Name: 
// Module Name: decoder_4x16
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 4 by 16 decoder
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder_4x16(
    input  [3:0] x,   
    output [15:0] y
);

//create not wires for structural modeling
wire n0, n1, n2, n3;

not not0(n0, x[0]);
not not1(n1, x[1]);
not not2(n2, x[2]);
not not3(n3, x[3]);

//create AND gates connecting wires and inputs to output

and and0(y[0], n3, n2, n1, n0);
and and1(y[1], n3, n2, n1, x[0]);
and and2(y[2], n3, n2, x[1], n0);
and and3(y[3], n3, n2, x[1], x[0]);
and and4(y[4], n3, x[2], n1, n0);
and and5(y[5], n3, x[2], n1, x[0]);
and and6(y[6], n3, x[2], x[1], n0);
and and7(y[7], n3, x[2], x[1], x[0]);
and and8(y[8], x[3], n2, n1, n0);
and and9(y[9], x[3], n2, n1, x[0]);
and and10(y[10], x[3], n2, x[1], n0);
and and11(y[11], x[3], n2, x[1], x[0]);
and and12(y[12], x[3], x[2], n1, n0);
and and13(y[13], x[3], x[2], n1, x[0]);
and and14(y[14], x[3], x[2], x[1], n0);
and and15(y[15], x[3], x[2], x[1], x[0]);


endmodule
