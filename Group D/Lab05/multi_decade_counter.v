module multi_decade_counter(
    input clk,
    input reset,
    input enable,
    input mode,
    input updown,
    input [1:0] an_sel,
    input load,
    input [3:0] load_count,
    output [3:0] count0, count1, count2, count3
    );
    
    wire [3:0] done;
    wire [3:0] a;
    wire ld_en = enable & ~load;
    
    ud_ld_counter D0(
        .clk(clk),
        .reset(reset),
        .enable(ld_en),
        .mode(mode),
        .updown(updown),
        .load(load & (an_sel == 2'd0)),
        .load_count(load_count),
        .done(done[0]),
        .count_out(count0)
    );
    assign a[0] = ld_en & done[0];
    
    ud_ld_counter D1(
        .clk(clk),
        .reset(reset),
        .enable(a[0]),
        .mode(mode),
        .updown(updown),
        .load(load & (an_sel == 2'd1)),
        .load_count(load_count),
        .done(done[1]),
        .count_out(count1)
    );
    assign a[1] = a[0] & done[1];
     
    ud_ld_counter D2(
        .clk(clk),
        .reset(reset),
        .enable(a[1]),
        .mode(mode),
        .updown(updown),
        .load(load & (an_sel == 2'd2)),
        .load_count(load_count),
        .done(done[2]),
        .count_out(count2)
    );
    assign a[2] = a[1] & done[2];
    
   ud_ld_counter D3(
        .clk(clk),
        .reset(reset),
        .enable(a[2]),
        .mode(mode),
        .updown(updown),
        .load(load & (an_sel == 2'd3)),
        .load_count(load_count),
        .done(done[3]),
        .count_out(count3)
    );
    assign a[3] = a[2] & done[3];
    
endmodule