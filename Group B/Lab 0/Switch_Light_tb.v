`timescale 1ns / 1ps
module Switch_Light_tb();

    reg [15:0] sw;
    wire [15:0] led;

    Switch_Light NAG (
        .sw(sw),
        .led(led)
    );

    initial begin
        
        sw = 16'h0000;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Apply different values to the switches
        sw = 16'h0001; #100; 
        sw = 16'h0002; #100; 
        sw = 16'h0004; #100; 
        sw = 16'h0008; #100; 
        sw = 16'h0010; #100; 
        sw = 16'h0020; #100; 
        sw = 16'h0040; #100; 
        sw = 16'h0080; #100;
        sw = 16'h0100; #100; 
        sw = 16'h0200; #100; 
        sw = 16'h0400; #100;
        sw = 16'h0800; #100;
        sw = 16'h1000; #100;
        sw = 16'h2000; #100; 
        sw = 16'h4000; #100; 
        sw = 16'h8000; #100; 
    
end
endmodule
