`timescale 1ns / 1ps

module top(
    input clk,                
    input reset,              
    input mode,
    input enable,
    input direction,        
    input [4:0] speed,          // 5 bit speed control
    output [6:0] sseg,          // output for segments
    output [7:0] AN             // anode signals for seven segment displays
);

    reg [31:0] counter_divider; // counter for clock division
    reg slow_clk;               // slowed down clock for counter      
        
    // clock divider for slow clock
    always @(posedge clk or posedge reset)
        begin
            if(reset)
            begin
                counter_divider <= 32'd0;
                slow_clk <= 1'b0;
            end
        else
        begin
            if(counter_divider >= (32'd100000000 >> speed))
            begin
                counter_divider <= 32'd0;
                slow_clk <= ~slow_clk;
            end
            else
            begin
                counter_divider <= counter_divider + 1;
            end
        end
    end
    
    // seven segment clock divider for display multiplexing
    reg [20:0] clk_divider; 
    always @(posedge clk or posedge reset) begin
        if (reset)
            clk_divider <= 0;
        else
            clk_divider <= clk_divider + 1;
    end

    // instantiate counter for all 4 digits
    wire [3:0] ones, tens, hundreds, thousands; // 4-bit count for bcd output
    wire e0, e1, e2;                            // enable signal per digit rollover

    multi_decade_counter counter0(  // ones digit counter
    .clk(slow_clk),             
    .reset(reset),              
    .mode(mode),                
    .enable(enable),            // enable based on switch
    .direction(direction),      
    .enable_out(e0),            // done signal indicating rollover
    .count(ones)                // output count for ones value
    );

    multi_decade_counter counter1(  // tens digit counter
    .clk(slow_clk),             
    .reset(reset),              
    .mode(mode),                
    .enable(e0),                // enable based on rollover from first digit
    .direction(direction),      
    .enable_out(e1),            // done signal indicating rollover
    .count(tens)                // output count for tens value
    );
    
    multi_decade_counter counter2(  // hundreds digit counter
    .clk(slow_clk),             
    .reset(reset),              
    .mode(mode),                
    .enable(e0 & e1),                // enable based on rollover from first and second digit
    .direction(direction),      
    .enable_out(e2),            // done signal indicating rollover
    .count(hundreds)            // output count for hundreds value
    );
    
    multi_decade_counter counter3(  // thousands digit counter
    .clk(slow_clk),             
    .reset(reset),              
    .mode(mode),                
    .enable(e0 & e1 & e2),                // enable based on rollover from first, second, and third digit
    .direction(direction),      
    .enable_out(),              // done signal indicating rollover
    .count(thousands)           // output count for thousands value
    );
   
   
    // digit select multiplexer for displays
    reg [1:0] digit_select;
    reg [3:0] display_select;   
     
    always @(posedge clk_divider[16] or posedge reset) 
    begin
        if (reset)
            digit_select <= 2'b00;
        else
            digit_select <= digit_select + 1;
    end

    // 7-segment display decoder
    always @(*) 
    begin
        case (digit_select)
            2'b00: display_select = ones;
            2'b01: display_select = tens;
            2'b10: display_select = hundreds;
            2'b11: display_select = thousands;
            default: display_select = 4'b0000;
        endcase
    end
   
    // instantiate hex to seven segment display   
    hex2sseg display(
        .hex(display_select),
        .sseg(sseg)
    );    

    // enable signals for each digit
    assign AN = (digit_select == 2'b00) ? 8'b1111_1110 :
                (digit_select == 2'b01) ? 8'b1111_1101 :
                (digit_select == 2'b10) ? 8'b1111_1011 :
                (digit_select == 2'b11) ? 8'b1111_0111 : 8'b1111_1111;
endmodule
