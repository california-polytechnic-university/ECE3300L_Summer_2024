module InputInterface (
    input [3:0] sw_val1,
    input [3:0] sw_val2,
    input [1:0] sw_op,
    output reg [3:0] num1_bcd,
    output reg [3:0] num2_bcd,
    output reg [2:0] operation
);

// Convert binary to BCD
always @(*) begin
    num1_bcd = (sw_val1 > 4'd9) ? (sw_val1 + 4'd6) : sw_val1;
    num2_bcd = (sw_val2 > 4'd9) ? (sw_val2 + 4'd6) : sw_val2;
end


// Map operation switches to operation code
always @(*) begin
    case (sw_op)
        2'b00: operation = 3'b010; // Addition
        2'b01: operation = 3'b100; // Subtraction
        2'b10: operation = 3'b111; // Multiplication
        default: operation = 3'b000; // Default to no operation
    endcase
end

endmodule