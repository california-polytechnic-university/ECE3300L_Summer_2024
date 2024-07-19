`timescale 1ns / 1ps

module ud_ld_counter(
    input clk,
    input reset,
    input enable,
    input updown,
    input mode, //BCD or Hex
    input load,
    input [3:0] load_count,
    output done,
    output [3:0] count_out
    );

    reg [3:0] count, corrected_count;
    reg done_reg;

   //Counter Logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 4'b0000;
        end
        else if (load)
            count <= load_count;
        else if (enable) begin
            if(mode) //BCD
                if(updown) begin
                    if(count < 9 && count >= 0)
                        count <= count + 1;
                    else
                        count <= 0;
                end
                else begin
                    if(count > 0 && count <= 9)
                        count <= count - 1;
                    else
                        count <= 9;
                end
            else //Hex
                if(updown) begin
                    count <= count + 1;
                end
                else begin
                    count <= count - 1;
                end
        end
    end

    //Done Logic + Correction Logic
    always @(count) begin
        case({mode,updown})
            2'b00: done_reg = (count == 4'h0)? 1 : 0;
            2'b01: done_reg = (count == 4'hf)? 1 : 0;
            2'b10: done_reg = (count == 4'h0)? 1 : 0;
            2'b11: done_reg = (count == 4'h9)? 1 : 0;
            default: done_reg = 0;
        endcase
//        if(mode)
//            corrected_count = count;
//        else
//            corrected_count = (count >= 9) ? count + 6 : count;
    end
   
    // Output logic
    assign done = done_reg;
    assign count_out = count;
   
endmodule
