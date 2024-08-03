module bcd2sseg(
    input [3:0] bcd,
    output reg [6:0] sseg
);
    
    always @(bcd) begin
        case(bcd)
            4'd0: sseg = 7'b1000000;
            4'd1: sseg = 7'b1111001;
            4'd2: sseg = 7'b0100100;
            4'd3: sseg = 7'b0110000;
            4'd4: sseg = 7'b0011001;
            4'd5: sseg = 7'b0010010;
            4'd6: sseg = 7'b0000010;
            4'd7: sseg = 7'b1111000;
            4'd8: sseg = 7'b0000000;
            4'd9: sseg = 7'b0010000;
            default: sseg = 7'b1111111; // blank
        endcase
    end
endmodule
