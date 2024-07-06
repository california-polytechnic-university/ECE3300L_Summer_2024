`timescale 1ns / 1ps

module top_tb;
    
    reg clk_rst;
    reg clk;
    reg enable;
    reg select;
    reg idp;
    reg [4:0] speed;
    wire odp;
    wire [7:0] an;

    top NAG (
        .clk_rst(clk_rst),
        .clk(clk),
        .enable(enable),
        .select(select),
        .idp(idp),
        .speed(speed),
        .odp(odp),
        .an(an)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle clock every 5 time units
    end

    initial begin
    
        clk_rst = 1;
        enable = 0;
        select = 0;
        idp = 0;
        speed = 5'd0;

        #10;
        clk_rst = 0;
      
        enable = 1;
        speed = 5'd1;  

        select = 1;
        #100;
        select = 0;
        #100;

        clk_rst = 1;
        #10;
        clk_rst = 0;
        #10;

        speed = 5'd10;
        #100;
        speed = 5'd15;
        #100;

        $finish;
    end
      
endmodule
