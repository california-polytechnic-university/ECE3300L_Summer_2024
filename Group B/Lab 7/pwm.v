`timescale 1ns / 1ps

module pwm

#(parameter WIDTH = 8)
(
    input clk,
    input rst,
    input [WIDTH-1:0] duty_cycle, 
    output reg pwm           
);

    reg [WIDTH-1:0] counter;       

    always @(posedge clk or posedge rst) begin
        if (rst)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    always @(*) begin
        pwm = (counter < duty_cycle);  
    end

endmodule
