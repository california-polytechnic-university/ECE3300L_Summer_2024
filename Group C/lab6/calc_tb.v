`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/13/2024 12:18:48 AM
// Design Name: 
// Module Name: calc_tb
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


module calc_tb(
    );
    
        reg clk, rst_tb;
        reg [4:0] x;
        reg [4:0] y;
        reg [1:0] op;
        wire [6:0] sseg;
        wire [7:0] AN;
        
        top dut(
            .clk(clk),
            .rst(rst_tb),
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
            rst_tb = 1'b1;
        #20
            rst_tb = 1'b0;
        #20 
            op = 2'b01;
            x = 5'b00110;
            y = 5'b00110; 
        #20 
            op = 2'b10; 
            x = 5'b00110;
            y = 5'b00110; 
        #20
            op = 2'b11; 
            x = 5'b00110;
            y = 5'b00110;
        #20
            op = 2'b01;
            x = 5'b00110;
            y = 5'b10110;
        #20 
            op = 2'b10;
            x = 10'b00110;
            y = 5'b10110;
        #20 
            op = 2'b11;
            x = 10'b00110;
            y = 5'b10110;
        #20 
            op = 2'b01;
            x = 5'b10110;
            y = 5'b10110;
        #20 
            op = 2'b10;
            x = 5'b10110;
            y = 5'b10110;
        #20 
            op = 2'b11;
            x = 5'b10110;
            y = 5'b10110;
        #20
            op = 2'b01;
            x = 5'b00110;
            y = 5'b01100;
        #20
        
        $stop;
     end
endmodule
