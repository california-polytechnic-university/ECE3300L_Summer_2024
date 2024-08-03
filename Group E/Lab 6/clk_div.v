module clk_div(
    input clk,
    input rst,
    output reg [2:0] anode_sel
);
    reg [15:0] clk_div; // Clock divider for sseg display multiplexing
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            clk_div <= 16'd0; // Reset clock divider
            anode_sel <= 3'd0; // Reset anode select
        end else begin
            clk_div <= clk_div + 1; // Increment clock divider
            if (clk_div == 16'd10000) begin 
                clk_div <= 16'd0; // Reset divider
                anode_sel <= anode_sel + 1; // Move to the next display
            end
        end
    end
endmodule
