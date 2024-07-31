module ClockDivider(
    input clk,           // 100 MHz clock input
    input rst,           // Reset input
    output reg [20:0] slow_clk  // Slower clock output
);

reg [20:0] counter; // Increase the counter size for slower frequency

    always@(posedge clk or posedge rst) begin
        if (rst)
            slow_clk <= 0;
        else
            slow_clk <= slow_clk + 1;
    end

endmodule