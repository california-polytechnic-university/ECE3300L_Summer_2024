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
