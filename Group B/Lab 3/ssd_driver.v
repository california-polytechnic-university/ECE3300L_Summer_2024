`timescale 1ns / 1ps

module ssd_driver(
        input [3:0] inp,
        input idp,
        output [6:0] cc,
        output odp,
        output [7:0] an
    );
    assign odp = idp;
    assign an = 8'b11111110;
    
    reg [6:0] ssd_tmp_cc;
   // reg [3:0] counter;
    wire [3:0] ssd_digit;
    assign ssd_digit = inp;
  
    always@(inp)
        begin:SEG_ENC
            case(inp)
                4'h0:ssd_tmp_cc=7'b1000000;
                4'h1:ssd_tmp_cc=7'b1111001;
                4'h2:ssd_tmp_cc=7'b0100100;
                4'h3:ssd_tmp_cc=7'b0110000;
                4'h4:ssd_tmp_cc=7'b0011001;
                4'h5:ssd_tmp_cc=7'b0010010;
                4'h6:ssd_tmp_cc=7'b0000010;
                4'h7:ssd_tmp_cc=7'b1111000;
                4'h8:ssd_tmp_cc=7'b0000000;
                4'h9:ssd_tmp_cc=7'b0010000;
                4'hA:ssd_tmp_cc=7'b0001000;
                4'hB:ssd_tmp_cc=7'b0000011;
                4'hC:ssd_tmp_cc=7'b1000110;
                4'hD:ssd_tmp_cc=7'b0100001;
                4'hE:ssd_tmp_cc=7'b0000110;
                4'hF:ssd_tmp_cc=7'b0001110;
                default: ssd_tmp_cc = 7'bzzzzzzz;
            endcase
        end
        
    assign cc = ssd_tmp_cc;

endmodule
