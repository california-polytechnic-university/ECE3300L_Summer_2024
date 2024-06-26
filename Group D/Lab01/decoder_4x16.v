`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly Pomona
// Engineer: Daniele Ricciardelli
// 
// Module Name: decoder_4x16
// Description: Decoder 4x16 (In the demonstration on the board the 4 inputs will be represented as Switches while the 16 outputs each will be represented by an LED). 
//////////////////////////////////////////////////////////////////////////////////


//module decoder_4x16
//(
//    input      [3:0]  SW,   
//    output reg [15:0] LED
//);

//always @(*) begin
//    case(SW)
//        4'b0000: LED = 16'b0000000000000001;
//        4'b0001: LED = 16'b0000000000000010;
//        4'b0010: LED = 16'b0000000000000100;
//        4'b0011: LED = 16'b0000000000001000;
//        4'b0100: LED = 16'b0000000000010000;
//        4'b0101: LED = 16'b0000000000100000;
//        4'b0110: LED = 16'b0000000001000000;
//        4'b0111: LED = 16'b0000000010000000;
//        4'b1000: LED = 16'b0000000100000000;
//        4'b1001: LED = 16'b0000001000000000;
//        4'b1010: LED = 16'b0000010000000000;
//        4'b1011: LED = 16'b0000100000000000;
//        4'b1100: LED = 16'b0001000000000000;
//        4'b1101: LED = 16'b0010000000000000;
//        4'b1110: LED = 16'b0100000000000000;
//        4'b1111: LED = 16'b1000000000000000;
        
//        // if invalid all LEDs turn to 0
//        default: LED = 16'b0000000000000000; 
//    endcase
//end

//endmodule



//with enable SW!

module decoder4x16
(
    input      [15:0] SW,   
    output reg [15:0] LED 
);

wire [3:0] switch_input = SW[3:0]; // 4bit input switches
wire enable             = SW[15];  // Enable SW is now SW15

always @(*) begin
    if (enable) begin
        case(switch_input)
            4'b0000: LED = 16'b0000000000000001;
            4'b0001: LED = 16'b0000000000000010;
            4'b0010: LED = 16'b0000000000000100;
            4'b0011: LED = 16'b0000000000001000;
            4'b0100: LED = 16'b0000000000010000;
            4'b0101: LED = 16'b0000000000100000;
            4'b0110: LED = 16'b0000000001000000;
            4'b0111: LED = 16'b0000000010000000;
            4'b1000: LED = 16'b0000000100000000;
            4'b1001: LED = 16'b0000001000000000;
            4'b1010: LED = 16'b0000010000000000;
            4'b1011: LED = 16'b0000100000000000;
            4'b1100: LED = 16'b0001000000000000;
            4'b1101: LED = 16'b0010000000000000;
            4'b1110: LED = 16'b0100000000000000;
            4'b1111: LED = 16'b1000000000000000;
            
            // if invalid all LEDs turn to 0
            default: LED = 16'b0000000000000000; 
        endcase
    end else begin
        // all LEDs off when enable is off
        LED = 16'b0000000000000000;
    end
end

endmodule

/*
------------------------------------------------------------------
fun one? TB might be tedious, dont know.
generic_decoder_approach

module decoder4x16
    #(parameter N = 4)
(
    input      [N - 1:0]           SW,   
    output reg [2 ** N - 1 : 0]    LED
);
    always @(*) 
    begin
    
    LED[SW] = 1'b1;
    
    end
    
endmodule 
*/
