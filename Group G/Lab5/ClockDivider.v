module ClockDivider(
    input clk,
    input reset,
    input [4:0] speed_ctrl,
    output wire divided_clk,
    output reg [20:0] sevenseg_clk
);

    reg [31:0] counter;
    wire [31:0] threshhold;
    
    assign threshhold = (1 << speed_ctrl);

    always @(posedge clk or posedge reset) begin
        if (reset)
            counter <= 32'b0;
        else if (counter >= threshhold)
            counter <= 32'b0;
        else
            counter <= counter + 1'b1;
    end
    
    always@(posedge clk or posedge reset) begin
        if (reset)
            sevenseg_clk <= 0;
        else
            sevenseg_clk <= sevenseg_clk + 1;
    end

    assign divided_clk = (counter < (threshhold)) ? 1'b0 : 1'b1;

endmodule