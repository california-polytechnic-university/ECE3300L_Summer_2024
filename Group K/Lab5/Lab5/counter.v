`timescale 1ns / 1ps
module counter(
    input clk,
    input reset,
    input enable,
    input selector,
    input up_down,
    input load,
    input [3:0] numload,
    output reg [3:0] op,
    output reg enable_out
    );
    
    always @(posedge clk or posedge reset)
        begin
            if (reset)
                begin
                    op <= 0;
                end 
                    else
                    if (load)
                        begin
                            op <= numload;
                        end
                        else
                        if (enable)
                            begin
                            case ({selector, up_down})
                                2'b00: //HEX, UP
                                    begin
                                        enable_out <= (op == 14);
                                        op <= (op == 15) ? 4'b0000 : op + 1;
                                    end
                                2'b01: //HEX, DOWN
                                    begin
                                        enable_out <= (op == 1);
                                        op <= (op == 0) ? 4'b1111 : op - 1;
                                    end
                                2'b10: //BCD, UP
                                    begin
                                        enable_out <= (op == 8);
                                        op <= (op == 9) ? 4'b0000 : op + 1;
                                    end
                                2'b11: //BCD, DOWN
                                    begin
                                        enable_out <= (op == 1);
                                        op <= (op == 0) ? 4'b1001 : op - 1;
                                    end
                            endcase
                            end
        end     
endmodule