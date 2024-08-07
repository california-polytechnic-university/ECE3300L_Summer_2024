`timescale 1ns / 1ps

module alienSigns(
    input sign,
    output reg [6:0] display
    );
    
    always@(sign)
        case(sign)
            0:  display = 7'b0101110;
            1:  display = 7'b0100101;
        endcase    
    
endmodule
