`timescale 1ns / 1ps

module segment_display(
    input [3:0] number_input,
    output reg [6:0] number_output
    );
        always @(number_input)
            begin
                case (number_input)
                    4'h0: number_output = 7'b0000001; //0
                    4'h1: number_output = 7'b1001111; //1
                    4'h2: number_output = 7'b0010010; //2
                    4'h3: number_output = 7'b0000110; //3
                    4'h4: number_output = 7'b1001100; //4
                    4'h5: number_output = 7'b0100100; //5
                    4'h6: number_output = 7'b0100000; //6
                    4'h7: number_output = 7'b0001111; //7
                    4'h8: number_output = 7'b0000000; //8
                    4'h9: number_output = 7'b0000100; //9
                    4'hA: number_output = 7'b0001000; //A
                    4'hB: number_output = 7'b1100000; //B
                    4'hC: number_output = 7'b0110001; //C
                    4'hD: number_output = 7'b1000010; //D
                    4'hE: number_output = 7'b0110000; //E
                    4'hF: number_output = 7'b0111000; //F
                    default: number_output = 7'b1111111;
                endcase
            end
endmodule