module upcounter(
    input clk,
    input rst,
    input enable,
    input selector,
    input dir,
    output reg enable_out,
    output reg [3:0] tmp
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tmp <= 4'b0000;
            enable_out <= 1'b0;
        end else if (enable) begin
            // Control logic based on selector and direction
            case({selector, dir})
                2'b00: begin // BCD and up
                    enable_out <= (tmp == 4'b1000);
                    tmp <= (tmp == 4'b1001) ? 4'b0000 : tmp + 1;
                end
                2'b01: begin // Hex and up
                    enable_out <= (tmp == 4'b1110);
                    tmp <= (tmp == 4'b1111) ? 4'b0000 : tmp + 1;
                end
                2'b10: begin // BCD and down
                    enable_out <= (tmp == 4'b0001);
                    tmp <= (tmp == 4'b0000) ? 4'b1001 : tmp - 1;
                end
                2'b11: begin // Hex and down
                    enable_out <= (tmp == 4'b0001);
                    tmp <= (tmp == 4'b0000) ? 4'b1111 : tmp - 1;
                end
                default: begin // Default case
                    enable_out <= 1'b0;
                end
            endcase
        end
    end

endmodule
