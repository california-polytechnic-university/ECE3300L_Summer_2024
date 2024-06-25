`timescale 1ns / 1ps

module top_tb;
    
    reg [13:0] switch;
    wire [2:0] light;

    
    top NAG (
        .top_sw(switch),
        .top_led(light)
    );

    
    initial begin
       
        switch = 14'b0;

        

        //sel=00
        switch = 14'b00000000000000; //inputs are all 0
        #40;
        switch = 14'b00000000000001; //inputs are 0001
        #40;
        switch = 14'b00000000000010; //inputs are 0010
        #40;
        switch = 14'b00000000000100; //inputs are 0100
        #40;
        switch = 14'b00000000001000; //inputs are 1000
        
        //sel=01
        #40;
        switch = 14'b00000000010000; //inputs are 0001
        #40;
        switch = 14'b00000000100000; //inputs are 0010
        #40;
        switch = 14'b00000001000000; //inputs are 0100
        #40;
        switch = 14'b00000010000000; //inputs are 1000
        #40;

        //sel=10
        switch = 14'b00000100000000; //inputs are 0001
        #40;
        switch = 14'b00001000000000; //inputs are 0010
        #40;
        switch = 14'b00010000000000; //inputs are 0100
        #40;
        switch = 14'b00100000000000; //inputs are 1000
        #40;

        //sel=11
        switch = 14'b01000000000000; //inputs are 0001
        #40;
        switch = 14'b10000000000000; //inputs are 0010
        #40;
        switch = 14'b00000000000000; //inputs are 0100
        #40;
        switch = 14'b11100000000000; //inputs are 1000
        #40

      
         $finish;
    end
endmodule
