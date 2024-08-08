`timescale 1ns / 1ps
module top_tb(
    );
    reg clk, reset;
    reg [4:0] x;
    reg [4:0] y;
    reg [1:0] op;
    wire [6:0] sseg;
    wire [7:0] AN;
    top uut(
        .clk(clk),
        .reset(reset),
        .x(x),
        .y(y),
        .op(op),
        .sseg(sseg),
        .AN(AN)   
    );
    localparam T = 10;
    always
    begin
        clk = 1'b0;
        #(T / 2);
        clk = 1'b1;
        #(T / 2);
    end
    initial
    begin
        reset = 1'b1;
        #2
        reset = 1'b0;
        #10 
        op = 2'b01;
        x = 5'b00110;
        y = 5'b00110; 
        #50 
        op = 2'b10; 
        x = 5'b00110;
        y = 5'b00110; 
        #50
        op = 2'b11; 
        x = 5'b00110;
        y = 5'b00110;
        #50
        op = 2'b01;
        x = 5'b00110;
        y = 5'b10110;
        #50 
        op = 2'b10;
        x = 10'b00110;
        y = 5'b10110;
        #50 
        op = 2'b11;
        x = 10'b00110;
        y = 5'b10110;
        #50 
        op = 2'b01;
        x = 5'b10110;
        y = 5'b10110;
        #50 
        op = 2'b10;
        x = 5'b10110;
        y = 5'b10110;
        #50 
        op = 2'b11;
        x = 5'b10110;
        y = 5'b10110;
        #50
        op = 2'b01;
        x = 5'b00110;
        y = 5'b01100;
        #50
        op = 2'b11;
        x = 5'b00110;
        y = 5'b01100;
        #50
        op = 2'b01;
        x = 5'b00000;
        y = 5'b10000;
        #50
        op = 2'b01;
        x = 5'b10000;
        y = 5'b10000;
        #50
        $stop;
     end
endmodule
