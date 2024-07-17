module Lab5_tb();
  
    reg clk;
    reg rst;
    reg upDown;
    reg BCDHex;
    reg enable;
    reg [4:0] speed;
    reg [3:0] load;
    reg load_button;
    wire [6:0] cc;
    wire [7:0] an;
    wire odp;

    Lab5 NAG (
        .clk(clk), 
        .rst(rst), 
        .upDown(upDown), 
        .BCDHex(BCDHex), 
        .enable(enable), 
        .speed(speed), 
        .load(load), 
        .load_button(load_button), 
        .cc(cc), 
        .an(an), 
        .odp(odp)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        rst = 1;
        upDown = 1;  
        BCDHex = 0;  
        enable = 0;
        speed = 5'd2;
        load = 4'b0000;
        load_button = 0;

        #50;
        rst = 0;
        enable = 1;
        #100;
        upDown = 1;  
        #100;
        BCDHex = 1;  
        #100;
        load_button = 1;
        load = 4'b0101;  
        #10;
        load_button = 0;
        #100;
        upDown = 0; 
        #100;
        speed = 5'd3;
        #100;
        rst = 1;
        #10;
        rst = 0;
        #100;
        enable = 1;

        #100;
        $finish;
    end
      
endmodule
