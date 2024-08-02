`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2024 10:24:47 AM
// Design Name: 
// Module Name: pwm
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


module pwm
    #(parameter size = 8)( // 8 bit or 256 count duty cycle
    input clk,
    input reset,
    input [size - 1:0] duty_load, // duty load value
    output pwm_out // pwm output
    );

    reg [size - 1:0] Qreg, Qnext; // qrege and qnext to create counter
    
    always @(posedge clk, posedge reset)
    begin
        if (reset)
            Qreg <= 1'b0; // if reset, we clear the current register
        else
            Qreg <= Qnext; // if no reset, we update the current register to the next
    end

    always @(*)
    begin
        Qnext = Qreg + 1; // increment the next register to count up
    end

    assign pwm_out = (Qreg < duty_load); // pwm is high as long as count is currently less than duty load
endmodule
