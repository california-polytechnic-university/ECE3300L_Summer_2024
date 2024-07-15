module clock_divider(
        input clk, rst,
        input [4:0] sw,
        output reg clk_out,
        output reg [31:0] counter
        );
        wire [31:0] max;
        assign max = 32'd100000000 >> sw;
        always @ (posedge clk or posedge rst)
        begin
        if (rst == 1)
            begin
                counter <= 0;
                clk_out <= 0;
            end
        else
            begin
                if (counter >= max)
                    begin
                        counter <= 0;
                        clk_out <= ~clk_out;
                    end
                else
                    begin
                    counter <= counter + 1;
                    end
            end
        end
endmodule
