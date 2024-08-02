`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2024 03:52:00 PM
// Design Name: 
// Module Name: rgb_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rgb_top
    #(parameter size = 13) // 13 switch controller
    (
    input clk,
    input reset, // reset button
    input change_color, // load or color change button
    input [size-1:0] color_intensity, // color intensity or brightness control from duty cycle (switches)
    input [2:0] color_selector, // 3 bit rgb selector for color change
    output red_led, green_led, blue_led // output for RGB led
    );
    
    // registers to store current and next value for each color
    reg [size:0] Rreg, Rnext, Greg, Gnext, Breg, Bnext; 
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
        begin
            Rreg <= 1'b0; // if reset, set all color registers to 0
            Greg <= 1'b0;
            Breg <= 1'b0;
        end
        else if(change_color) // if color change button pressed, update with next values/color
        begin
            Rreg <= Rnext;
            Greg <= Gnext;
            Breg <= Bnext;
        end
        else // if color changed button was not pressed, keep current values/color
        begin
            Rreg <= Rreg;
            Greg <= Greg;
            Breg <= Breg;
        end
    end
    
    always@(*) // start with maintaining the current color
    begin
        Rnext = Rreg;
        Gnext = Greg;
        Bnext = Breg;
        case(color_selector) // if a specific color is selected, assign its next value to the duty cycle chosen from switches
            3'b001: Rnext = color_intensity;
            3'b010: Gnext = color_intensity;
            3'b100: Bnext = color_intensity;
            default: // maintain the current color if invalid color select
            begin
                Rnext = Rreg;
                Gnext = Greg;
                Bnext = Breg;
            end
        endcase
    end
    
    rgb_driver #(.size(size)) LED16( // instantiate rgb_driver module that initializes the 3 LEDs from pwm module
    .clk(clk),
    .reset(reset),
    .red_duty(Rreg),
    .green_duty(Greg),
    .blue_duty(Breg),
    .red_led(red_led),
    .green_led(green_led),
    .blue_led(blue_led)
    );
    
endmodule
