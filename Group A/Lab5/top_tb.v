`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2024 05:50:01 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb(

    );
    
    reg clk;
    reg reset;
    reg enable;
    reg mode;
    reg direction;
    reg load;
    reg [3:0] load_num;
    
    wire [6:0] sseg;
    wire [3:0] count;
    
    load_counter uut_counter (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .mode(mode),
        .direction(direction),
        .load(load),
        .load_num(load_num),
        .count(count)  
    );
    
        hex2sseg uut_hex2sseg (
        .hex(count),
        .sseg(sseg)
    );
    
    initial 
    begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period clock (100 MHz)
    end

    initial 
    begin     
        reset = 1;      // initial reset
        enable = 0;     // do not start
        mode = 0;       // 0-9
        direction = 0;  // up
        load = 0;
        load_num = 0;

        #10 reset = 0; // no reset

        #10 enable = 1; // enable counter
        
        #200    // let it count for 200ns
        
        #10 reset = 1;      // reset for 10ns
        #10 reset = 0;      // disable reset
        #10 mode = 1;       // 0-F
        #10 direction = 1;  // down
        
        #200    // let it run for another 200ns
        
        #10 load_num = 4'b0111; // set load_num to 7
        #10 load = 1;
        #10 load = 0;
        
        #200    // let it run for another 200ns

        #10 enable = 0; // disable counter
        
        $finish;    // stop
    end
    
endmodule
