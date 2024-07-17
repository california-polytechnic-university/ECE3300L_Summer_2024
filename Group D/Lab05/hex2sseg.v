module hex2sseg(
    input [3:0] hex,
    output reg [6:0] sseg
    );
    
    always@(hex)
    case(hex)
        0:  sseg = 7'b1000000;
        1:  sseg = 7'b1111001;
        2:  sseg = 7'b0100100;
        3:  sseg = 7'b0110000;
        4:  sseg = 7'b0011001;
        5:  sseg = 7'b0010010;
        6:  sseg = 7'b0000010;
        7:  sseg = 7'b1111000;
        8:  sseg = 7'b0000000;
        9:  sseg = 7'b0010000;
        10: sseg = 7'b0001000;
        11: sseg = 7'b0000011;
        12: sseg = 7'b1000110;
        13: sseg = 7'b0100001;
        14: sseg = 7'b0000110;
        15: sseg = 7'b0001110;
        default: sseg = 7'b0111111;
   endcase
endmodule