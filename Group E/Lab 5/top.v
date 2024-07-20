module top(
        input clk, rst, en, sel, updown, load_button,
        input [4:0] sw,
        input [3:0] load,
        output [6:0] seg,
        output [7:0] AN
        );
        
        //wire [3:0] load;
        wire clk_out;
        wire [31:0] counter;
        wire [3:0] digit0, digit1, digit2, digit3;
        wire carry0, carry1, carry2, carry3;
        
        clock_divider clock(
            .clk(clk),
            .rst(rst),
            .sw(sw),
            .clk_out(clk_out),
            .counter(counter)
        );
        
        load_counter lc0(
            .clk(clk_out),
            .rst(rst),
            .en(en),
            .sel(sel),
            .updown(updown),
            .digit(digit0),
            .carry(carry0),
            .load_button(load_button),
            .load(load)
        );
    
        load_counter lc1(
            .clk(clk_out),
            .rst(rst),
            .en(carry0),
            .sel(sel),
            .updown(updown),
            .digit(digit1),
            .carry(carry1),
            .load_button(load_button),
            .load(load)
        );
    
        load_counter lc2(
            .clk(clk_out),
            .rst(rst),
            .en(carry1 & carry0),
            .sel(sel),
            .updown(updown),
            .digit(digit2),
            .carry(carry2),
            .load_button(load_button),
            .load(load)
        );
         load_counter lc3(
            .clk(clk_out),
            .rst(rst),
            .en(carry2 & carry1 & carry0),
            .sel(sel),
            .updown(updown),
            .digit(digit3),
            .carry(),
            .load_button(load_button),
            .load(load)
            );
        
        reg [1:0] selector;
        reg [3:0] op;
        reg [20:0] clk_div;
        
        always @ (posedge clk or posedge rst)
        begin
            if (rst == 1)
                clk_div <= 0;
            else
                clk_div <= clk_div + 1;
        end
    
        always @ (posedge clk_div[16] or posedge rst)
        begin
            if (rst == 1)
                selector <= 2'b00;
            else
                selector <= selector + 1;
        end
    
        always @ (*)
        begin
            case (selector)
                2'b00: op = digit0;
                2'b01: op = digit1;
                2'b10: op = digit2;
                2'b11: op = digit3;
                default: op = 4'b0000;
            endcase
        end
    
        seven_seg display(
            .inp(op),
            .seg(seg)
        );
    
        assign AN = (selector == 2'b00) ? 8'b11111110 :
                    (selector == 2'b01) ? 8'b11111101 :
                    (selector == 2'b10) ? 8'b11111011 :
                    (selector == 2'b11) ? 8'b11110111 : 8'b11111111;
            
endmodule
