`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2024 09:04:32 PM
// Design Name: 
// Module Name: top
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

module top(
    input clk,
    input sysrst,
    input SWmode,
    input [4:0] speed, 
    input en,
    input up_down,
    input sel,
    output [7:0] AN,
    output [6:0] seg,
    input load,
    input [3:0] load_input      
    );
    reg [31:0] counter_div;
    reg slow_clk;
    wire [3:0] count;
   
   
    wire [3:0] ones, tens, hundreds, thousands;
    wire e0, e1, e2;
    reg [3:0] o_sel; 
//);
     //assign AN = SWmode;
     //(
     //);

     always @(posedge clk or posedge sysrst)
    begin
        if(sysrst)
        begin
            counter_div <= 32'd0;
            slow_clk <= 1'b0;
        end
        else
        begin
            if(counter_div >= (32'd100000000 >> speed))
            begin
            counter_div <= 32'd0;
            slow_clk <= ~slow_clk;
            end
            else
            begin
            counter_div <= counter_div + 1;
            end
        end
    end
     
    reg [20:0] clk_div; 
    always @(posedge clk or posedge sysrst) begin
        if (sysrst)
            clk_div <= 0;
        else
            clk_div <= clk_div + 1;
    end
                
    counter counter0(  
    .clk(slow_clk),             
    .rst(sysrst),              
    .selector(SWmode),                
    .enable(en),            
    .up_down(up_down),  
    .load(load),
    .load_input(load_input),    
    .enable_op(e0),           
    .op(ones)                
    );

    counter counter1(  
    .clk(slow_clk),             
    .rst(sysrst),              
    .selector(SWmode),                
    .enable(e0),                
    .up_down(up_down),  
    .load(load),
    .load_input(load_input),    
    .enable_op(e1),            
    .op(tens)                
    );
    
    counter counter2(  
    .clk(slow_clk),             
    .rst(sysrst),              
    .selector(SWmode),                
    .enable(e0 & e1),              
    .up_down(up_down), 
     .load(load),
    .load_input(load_input),     
    .enable_op(e2),            
    .op(hundreds)           
    );
    
    counter counter3(  
    .clk(slow_clk),             
    .rst(sysrst),              
    .selector(SWmode),                
    .enable(e0 & e1 & e2),                
    .up_down(up_down),      
    .enable_op(),              
    .op(thousands)           
    );
   
    reg [1:0] digit_select;
    reg [3:0] display_select;   
     
    always @(posedge clk_div[16] or posedge sysrst) 
    begin
        if (sysrst)
            digit_select <= 2'b00;
        else
            digit_select <= digit_select + 1;
    end

    always @(*) 
    begin
        case (digit_select)
            2'b00: o_sel = ones;
            2'b01: o_sel = tens;
            2'b10: o_sel = hundreds;
            2'b11: o_sel = thousands;
            default: o_sel = 4'b0000;
        endcase
    end
     
    ssg uut(
        .digit(o_sel),
        .a_to_g(seg)
    );    

    assign AN = (digit_select == 2'b00) ? 8'b1111_1110 :
                (digit_select == 2'b01) ? 8'b1111_1101 :
                (digit_select == 2'b10) ? 8'b1111_1011 :
                (digit_select == 2'b11) ? 8'b1111_0111 :
                 8'b1111_1111;

endmodule