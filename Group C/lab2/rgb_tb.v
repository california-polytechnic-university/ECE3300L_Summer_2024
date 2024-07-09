`timescale 1ns / 1ps

module rgb_tb; 

       reg  [13:0] sw_tb;
       wire [2:0] led_tb;
 top uut
    (
        .SW(sw_tb),
        .LED(led_tb)
        );
    initial
         begin
        #15
        sw_tb = 14'b0000_0100_0000_00; 
        #15 
        sw_tb = 14'b0000_0000_0000_00;
        #15 
        sw_tb = 14'b1000_0000_0000_10;
        #15
         sw_tb = 14'b0000_0000_0010_10;
        #15
        sw_tb = 14'b0000_0000_1000_01;
        #15 
        sw_tb = 14'b1000_0000_1000_01;
        #15
        sw_tb = 14'b1000_1000_0100_00;
        #15
         sw_tb = 14'b0000_1000_1000_00;
        #15
         sw_tb = 14'b0000_0000_0100_00;
        #15
         sw_tb = 14'b0000_0100_0000_01;
        #15
         sw_tb = 14'b0100_0000_0000_01;
        #15
         sw_tb = 14'b0000_0100_0100_01;
        #15
        
        $finish;
    end
       

endmodule