`timescale 1ns / 1ps

module clk_speed(clk,reset,count,sw,clk_adjust);
input clk,reset;
input [4:0]sw;
output wire clk_adjust;
output wire [31:0]count; 
    reg [31:0]temp;
        always @(posedge clk or posedge reset)
            begin
                if(reset)
                    temp<=0;
                else
                    temp<=temp+1;
            end
assign count=temp;
reg temp2;
        always @(sw or reset)
        if (reset)
            temp2<=0;
                else
                    begin
                            case(sw)
                                5'b00000: temp2<=count[31];
                                5'b00001: temp2<=count[30];
                                5'b00010: temp2<=count[29];
                                5'b00011: temp2<=count[28];
                                5'b00100: temp2<=count[27];
                                5'b00101: temp2<=count[26];
                                5'b00110: temp2<=count[25];
                                5'b00111: temp2<=count[24];
                                5'b01000: temp2<=count[23];
                                5'b01001: temp2<=count[22];
                                5'b01010: temp2<=count[21];
                                5'b01011: temp2<=count[20];
                                5'b01100: temp2<=count[19];
                                5'b01101: temp2<=count[18];
                                5'b01110: temp2<=count[17];
                                5'b01111: temp2<=count[16];
                                5'b10000: temp2<=count[15];
                                5'b10001: temp2<=count[14];
                                5'b10010: temp2<=count[13];   
                                5'b10011: temp2<=count[12];
                                5'b10100: temp2<=count[11]; 
                                5'b10101: temp2<=count[10];
                                5'b10110: temp2<=count[9];
                                5'b10111: temp2<=count[8];
                                5'b11000: temp2<=count[7];
                                5'b11001: temp2<=count[6];
                                5'b11010: temp2<=count[5];
                                5'b11011: temp2<=count[4];
                                5'b11100: temp2<=count[3];
                                5'b11101: temp2<=count[2];
                                5'b11110: temp2<=count[1];
                                5'b11111: temp2<=count[0];
                            endcase
                  end
 assign clk_adjust=temp2;  
endmodule
