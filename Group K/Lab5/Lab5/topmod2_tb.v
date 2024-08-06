`timescale 1ns / 1ps
//simulation runtime is 10ms
module topmod2_tb;
    reg clk;
    reg selector;
    reg rst;
    reg enable;
    reg up_down;
    reg load;
    reg [3:0]numload;
    wire [3:0] num1, num2, num3, num4;
    wire e1, e2, e3, e4;
    
    counter dut1( 
    .clk(clk),
    .reset(rst),
    .enable(enable),
    .selector(selector),
    .up_down(up_down),
    .load(load),
    .numload(numload),
    .op(num1),
    .enable_out(e1)
      );
   counter dut2( 
    .clk(clk),
    .reset(rst),
    .enable(e1),
    .selector(selector),
    .up_down(up_down),
    .load(load),
    .numload(numload),
    .op(num2),
    .enable_out(e2)
      );
    counter dut3( 
    .clk(clk),
    .reset(rst),
    .enable(e1 & e2),
    .selector(selector),
    .up_down(up_down),
    .load(load),
    .numload(numload),
    .op(num3),
    .enable_out(e3)
      );
    counter dut4( 
    .clk(clk),
    .reset(rst),
    .enable(e1 & e2 & e3),
    .selector(selector),
    .up_down(up_down),
    .load(load),
    .numload(numload),
    .op(num4),
    .enable_out()
      );
    
    
    
    always
        begin
        clk = 0;
        forever #1 clk = ~clk;
        end
    
    initial
        begin
        #10
            rst = 1;
            up_down = 1;
            selector = 0;
            load = 0;
        #50 enable = 0;
        #20 
            rst = 0;
            enable = 1;
        #50 
            up_down = 0;
        #50
            numload = 4'b0101;
            load = 1;
        #20
            load = 0;
        #50
            numload = 4'b0111;
            load = 1;
        #20
            load = 0;
        #50
            numload = 4'b0001;
            load = 1;
        #20
            load = 0;
        #50
            numload = 4'b1011;
            load = 1;
        #20
            load = 0;
        #50
            selector = 1;
        #50 
            rst = 1;
        #50
            rst = 0;
            selector = 0;
        #200000
        $finish;
        end
    
endmodule