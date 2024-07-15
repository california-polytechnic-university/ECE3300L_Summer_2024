`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module clockManager(
    input clk,
    input reset,
    input enable,
    input [4:0] speed,
    output reg clkSignal
    );
    
    wire [31:0] tmp;
    reg [31:0] tmp_reg, tmp_next;
    
    always@(posedge clk, posedge reset)
    begin
        if (reset)
            tmp_reg <= 0;
        else if (enable)
            tmp_reg <= tmp_next;
        else
            tmp_reg <= tmp_reg;
    end
    
    
    
    always @(tmp_reg)
    begin
        tmp_next = tmp_reg + 1;
    end
    
    assign tmp = tmp_reg;
    
    integer i;
    always@(tmp,speed)
    begin
    clkSignal = 1'bx;
    for(i = 0; i < 32; i = i + 1)
        if(i==speed)
        clkSignal = tmp[i];
    end
    
    
endmodule
