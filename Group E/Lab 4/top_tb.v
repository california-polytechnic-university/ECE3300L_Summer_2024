module top_tb();
    reg clk, rst, sel, en, updown;
    reg [4:0] sw;
    //wire [6:0] seg0, seg1, seg2, seg3;
    wire [3:0] digit0, digit1, digit2, digit3;
    //wire [3:0] ones, tens, hundreds, thousands;
    wire clk_div;
    
    clock_divider clk_div_inst(
        .clk(clk),
        .rst(rst),
        .sw(sw),
        .clk_out(clk_div)
    );

up_down_counter udc(
        .clk(clk),
        .rst(rst),
        .en(en),
        .sel(sel),
        .updown(updown),
        .digit0(digit0),
        .digit1(digit1),
        .digit2(digit2),
        .digit3(digit3)
);

 /*   carry_borrow_display cbd(
            .clk(clk), 
            .rst(rst), 
            .en(en), 
            .sel(sel), 
            .updown(updown),
            .ones(ones), 
            .tens(tens), 
            .hundreds(hundreds), 
            .thousands(thousands)
    ); */

/*    seven_seg display0_inst(
        .inp(digit0),
        .seg(seg0)
    );

    seven_seg display1_inst(
        .inp(digit1),
        .seg(seg1)
    );

    seven_seg display2_inst(
        .inp(digit2),
        .seg(seg2)
    );

    seven_seg display3_inst(
        .inp(digit3),
        .seg(seg3)
    );
*/
    initial begin
        // Initial values
        clk = 0;
        rst = 1;
        updown = 1;
        sel = 1;
        en = 0;
        sw = 5'b00000;
        
        // Simulation sequence
        #10 rst = 0;
        #10 en = 1;
        sw = 5'b00111;
        
        //#10 updown = 0;
        #2000;
        #10 updown = 0;
        #10 sel = 0;
        #2000;
        
        $stop;
    end
    
    always #5 clk = ~clk; // Clock generation
endmodule

