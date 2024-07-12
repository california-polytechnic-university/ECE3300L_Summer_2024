
module tb_top;
  reg clk;
  reg rst;
  reg en;
  reg mode;
  reg direction;
  reg [4:0] clk_frequency;
  wire [7:0] AN;
  wire [6:0] SEG;


  top uut (
    .clk(clk),
    .rst(rst),
    .en(en),
    .mode(mode),
    .direction(direction),
    .clk_frequency(clk_frequency),
    .AN(AN),
    .SEG(SEG)
  );


  initial clk = 0;
  always #5 clk = ~clk;  

 
  initial begin

    rst = 1;
    en = 0;
    mode = 0;
    direction = 1;
    clk_frequency = 5'b00100;  


    #100;
    rst = 0;
    

    #100;
    en = 1;


    #1000;
    mode = 1;  
    #1000;
    direction = 0;  
    #1000;
    mode = 0;  
    #1000;
    direction = 1;  

    
    #10000;
    $finish;
  end
endmodule
