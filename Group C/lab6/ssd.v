`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2024 11:44:13 PM
// Design Name: 
// Module Name: ssd
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


module ssd(
       input clk,
        input rst,
        input [4:0] x,
        input [4:0] y,
        input [1:0] op,
        output reg [7:0] out,
        output reg sign,
        output [6:0] sseg,
        output [7:0] AN 
    );
        reg [15:0] clk_divider; 
        reg [2:0] anode_select; 
   
    always @(posedge clk or posedge rst) 
   
    begin
        if (rst) 
        begin
            clk_divider <= 16'd0;
            anode_select <= 3'd0; 
        end 
        else 
        begin
            clk_divider <= clk_divider + 1; 
            if (clk_divider == 16'd10000)
            begin 
                clk_divider <= 16'd0;
                anode_select <= anode_select + 1;
            end
        end
    end
        wire [3:0] ones = out % 10;
        wire [3:0] tens = out / 10;
        wire [6:0] sseg_a;
        wire [6:0] sseg_b; 
        wire [6:0] sseg_ones; 
        wire [6:0] sseg_tens; 
        wire [6:0] sseg_op; 
    
    sseg Xa( 
        .bcd(x[3:0]),
        .sseg(sseg_a)
    );
    sseg Xb( 
        .bcd(y[3:0]),
        .sseg(sseg_b)
    );
    
    sseg X_1( 
        .bcd(ones),
        .sseg(sseg_ones)
    );
    
    sseg X_2( 
        .bcd(tens),
        .sseg(sseg_tens)
    );
    
    sseg X_3( 
        .bcd((op == 2'b00) ? 4'd0 :
             (op == 2'b01) ? 4'd2 :
             (op == 2'b10) ? 4'd4 :
             (op == 2'b11) ? 4'd7 : 4'd0),
         .sseg(sseg_op)
    );
    
    reg [6:0] sseg_reg [7:0];
    
    always @(*) 
    begin
        if (rst)
        begin
            sseg_reg[0] = 7'b0000000;
            sseg_reg[1] = 7'b0000000;
            sseg_reg[2] = 7'b0000000;
            sseg_reg[3] = 7'b0000000;
            sseg_reg[4] = 7'b0000000;
            sseg_reg[5] = 7'b0000000;
            sseg_reg[6] = 7'b0000000;
            sseg_reg[7] = 7'b0000000;
        end
        else
        
        begin
            case (anode_select) 
                3'b000: sseg_reg[0] = sseg_a; 
                3'b001: sseg_reg[1] = (x[4]) ? 7'b0100101 : 7'b0101110;
                3'b010: sseg_reg[2] = sseg_b; 
                3'b011: sseg_reg[3] = (y[4]) ? 7'b0100101 : 7'b0101110;
                3'b100: sseg_reg[4] = sseg_ones; 
                3'b101: sseg_reg[5] = sseg_tens; 
               
                3'b110: sseg_reg[6] = (out == 8'b00000000) ? 7'b1111111 : 
                                      (sign) ? 7'b0100101 : 7'b0101110; 
               
                3'b111: sseg_reg[7] = (op == 2'b00) ? 7'b0100000 :
                                   (op == 2'b01) ? 7'b0100100 :
                                   (op == 2'b10) ? 7'b0011001 : 
                                   (op == 2'b11) ? 7'b1111000 : 
                                    7'b1111111; 
            endcase
        end
    end
    
        assign AN = ~(8'b00000001 << anode_select); 
        assign sseg = sseg_reg[anode_select];
 
endmodule
