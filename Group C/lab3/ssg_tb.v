`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2024 04:06:05 PM
// Design Name: 
// Module Name: ssg_tb
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


module ssg_tb(
    
    );
            reg clk_tb,sysrst_tb,en_tb, sel_tb;
            wire [3:0] count_tb; 
            wire [6:0]seg_tb; 
       
      counter X1(
        .clk(clk_tb), 
        .rst(sysrst_tb),
        .enable(en_tb),
        .selector(sel_tb),
        .op(count_tb)
        );
        
        sseg X2(
            .digit(count_tb),
            .a_to_g(seg_tb)
        );
        
         initial
          begin
             clk_tb = 0;
                forever #5 
                clk_tb = ~clk_tb;
        end
        
        initial
        begin
            sysrst_tb = 1;
            en_tb = 0;
            sel_tb = 0;               
       
        #20
            sysrst_tb = 1;
            en_tb = 1;
            sel_tb = 0;  
        
        #20
            sysrst_tb = 1;
            en_tb = 0;
            sel_tb = 1; 
        
        #20 
            sysrst_tb = 0;
            en_tb = 0;
        
        #20
        
        $finish;
        end
endmodule
