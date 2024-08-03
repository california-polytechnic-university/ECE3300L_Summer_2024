module bcd_calculator(
    input [3:0] num1, num2,
    input sign_num1, sign_num2,
    input [1:0] operation,
    output reg [7:0] otp,
    output reg sign
);
    
    reg [7:0] result;
    reg [1:0] sign_otp;

    always @(*) begin
        case(operation)
            2'b00: begin
                result = 0;
                sign_otp = 0;
            end
            // Addition num1 + num2
            2'b01: begin
                if (sign_num1 && sign_num2) begin
                    result = num1 + num2;
                    sign_otp = result ? 1 : 0;
                end
                else if (sign_num1 || sign_num2) begin
                    if (num1 < num2) begin
                        result = num2 - num1;
                        if (sign_num1) begin
                            sign_otp = 0;
                        end else begin
                            sign_otp = 1;
                        end 
                    end else begin
                        result = num1 - num2;
                        if (result == 0)
                            sign_otp = 0;
                        else
                            sign_otp = 1;
                    end 
                end else begin
                    result = num1 + num2;
                    sign_otp = 0;
                end
            end
            // Subtraction num1 - num2
            2'b10: begin
                if (sign_num1 && sign_num2) begin
                    if (num1 > num2) begin
                        result = num1 - num2;
                        sign_otp = 1;
                    end else begin
                        result = num2 - num1;
                        sign_otp = 0;
                    end 
                end else if (sign_num1) begin
                    result = num1 + num2;
                    sign_otp = 1;
                end else if (sign_num2) begin
                    result = num1 + num2;
                    sign_otp = 0;
                end else begin
                    if (num1 < num2) begin
                        result = num2 - num1;
                        sign_otp = 1;
                    end else begin
                        result = num1 - num2;
                        sign_otp = 0;
                    end
                end 
            end
            // Multiplication num1 * num2
            2'b11: begin
                result = num1 * num2;
                if (sign_num1 ^ sign_num2) begin // uses XOR properties to find the sign
                    sign_otp = 1;
                end else begin
                    sign_otp = 0;
                end
            end 
            // Error selection 
            default: begin
                result = 0;
                sign_otp = 2'b11;
            end
        endcase
        
        otp = result;
        sign = sign_otp;
        
        // No sign for zero result
        if (result == 0) begin
            sign = 0;
        end
    end
    
endmodule
