module top_tb();
    reg clk_tb;
    reg reset_n_tb;
    reg an_rst_tb;
    reg cnt_rst_tb;
    reg [4:0] cnt_sel_tb;
    reg [1:0] an_sel_tb;
    reg enable_tb;
    reg mode_tb;
    reg updown_tb;
    reg load_tb;
    reg [3:0] load_count_tb;
    wire dp_tb;
    wire [6:0] sseg_tb;
    wire [7:0] AN_tb;
    
    // Instantiate module under test
    top uut(
        .clk(clk_tb),
        .reset_n(reset_n_tb),
        .an_rst(an_rst_tb),
        .cnt_rst(cnt_rst_tb),
        .cnt_sel(cnt_sel_tb),
        .enable(enable_tb),
        .mode(mode_tb),
        .updown(updown_tb),
        .dp(dp_tb),
        .sseg(sseg_tb),
        .AN(AN_tb)   
    );
    
    always
    begin
        #1 clk_tb = ~clk_tb;
    end

    initial
    begin
        clk_tb = 0;
        reset_n_tb = 0;
        an_rst_tb = 1;
        cnt_rst_tb = 1;
        an_sel_tb = 0;
        cnt_sel_tb = 5'd4;
        enable_tb = 1;
        updown_tb = 1;
        load_tb = 0;
        load_count_tb = 0;
        mode_tb = 1;
    end

    initial
    begin
        #2 reset_n_tb = 1; 
        #4 an_rst_tb = 0;
        #16 cnt_rst_tb = 0;
        #800 $finish;
    end
     
endmodule