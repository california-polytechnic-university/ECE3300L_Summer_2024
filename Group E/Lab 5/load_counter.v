module load_counter(
    input clk, rst, en, sel, updown, load_button,
    input [3:0] load,
    output reg [3:0] digit,
    output reg carry
);
    always@(posedge clk or posedge rst)
    begin
        if(rst)
            digit <= 0;
        else if(load_button)
            digit <= load;
        else if(en)
        begin
            digit <= load;
            if(sel && updown) // BCD up logic
                begin
                    carry <= (digit == 8);
                    digit <= (digit == 9) ? 4'b0000 : digit + 1;
                end
                else if(!sel && updown) // Hex up logic
                begin
                     carry <= (digit == 14);
                     digit <= (digit == 15) ? 4'b0000 : digit + 1;
                end
                else if(sel && !updown) // BCD down logic
                begin
                    carry <= (digit == 1);
                    digit <= (digit == 0) ? 4'b1001 : digit - 1;
                end
                else // Hex down logic
                begin
                     carry <= (digit == 1);
                     digit <= (digit == 0) ? 4'b1111 : digit - 1;
                end
        end
    end
endmodule
