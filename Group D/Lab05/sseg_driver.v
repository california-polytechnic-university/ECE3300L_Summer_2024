module sseg_driver(
    input clk,
    input reset,
    input [3:0] count0, count1, count2, count3,
    output dp,
    output [6:0] sseg,
    output [7:0] AN
);
    
    reg [1:0] an_counter;
    reg [3:0] current_digit;
    reg [7:0] AN_reg;

    //AN counter logic
    always @(posedge clk) begin
        if (reset) begin
            an_counter <= 0;
        end
        else begin
            an_counter <= an_counter + 1; 
        end
    end
    
    always @(an_counter, count0, count1, count2, count3) begin
        case(an_counter)
            2'b00: begin 
                current_digit = count0;
                AN_reg = 8'b1111_1110; 
            end 
            2'b01: begin
                current_digit = count1;
                AN_reg = 8'b1111_1101;
            end
            2'b10: begin
                current_digit = count2;
                AN_reg = 8'b1111_1011;
            end
            2'b11: begin
                current_digit = count3;
                AN_reg = 8'b1111_0111;
            end
            default: begin
                current_digit = 4'b0000;
                AN_reg = 8'b1111_1111;
            end
        endcase
    end
    
    // Segment Logic
    hex2sseg ssegDec(
        .hex(current_digit),
        .sseg(sseg)
    );

    assign AN = AN_reg;
    assign dp = 1;
                
endmodule