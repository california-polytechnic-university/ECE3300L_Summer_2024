`timescale 1ns / 1ps

module top(
    input clk,  
    input enable,
    input updown,              
    input reset,              
    input type,        
    input [4:0] speed,
    output [6:0] sseg,
    output [7:0] AN
    );
        
    wire [3:0] onesplace, tensplace, hundredsplace, thousandsplace;
    wire e0, e1, e2;
    reg [31:0] countdivider;
    reg slowmoveclk;
    reg [20:0] clkdivider;
    reg [1:0] selector;
    reg [3:0] outselect; 
        
    always @(posedge clk or posedge reset)
        begin
            if(reset)
            begin
                countdivider <= 32'd0;
                slowmoveclk <= 1'b0;
            end
        else
        begin
            if(countdivider >= (32'd100000000 >> speed))
            begin
                countdivider <= 32'd0;
                slowmoveclk <= ~slowmoveclk;
            end
            else
            begin
                countdivider <= countdivider + 1;
            end
        end
    end
    always @(posedge clk or posedge reset) begin
        if (reset)
            clkdivider <= 0;
        else
            clkdivider <= clkdivider + 1;
    end
    multi_decade_counter counter0(
    .clk(slowmoveclk),             
    .reset(reset),              
    .type(type),                
    .enable(enable),
    .updown(updown),      
    .eout(e0),
    .count(onesplace)
    );
    multi_decade_counter counter1(
    .clk(slowmoveclk),             
    .reset(reset),              
    .type(type),                
    .enable(e0),
    .updown(updown),      
    .eout(e1),
    .count(tensplace)
    );
    multi_decade_counter counter2(
    .clk(slowmoveclk),             
    .reset(reset),              
    .type(type),                
    .enable(e0 & e1),
    .updown(updown),      
    .eout(e2),
    .count(hundredsplace)
    );
    multi_decade_counter counter3(
    .clk(slowmoveclk),             
    .reset(reset),              
    .type(type),                
    .enable(e0 & e1 & e2),
    .updown(updown),      
    .eout(),
    .count(thousandsplace)
    );  
    always @(posedge clkdivider[16] or posedge reset) 
    begin
        if (reset)
            selector <= 2'b00;
        else
            selector <= selector + 1;
    end
    always @(*) 
    begin
        case (selector)
            2'b00: outselect = onesplace;
            2'b01: outselect = tensplace;
            2'b10: outselect = hundredsplace;
            2'b11: outselect = thousandsplace;
            default: outselect = 4'b0000;
        endcase
    end
    hex2sseg display(
        .hex(outselect),
        .sseg(sseg)
    );    
    assign AN = (selector == 2'b00) ? 8'b1111_1110 :
                (selector == 2'b01) ? 8'b1111_1101 :
                (selector == 2'b10) ? 8'b1111_1011 :
                (selector == 2'b11) ? 8'b1111_0111 : 8'b1111_1111;
endmodule
