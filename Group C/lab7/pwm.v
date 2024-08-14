`timescale 1ns / 1ps

module pwm
    #(parameter WIDTH = 8) (
    input wire clk,
    input wire rst,
    input wire [WIDTH - 1:0] duty_cycle,
    output wire pwm_signal
    );

    reg [WIDTH - 1:0] counter_reg = 0;
    reg [WIDTH - 1:0] counter_next;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter_reg <= 0;
        end else begin
            counter_reg <= counter_next;
        end
    end

    always @(*) begin
        counter_next = counter_reg + 1;
    end

    assign pwm_signal = (counter_reg < duty_cycle) ? 1'b1 : 1'b0;

endmodule
