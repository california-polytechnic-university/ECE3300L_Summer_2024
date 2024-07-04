`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 04:40:55 PM
// Design Name: 
// Module Name: upcounter
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


module upcounter(
            input clk,
            input rst,
            input enable, 
            input selector, 
            output [3:0] op
            
    );
    
            reg [3:0] tmp;
            always@(posedge clk or posedge rst)
                begin
                    if(rst)
                        tmp <= 0;
                    else 
                    begin
                            if(enable)
                            begin
                                if(selector)
                                    begin
                                     if (tmp <9)
                                        tmp <=tmp+1;
                                     else
                                        tmp <=0;
                                    end
                                else 
                                    begin
                                        tmp <= tmp+1;
                                    end     
                            end
                    end   
                end     
                
assign op = tmp;                
                 
endmodule
