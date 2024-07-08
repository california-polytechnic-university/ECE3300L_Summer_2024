`timescale 1ns / 1ps
`define display 8'b11111110
`define decimal_off 1'b1

module segement_display(
    input [3:0]number_input,
    input  clk,
    input  reset,
    output reg [6:0]number_output,
    output wire [6:0]to_display,
    output wire dp,
    output wire [7:0]an
    );
    assign an=`display;
    assign dp=`decimal_off;
    
        always @(posedge clk or posedge reset)
        if(reset)
            number_output<=7'b0000001;
            else
                begin
                    case(number_input)
                        4'b0000: number_output= 7'b0000001; //0
                        4'b0001: number_output= 7'b1001111; //1
                        4'b0010: number_output= 7'b0010010; //2
                        4'b0011: number_output= 7'b0000110; //3
                        4'b0100: number_output= 7'b1001100; //4
                        4'b0101: number_output= 7'b0100100; //5
                        4'b0110: number_output= 7'b0100000; //6
                        4'b0111: number_output= 7'b0001111; //7
                        4'b1000: number_output= 7'b0000000; //8
                        4'b1001: number_output= 7'b0000100; //9
                        'hA: number_output= 7'b0001000; //A
                        'hB: number_output= 7'b1100000; //B
                        'hC: number_output= 7'b0110001; //C
                        'hD: number_output= 7'b1000010; //D
                        'hE: number_output= 7'b0110000; //E
                        'hF: number_output= 7'b0111000; //F
                        default : number_output=7'b1111111; //segement off
                     endcase
            end
assign to_display=number_output;
endmodule
