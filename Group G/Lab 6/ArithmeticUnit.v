module ArithmeticUnit (
    input [3:0] num1_bcd,
    input [3:0] num2_bcd,
    input [2:0] operation,
    input sign1,
    input sign2,
    output signed [7:0] result_bcd,
    output result_sign
);

reg [7:0] temp_bcd;
reg [3:0] temp_num1, temp_num2;
reg temp_sign;
            

// Perform operations based on the operation code
always @(*) begin
    case (operation)
        3'b010: begin // Addition
            if(sign1 && sign2)
                temp_bcd = (num1_bcd*-1) + (num2_bcd*-1);
            else if(sign1 && !sign2)
                temp_bcd = (num1_bcd*-1) + num2_bcd;
            else if(!sign1 && sign2)
                temp_bcd = num1_bcd + (num2_bcd*-1);
            else
                temp_bcd = num1_bcd + num2_bcd;
        end
        3'b100: begin // Subtraction
            if(sign1 && sign2)
                temp_bcd = (num2_bcd*-1) - (num1_bcd*-1);
            else if(sign1 && !sign2)
                temp_bcd = num2_bcd + (num1_bcd);
            else if(!sign1 && sign2)
                temp_bcd = (num2_bcd) + (num1_bcd);
            else
                temp_bcd = num2_bcd - num1_bcd;
        end
        3'b111: begin // Multiplication               
            temp_bcd = num1_bcd * num2_bcd;
        end
        default: begin
            temp_bcd = 8'b00000000;
            temp_sign <= 1'b0;
        end
    endcase
    

    if ((operation == 3'b111) && (sign1 != sign2))
        begin
            temp_sign <= 1'b1;
        end
    else if ((operation == 3'b100) && (sign1) && (!sign2))
            temp_sign <= 1'b0;
    else if ((operation == 3'b100) && (!sign1) && (sign2))
            temp_sign <= 1'b1;
    else if(temp_bcd > 200)
        begin
            temp_bcd = ~(temp_bcd - 1'b1);
            temp_sign <= 1'b1;
        end
    else
        begin
            temp_sign <= 1'b0;
        end
end

assign result_sign = temp_sign;
assign result_bcd[7:4] = (temp_bcd/10) % 10;
assign result_bcd[3:0] = temp_bcd % 10;

endmodule