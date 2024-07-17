module top_tb();
    reg clk, rst, sel, en, updown;
    wire [3:0] digit0, digit1, digit2, digit3;
    //wire [6:0] seg;
    wire carry0, carry1, carry2, carry3;

    up_down_counter udc0_inst(
        .clk(clk),
        .rst(rst),
        .en(en),
        .sel(sel),
        .updown(updown),
        .digit(digit0),
        .carry(carry0)
    );

    up_down_counter udc1_inst(
        .clk(clk),
        .rst(rst),
        .en(carry0),
        .sel(sel),
        .updown(updown),
        .digit(digit1),
        .carry(carry1)
    );
    
    up_down_counter udc2_inst(
        .clk(clk),
        .rst(rst),
        .en(carry1 & carry0),
        .sel(sel),
        .updown(updown),
        .digit(digit2),
        .carry(carry2)
    );
    
    up_down_counter udc3_inst(
        .clk(clk),
        .rst(rst),
        .en(carry2 & carry1 & carry0),
        .sel(sel),
        .updown(updown),
        .digit(digit3),
        .carry()
    );

/* seven_seg ss_inst(
        .inp(digit),
        .seg(seg)
); */

    initial begin
        clk = 0;
        rst = 1;
        updown = 1;
        sel = 1;
        en = 0;
        
        #10 rst = 0;
        #10 en = 1;
        
        #2000;
        #10 updown = 0;
        #10 sel = 0;
        #2000;
        
        $stop;
    end
    
    always #5 clk = ~clk;
endmodule
