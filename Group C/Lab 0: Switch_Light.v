`timescale 1ns / 1ps
module Switch_Light(
    input [15:0] sw,
    output [15:0] led
    );
    
    assign sw = led;
    
endmodule
