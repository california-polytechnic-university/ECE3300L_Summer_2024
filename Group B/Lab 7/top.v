`timescale 1ns / 1ps

module top(
    input clk,
    input rst,
    input load,
    input [2:0] rgb_select,         
    input [12:0] cycle_sw, 
    output [2:0] rgb_led            
);


    reg [12:0] red_duty, green_duty, blue_duty;  // 13-bit duty cycle for each color
    reg [12:0] red_duty_reg, green_duty_reg, blue_duty_reg; // Registers to hold duty cycles

    // Set duty cycles based on color select switches
    always @(*) begin
        case (rgb_select)
            3'b001: begin
                red_duty = cycle_sw;
                green_duty = 13'b0;
                blue_duty = 13'b0;
            end
            3'b010: begin
                red_duty = 13'b0;
                green_duty = cycle_sw;
                blue_duty = 13'b0;
            end
            3'b100: begin
                red_duty = 13'b0;
                green_duty = 13'b0;
                blue_duty = cycle_sw;
            end
            default: begin
                red_duty = 13'b0;
                green_duty = 13'b0;
                blue_duty = 13'b0;
            end
        endcase
    end

    // Load duty cycle values when load button is pressed
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            red_duty_reg <= 13'b0;
            green_duty_reg <= 13'b0;
            blue_duty_reg <= 13'b0;
        end else if (load) begin
            red_duty_reg <= red_duty;
            green_duty_reg <= green_duty;
            blue_duty_reg <= blue_duty;
        end
    end

    rgb #(.WIDTH(13)) rgb_inst (
        .clk(clk),
        .rst(rst),
        .red_duty(red_duty_reg),
        .green_duty(green_duty_reg),
        .blue_duty(blue_duty_reg),
        .red_led(rgb_led[0]),
        .green_led(rgb_led[1]),
        .blue_led(rgb_led[2])
    );

endmodule
