`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2024 11:10:44 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
                input clk, rst,
                input [4:0] sw,
                output reg clk_out,
                output reg [31:0] counter
                    );
    //reg [31:0] counter = 0;
    //always @ (posedge clk)
    //begin
        //if (counter < 31)
            //counter <= counter + 1;
        //else
            //begin
                //counter <= 0;
                //clk_out <= ~clk_out;
            //end
    //end
    
    //reg [31:0] counter = 0;
    wire [31:0] max;
    
    assign max = 32'd100000000 >> sw;
    
    always @ (posedge clk or posedge rst)
    begin
    if (rst)
        begin
            counter <= 32'd0;
            clk_out <= 1'b0;
        end
    else
        begin
        //if (counter < max)
            //begin
            //counter <= counter + 1;
            //end
        //else
            //begin
            //counter <= 32'b0;
            //end
        
        if (counter >= max)
            begin
            counter <= 32'd0;
            clk_out <= ~clk_out;
            end
        else
            begin
            counter <= counter + 1;
            end    
        end
     end
endmodule
