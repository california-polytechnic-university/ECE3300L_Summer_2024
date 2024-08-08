module top_tb();

  parameter WIDTH = 13;  
    reg clk;
    reg reset;
    reg load;
    reg [2:0] color_select;
    reg [12:0] duty_cycle_switches;
    wire [2:0] rgb_leds;
    
    topv2 NAG (
        .clk(clk),
        .rst(reset),
        .load(load),
        .rgb_select(color_select),
        .cycle_sw(duty_cycle_switches),
        .rgb_led(rgb_leds)
    );
    

    always begin
        #5 clk = ~clk; 
    end
    
    initial begin
        clk = 0;
        reset = 1;
        load = 0;
        color_select = 3'b000;
        duty_cycle_switches = 13'b0;
        #10;
        
        reset = 1;
        #10;
        reset = 0;
        #10;
        
        duty_cycle_switches = 13'b0000100000000; 
        color_select = 3'b001; 
        load = 1;
        #10;
        load = 0;
        #100;
        
        duty_cycle_switches = 13'b0001000000000; 
        color_select = 3'b010; 
        load = 1;
        #10;
        load = 0;
        #100;
        
        duty_cycle_switches = 13'b0010000000000;
        color_select = 3'b100; 
        load = 1;
        #10;
        load = 0;
        #100;
        
        duty_cycle_switches = 13'b0000000000000; 
        color_select = 3'b000; 
        load = 1;
        #10;
        load = 0;
        #100;
        
        $finish;
    end
    
endmodule
