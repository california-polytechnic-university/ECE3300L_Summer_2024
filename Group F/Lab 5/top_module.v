`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/17/2024 04:00:50 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input clk,                
    input rst,              
    input selector,
    input enable,
    input dir, 
    input load,
    input [3:0] load_num,       
    input [4:0] speed,          
    output [6:0] seg,          
    output [7:0] AN            
);

    reg [31:0] slow_clk_counter; 
    reg slow_clk;              
         
    // Clock divider for slow clock
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            slow_clk_counter <= 32'd0;
            slow_clk <= 1'b0;
        end else begin
            if (slow_clk_counter >= (32'd100000000 >> speed)) begin
                slow_clk_counter <= 32'd0;
                slow_clk <= ~slow_clk;
            end else begin
                slow_clk_counter <= slow_clk_counter + 1;
            end
        end
    end
    
    // Seven segment clock divider for display multiplexing
    reg [20:0] display_clk_counter; 
    always @(posedge clk or posedge rst) begin
        if (rst)
            display_clk_counter <= 0;
        else
            display_clk_counter <= display_clk_counter + 1;
    end
    

    // Upcounter instances for digits
    wire [3:0] ones_count, tens_count, hundreds_count, thousands_count; 
    wire enable_0, enable_1, enable_2;                            

    upcounter upcounter_inst0(  
        .clk(slow_clk),             
        .rst(rst),              
        .selector(selector),                
        .enable(enable),            
        .dir(dir),      
        .load(load),
        .load_num(load_num),
        .enable_out(enable_0),            
        .tmp(ones_count)                
    );

    upcounter upcounter_inst1(  
        .clk(slow_clk),             
        .rst(rst),              
        .selector(selector),                
        .enable(enable_0),                
        .dir(dir),      
        .load(load),
        .load_num(load_num),
        .enable_out(enable_1),            
        .tmp(tens_count)                
    );
    
    upcounter upcounter_inst2(  
        .clk(slow_clk),             
        .rst(rst),              
        .selector(selector),                
        .enable(enable_0 & enable_1),                
        .dir(dir),      
        .load(load),
        .load_num(load_num),
        .enable_out(enable_2),            
        .tmp(hundreds_count)            
    );
    
    upcounter upcounter_inst3(  
        .clk(slow_clk),             
        .rst(rst),              
        .selector(selector),                
        .enable(enable_0 & enable_1 & enable_2),                
        .dir(dir),
        .load(load),      
        .load_num(load_num),
        .enable_out(),              
        .tmp(thousands_count)           
    );
   
    // Digit select multiplexer for displays
    reg [1:0] digit_mux_select;
    reg [3:0] display_value;   
    
    // Instantiate BCD to seven segment display   
    bcd_to_7seg bcd_to_7seg_inst (
        .bcd(display_value),
        .seg(seg)
    );   

    always @(posedge display_clk_counter[16] or posedge rst) begin
        if (rst)
            digit_mux_select <= 2'b00;
        else
            digit_mux_select <= digit_mux_select + 1;
    end

    // 7-segment display decoder
    always @(*) begin
        case (digit_mux_select)
            2'b00: display_value = ones_count;
            2'b01: display_value = tens_count;
            2'b10: display_value = hundreds_count;
            2'b11: display_value = thousands_count;
            default: display_value = 4'b0000;
        endcase
    end
    

    assign AN = (digit_mux_select == 2'b00) ? 8'b1111_1110 :
                (digit_mux_select == 2'b01) ? 8'b1111_1101 :
                (digit_mux_select == 2'b10) ? 8'b1111_1011 :
                (digit_mux_select == 2'b11) ? 8'b1111_0111 : 8'b1111_1111;

endmodule
