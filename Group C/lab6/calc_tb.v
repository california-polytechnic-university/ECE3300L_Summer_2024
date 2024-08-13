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
    
        reg clk_tb, rst_tb;
        reg [4:0] x_tb;
        reg [4:0] y_tb;
        reg [1:0] op_tb;
        wire [6:0] sseg_tb;
        wire [7:0] AN_tb;
        
        top dut(
            .clk(clk_tb),
            .rst(rst_tb),
            .x(x_tb),
            .y(y_tb),
            .op(op_tb),
            .sseg(sseg_tb),
            .AN(AN_tb)   
        );
       
    always
        begin
             clk_tb = 0;
                forever #5 
                clk_tb = ~clk_tb;
        end
    
    initial
        begin
            rst_tb = 1'b1;
        #20 
            //testing addition 
            op_tb = 2'b00;
            x_tb = 5'b00101;    //5
            y_tb = 5'b00100;    //4
                                //result =9
        #20 
            // 
            op_tb = 2'b10; 
            x_tb = 5'b01100;
            y_tb = 5'b01010; 
        #20
            op_tb = 2'b11; 
            x_tb = 5'b00101;
            y_tb = 5'b00110;
        #20
            op_tb = 2'b01;
            x_tb = 5'b01100;
            y_tb = 5'b00110;
        #20 
            op_tb = 2'b10;
            x_tb = 10'b01110;
            y_tb = 5'b10100;
        #20 
            op_tb = 2'b11;
            x_tb = 10'b01110;
            y_tb = 5'b10100;
        #20 
            op_tb = 2'b01;
            x_tb = 5'b10110;
            y_tb = 5'b10110;
        #20
        
        $stop;
     end
endmodule
