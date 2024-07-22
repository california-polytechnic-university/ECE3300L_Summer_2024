module top_tb();
    reg clk, rst, sel, en, updown, load_button;
    reg [3:0] load;
    wire [3:0] digit0, digit1, digit2, digit3;
    wire carry0, carry1, carry2, carry3;
    
    load_counter lc0_inst(
        .clk(clk),
        .rst(rst),
        .en(en),
        .sel(sel),
        .updown(updown),
        .digit(digit0),
        .carry(carry0),
        .load_button(load_button),
        .load(load)
    );
        
    load_counter lc1_inst(
        .clk(clk),
        .rst(rst),
        .en(carry0),
        .sel(sel),
        .updown(updown),
        .digit(digit1),
        .carry(carry1),
        .load_button(load_button),
        .load(load)
    );
        
    load_counter lc2_inst(
        .clk(clk),
        .rst(rst),
        .en(carry1 & carry0),
        .sel(sel),
        .updown(updown),
        .digit(digit2),
        .carry(carry2),
        .load_button(load_button),
        .load(load)
    );
        
    load_counter lc3_inst(
        .clk(clk),
        .rst(rst),
        .en(carry2 & carry1 & carry0),
        .sel(sel),
        .updown(updown),
        .digit(digit3),
        .carry(),
        .load_button(load_button),
        .load(load)
    );
    
    initial
        begin
        clk = 0;
        rst = 1;
        updown = 1;
        sel = 1;
        en = 0;
        load_button = 0;
        load = 4'b0000;
        
        #10 rst = 0;
        #10 en = 1;
        
        #2000;
        #10 updown = 0;
        #10 sel = 0;
        #2000;
        
        #10 en = 0;
        #10 rst = 1;
        #10 rst = 0;
        #10 load = 4'b1111;
        #10 load_button = 1;
        #10 load_button = 0;
        
        #100;
        #10 en = 1;
        #100;        
        #10 en = 0;
        #10 load = 4'b0000;
        #10 rst = 1;
        #50;        
        
        $finish;
        end
        
        always #5 clk = ~clk;
endmodule
