`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2024 01:13:30 PM
// Design Name: 
// Module Name: pwm_tb
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


module pwm_tb(
    );
    
    localparam size = 8; // 8 bit or 256 count duty cycle

    reg clk, reset;
    reg [size - 1:0] duty_load;
    wire pwm_out;
  
    pwm #(.size(size)) uut( // instantiate pwm module
        .clk(clk),
        .reset(reset),
        .duty_load(duty_load),
        .pwm_out(pwm_out)
    );
    
    always #5 clk = ~clk; // 10ns period

    initial
    begin
        clk = 0;
        reset = 0;

        #990; // wait to align the first duty cycle at 1000ns
        #5 reset = 1; // reset
        #5 reset = 0; // clear reset
        
        duty_load = (2**size) / 4; // duty cycle at 25%, 64/256
        #2560; // full cycle is 256 * 10ns period = 2560
        
        duty_load = (2**size) / 2; // duty cycle at 50%, 128/256
        #2560; 

        duty_load = (3*(2**size)) / 4;  // duty cycle at 75%, 192/256
        #2550; 

        duty_load = 0; // clear duty cycle

        #100 $stop;
    end
    
endmodule
