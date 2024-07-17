module BCDHexCounter(
    input clk,
    input reset,
    input up_down,
    input sel,
    input enable,
    input load,
    input [3:0] initial_value,
    output reg digit_change,
    output reg [3:0] count
);

    always @(posedge clk or posedge reset or posedge load) begin
        if (reset)
            count <= 4'b0000;
        else if (load)
            count <= initial_value;
        else begin
            if (enable) begin
                if (up_down) begin // Up counter
                    if (sel) begin // HEX
                        if (count >= 4'b1110) begin
                            if (count == 4'b1111) begin
                                digit_change <= 0;
                                count <= 4'b0000;
                            end
                            else begin
                                digit_change <= 1;
                                count <= count + 1;
                            end
                        end      
                        else begin
                            digit_change <= 0;
                            count <= count + 1;
                        end
                    end else begin // BCD
                        if (count >= 4'b1000) begin
                            if (count == 4'b1001) begin
                                digit_change <= 0;
                                count <= 4'b0000;
                            end
                            else if (count > 4'b1001) begin
                                digit_change <= 1;
                                count <= 4'b1001;
                            end
                            else begin
                                digit_change <= 1;
                                count <= count + 1;
                            end
                        end
                        else
                            begin
                                digit_change <= 0;
                                count <= count + 1;
                            end
                    end
                end else begin // Down counter
                    if (sel) begin // HEX
                        if (count <= 4'b0001) begin
                            if (count == 4'b0000) begin
                                digit_change <= 0;
                                count <= 4'b1111;
                            end
                            else begin
                                digit_change <= 1;
                                count <= count - 1;
                            end
                        end
                        else begin
                            digit_change <= 0;
                            count <= count - 1;
                        end    
                    end else begin // BCD
                        if (count <= 4'b0001 || count > 4'b1001) begin
                            if (count == 4'b0000 || count > 4'b1001) begin
                                digit_change <= 0;
                                count <= 4'b1001;
                            end
                            else begin
                                digit_change <= 1;
                                count <= count - 1;
                            end
                        end
                        else begin
                            digit_change <= 0;
                            count <= count - 1;
                        end
                    end
                end
            end
        end
    end

endmodule