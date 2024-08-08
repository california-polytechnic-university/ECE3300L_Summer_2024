`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2024 03:36:50 PM
// Design Name: 
// Module Name: pwn_tb
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

module pwm_tb;
    parameter R_tb = 8;

    reg clk_tb, reset_tb;
    reg [R_tb - 1:0] duty_tb;
    wire pwm_out_tb;
  
    pwm #(.R(R_tb)) uut_pwm(
        .clk(clk_tb),
        .reset_n(reset_tb),
        .duty(duty_tb),
        .pwm_out(pwm_out_tb)
    );
    
    always #5 clk_tb = ~clk_tb; // 100MHz clk

    initial
    begin
        clk_tb = 0;
        reset_tb = 0;

        #5;
        reset_tb = 1; #5;
        
        duty_tb = (2**R_tb) / 4; // duty cycle = 25%
        #2560; // full cycle is 2560ns
        
        duty_tb = (2**R_tb) / 2; // duty cycle = 50%
        #2560; 

        duty_tb = (3*(2**R_tb)) / 4;  // duty cycle = 75%
        #2560; 

        duty_tb = 0; // duty cycle = 0%

        #100;
        $finish;
    end  
endmodule