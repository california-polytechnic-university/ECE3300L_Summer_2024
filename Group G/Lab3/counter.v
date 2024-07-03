`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 06:17:02 AM
// Design Name: 
// Module Name: counter
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


module counter(
        input wire clk_count,
        input wire enable_count,
        input wire selector_count,
        input wire reset_count,
        output reg [31:0] count
    );
    
    reg [3:0] temp;
    
    
    always @(posedge clk_count or posedge reset_count) begin
        if (reset_count) 
            count <= 32'b0;
        else 
            begin
                if(enable_count)
                    begin
                        if(selector_count)
                            begin
                                if(count[3:0] < 4'b1001)
                                    count <= count + 1;
                                else
                                    count <= 32'b0;
                            end
                        else
                            count <= count + 1;
                    end
            end
    end
              
endmodule
