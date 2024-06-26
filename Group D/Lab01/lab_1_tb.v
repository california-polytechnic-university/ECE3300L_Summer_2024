`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2024 12:20:24 PM
// Design Name: 
// Module Name: dec_tb
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


module dec_tb ();


    reg [3:0] SW;


    wire [15:0] LED;

  
    dec testing (
        .SW(SW), 
        .LED(LED)
    );

    initial begin
       
        SW = 4'b0000;
        #10; 
        
       
        SW = 4'b0000; #10;
        SW = 4'b0001; #10;
        SW = 4'b0010; #10;
        SW = 4'b0011; #10;
        SW = 4'b0100; #10;
        SW = 4'b0101;#10;
        SW = 4'b0110; #10;
        SW = 4'b0111; #10;
        SW = 4'b1000; #10;
        SW = 4'b1001; #10;
        SW = 4'b1010; #10;
        SW = 4'b1011; #10;
        SW = 4'b1100; #10;
        SW = 4'b1101; #10;
        SW = 4'b1110; #10;
        SW = 4'b1111; #10;

   
        SW = 4'bXXXX; #10; 
        
   
        $finish;
    end
      
endmodule
