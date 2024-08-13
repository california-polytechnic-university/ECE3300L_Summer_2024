`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2024 11:49:17 PM
// Design Name: 
// Module Name: bcd
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


module bcd(
        input rst,
        input [4:0] x, y,
        input [1:0] op,
        output reg [7:0] out,
        output reg sign
        );
        
        reg signed [4:0] signedx;
        reg signed [4:0] signedy;
        reg signed [7:0] signedans;
        
        wire [4:0] bcdx;
        wire [4:0] bcdy;
        
        assign bcdx = ( x[3:0] > 4'd9) ? x[3:0] + 4'd6 : x;
        assign bcdy = ( y[3:0] > 4'd9) ? y[3:0] + 4'd6 : y;
        
        always @(*)
            begin
                if(rst)
                    begin
                        out = 8'b00000000; 
                        sign = 1'b0;
            end
                else
            begin
                signedx = x[4] ? -{1'b0, bcdx[3:0]} : {1'b0, bcdx[3:0]};
                signedy = y[4] ? -{1'b0, bcdy[3:0]} : {1'b0, bcdy[3:0]};
            case(op)
                2'b01: signedans = signedx + signedy; 
                2'b10: signedans = signedx - signedy; 
                2'b11: signedans = signedx * signedy; 
                default: signedans = 8'b00000000;
            endcase
            if(signedans < 0)
                begin
                    out = -signedans;
                    sign = 1'b1; 
            end
            else
                begin
                    out = signedans; 
                    sign = 1'b0; 
                end
        end    
    end
endmodule
