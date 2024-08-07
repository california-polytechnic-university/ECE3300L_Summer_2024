`timescale 1ns / 1ps

module top(
    input clk, rst,
    input [3:0] numberA, numberB,
    input numberAsign, numberBsign,
    input [1:0] operation,
    output reg [6:0] cc,
    output reg [7:0] an,
    output odp
    );
    
    wire [3:0] numOut1, numOut2, numberOperation;
    wire numOutSign;
    reg sign_reg;
    reg [3:0] numInA, numInB;
    reg [3:0] number_main;
    reg [19:0] refresh_counter;
    wire [2:0] LED_activating_counter;
    wire [6:0] cc_tmpreg, cc_tmpreg2;
    wire [6:0] tmp;
    
    always@(numberA)
        begin
            if(numberA > 9)
            numInA = numberA + 6;
            else
            numInA = numberA;
        end
    always@(numberB)
        begin
            if(numberB > 9)
            numInB = numberB + 6;
            else
            numInB = numberB;
        end
    
    
    always@(posedge clk)
        begin
            if(rst)
                    refresh_counter <= 0;
                else
                    refresh_counter <= refresh_counter + 1;
        end
    assign LED_activating_counter = refresh_counter[19:17];
    assign odp = 1;
    
   always@(*)
        begin
            case(LED_activating_counter)
               0:
                    begin
                        an <= 8'b11111110;
                        number_main <= numInB;
                        cc <= cc_tmpreg;
                    end
                1:
                    begin
                        an <= 8'b11111101;
                        sign_reg <= numberBsign;
                        cc <= cc_tmpreg2;
                    end
                2:
                    begin
                        an <= 8'b11111011;
                        number_main <= numInA;
                        cc <= cc_tmpreg;
                    end
                3:
                    begin
                        an <= 8'b11110111;
                        sign_reg <= numberAsign;
                        cc <= cc_tmpreg2;
                    end
                4:
                    begin
                        an <= 8'b11101111;
                        number_main <= numOut2;
                        cc <= cc_tmpreg;
                    end
                5:
                    begin
                        an <= 8'b11011111;
                        number_main <= numOut1;
                        cc <= cc_tmpreg;
                    end
                6:
                    begin
                        an <= 8'b10111111;
                        sign_reg <= numOutSign;
                        cc <= cc_tmpreg2;
                    end
                7:
                    begin
                        an <= 8'b01111111;
                        number_main <= numberOperation;
                        cc <= cc_tmpreg;
                    end
                default:
                    begin
                        an <= 8'b11111111;
                    end
            endcase
        end
 

        ALU MATH(
            .oper(operation),
            .num1(numInA),
            .num2(numInB),
            .num1sign(numberAsign),
            .num2sign(numberBsign),
            .outputsign(numOutSign),
            .show(numberOperation),
            .binary(tmp)
            );

        Double_Dabble bin2BCDdriver(
            .bin(tmp),
            .num3(numOut1),
            .num4(numOut2)
            );
            
        display SEV(
            .num(number_main),
            .disp(cc_tmpreg)
            );
            
        alienSigns SEG(
            .sign(sign_reg),
            .display(cc_tmpreg2)
            );
    
        
    
endmodule
