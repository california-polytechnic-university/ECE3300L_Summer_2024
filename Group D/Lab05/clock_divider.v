module clock_divider(
    input clk_in,
    input reset,
    input [4:0] cnt_sel,
    input [4:0] an_sel,
    output cnt_clk,
    output an_clk
);
    
    reg [31:0] counter;

   // Clocking block
   always @(posedge clk_in or posedge reset)
   begin
       if (reset)
           counter <= 0;
       else
           counter <= counter + 1;
   end

   // Frequency division logic
   assign cnt_clk = counter[cnt_sel];
   assign an_clk = counter[an_sel];

endmodule