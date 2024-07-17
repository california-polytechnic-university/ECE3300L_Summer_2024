module top_tb();
    reg clk;
    reg rst;
    reg upDown;
    reg BCDHex;
    reg enable;
    reg [4:0] speed;
    wire [6:0] cc;
    wire [7:0] an;
    wire odp;

    top NAG (
        .clk(clk), 
        .rst(rst), 
        .upDown(upDown), 
        .BCDHex(BCDHex), 
        .enable(enable), 
        .speed(speed), 
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
        speed = 5'd6;
      
        #50;
        rst = 0;
        enable = 1;
        #50;
        upDown = 1;  
        #100;
        BCDHex = 1;  
        #50;
        upDown = 0;  
        #100;
        speed = 5'd4;
        #100;
        rst = 1;
        #50;
        rst = 0;
        #100;
        enable = 1;
      
        #500;
        $finish;
    end
      
endmodule
