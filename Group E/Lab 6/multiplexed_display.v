module multiplexed_display(
    input rst,
    input [2:0] anode_sel,
    input [6:0] sseg_num1,
    input [6:0] sseg_num2,
    input [6:0] sseg_ones,
    input [6:0] sseg_tens,
    input [6:0] sseg_operation,
    input [3:0] num1,
    input [3:0] num2,
    input sign_num1,
    input sign_num2,
    input sign,
    input [7:0] result,
    output [6:0] sseg,
    output [7:0] AN
);
    reg [6:0] sseg_reg [7:0]; // Array of 8 elements, 7 bits wide

    always @(*) begin
        if (rst) begin
          sseg_reg[0] = 7'b0000000; // Display blank digits if reset button pushed
            sseg_reg[1] = 7'b0000000;
            sseg_reg[2] = 7'b0000000;
            sseg_reg[3] = 7'b0000000;
            sseg_reg[4] = 7'b0000000;
            sseg_reg[5] = 7'b0000000;
            sseg_reg[6] = 7'b0000000;
            sseg_reg[7] = 7'b0000000;
        end else begin
            case (anode_sel) // Select anode for update
                3'b000: sseg_reg[0] = sseg_num1; // Value of num1
                3'b001: sseg_reg[1] = (sign_num1) ? 7'b0100101 : 7'b0101110; // Sign of num1
                3'b010: sseg_reg[2] = sseg_num2; // Value of num2
                3'b011: sseg_reg[3] = (sign_num2) ? 7'b0100101 : 7'b0101110; // Sign of num2
                3'b100: sseg_reg[4] = sseg_ones; // Ones value for result on sseg
                3'b101: sseg_reg[5] = sseg_tens; // Tens value for result on sseg
                3'b110: sseg_reg[6] = (result == 8'b00000000) ? 7'b1111111 : // Blank sign if result is 0
                                      (sign) ? 7'b0100101 : 7'b0101110; // Sign of result
                3'b111: sseg_reg[7] = sseg_operation; // Operation symbol (2, 4, 7)
            endcase
        end
    end

    // Selects which display to show
    assign AN = ~(8'b00000001 << anode_sel); // Activate one display at a time

    // Assign current seven segment value to active display
    assign sseg = sseg_reg[anode_sel];
endmodule
