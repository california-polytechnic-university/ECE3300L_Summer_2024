module DisplayController (
    input [3:0] num1_bcd,
    input [3:0] num2_bcd,
    input [7:0] result_bcd,
    input [2:0] operation,
    input sign1,
    input sign2,
    input result_sign,
    output reg [7:0] seg_out,
    output reg [7:0] digit_en,
    input clk,
    input rst_display
);

reg [2:0] current_digit; // 3-bit counter for digit multiplexing
wire [20:0] slow_clk;

// Instantiate Clock Divider
ClockDivider clock_divider (
    .clk(clk),
    .rst(rst_display),
    .slow_clk(slow_clk)
);

// Define segments for BCD digits and signs
reg [7:0] segments [9:0];
reg [7:0] sign_segments [1:0];

initial begin
    // BCD digit segments
    segments[0] = 8'b1100_0000; // 0
    segments[1] = 8'b1111_1001; // 1
    segments[2] = 8'b1010_0100; // 2
    segments[3] = 8'b1011_0000; // 3
    segments[4] = 8'b1001_1001; // 4
    segments[5] = 8'b1001_0010; // 5
    segments[6] = 8'b1000_0010; // 6
    segments[7] = 8'b1111_1000; // 7
    segments[8] = 8'b1000_0000; // 8
    segments[9] = 8'b1001_0000; // 9
// Sign segments
    sign_segments[0] = 8'b1010_1110; // Positive (assumed)
    sign_segments[1] = 8'b1010_0101; // Negative (assumed)
end

always @(posedge slow_clk[16] or posedge rst_display) begin
    if (rst_display) begin
        current_digit <= 3'b000;
        seg_out <= 8'b11111111;
        digit_en <= 8'b11111111;
    end else begin
        current_digit <= current_digit + 1;
        case (current_digit)
            3'b000: begin
                seg_out <= segments[num1_bcd[3:0]];
                digit_en <= 8'b11111110;
            end
            3'b001: begin
                seg_out <= sign_segments[sign1];
                digit_en <= 8'b11111101;
            end
            3'b010: begin
                seg_out <= segments[num2_bcd[3:0]];
                digit_en <= 8'b11111011;
            end
            3'b011: begin
                seg_out <= sign_segments[sign2];
                digit_en <= 8'b11110111;
            end
            3'b100: begin
                seg_out <= segments[result_bcd[3:0]];
                digit_en <= 8'b11101111;
            end
            3'b101: begin
                seg_out <= segments[result_bcd[7:4]];
                digit_en <= 8'b11011111;
            end
            3'b110: begin
                seg_out <= sign_segments[result_sign];
                digit_en <= 8'b10111111;
            end
            3'b111: begin
                case (operation)
                    3'b010: seg_out <= 8'b10100100; // Addition: "2"
                    3'b100: seg_out <= 8'b10011001; // Subtraction: "4"
                    3'b111: seg_out <= 8'b11111000; // Multiplication: "7"
                    default: seg_out <= 8'b11111111; // Blank
                endcase
                current_digit <= 3'b000;
                digit_en <= 8'b01111111;
            end
        endcase
    end
end



endmodule