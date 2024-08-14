`timescale 1ns / 1ps

module top
    #(parameter WIDTH = 13) (
    input wire clk,
    input wire rst,
    input wire color_change,
    input wire [WIDTH-1:0] intensity,
    input wire [2:0] color_sel,
    output wire red_output, green_output, blue_output
    );

    reg [WIDTH:0] red_reg, green_reg, blue_reg;
    reg [WIDTH:0] red_next, green_next, blue_next;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            red_reg <= 0;
            green_reg <= 0;
            blue_reg <= 0;
        end else if (color_change) begin
            red_reg <= red_next;
            green_reg <= green_next;
            blue_reg <= blue_next;
        end
    end

    always @(*) begin
       
        red_next = red_reg;
        green_next = green_reg;
        blue_next = blue_reg;

 
        case (color_sel)
            3'b001: red_next = intensity;
            3'b010: green_next = intensity;
            3'b100: blue_next = intensity;
            default: begin
                red_next = red_reg;
                green_next = green_reg;
                blue_next = blue_reg;
            end
        endcase
    end

    rgb #(.WIDTH(WIDTH)) rgb_inst (
        .clk(clk),
        .rst(rst),
        .red_intensity(red_reg),
        .green_intensity(green_reg),
        .blue_intensity(blue_reg),
        .red_output(red_output),
        .green_output(green_output),
        .blue_output(blue_output)
    );

endmodule
