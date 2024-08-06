`timescale 1ns / 1ps

module clk_speed(
    input clk,
    input reset,
    input [4:0] sw,
    output reg clk_adjust,
    output reg [31:0] count
);
        always @(posedge clk or posedge reset)
            begin
                if(reset)
                    begin
                        count <= 0;
                        clk_adjust <= 0;
                    end
                else
                    begin
                        if (count >= (32'd100000000 >> sw))
                            begin
                                count <= 0;
                                clk_adjust <= ~clk_adjust;
                            end
                        else
                            begin
                                count = count + 1;
                            end
                    end
            end
endmodule