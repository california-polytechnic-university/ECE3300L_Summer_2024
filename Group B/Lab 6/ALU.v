`timescale 1ns / 1ps

module ALU(
    input [1:0] oper,
    input [3:0] num1, num2,
    input num1sign, num2sign,
    output reg outputsign,
    output reg [3:0] show,
    output reg [6:0] binary
    );
 
    
    always@(*)
        begin
            case(oper)
                2'b00://addition
                    begin
                        show = 4'b0010;
                        if (num1sign == num2sign)
                            begin
                                outputsign = num1sign;
                                binary = num1 + num2;
                            end
                        else if (num1sign < num2sign) // num1 is positive, num2 is negative
                            begin
                                if(num1 > num2)
                                    begin
                                    outputsign = num1sign;
                                    binary = num1 - num2;
                                    end
                                else if (num2 > num1)
                                    begin
                                    outputsign = num2sign;
                                    binary = num2 - num1;
                                    end
                            end
                        else if (num2sign > num1sign)//num1 negative, num2 positive
                            begin
                                if(num1 > num2)
                                    begin
                                    outputsign = num1sign;
                                    binary = num2 - num1;
                                    end
                                else if (num2 > num1)
                                    begin
                                    outputsign = num2sign;
                                    binary = num1 - num2;
                                    end
                            end
                    end
                2'b01://subtraction
                    begin
                        show = 4'b0100;
                        if (num1sign == num2sign)
                            begin
                                if(num1 > num2)
                                    begin
                                    outputsign = num1sign;
                                    binary = num1 - num2;
                                    end
                                else if(num2 > num1)
                                    begin
                                    outputsign = ~num1sign;
                                    binary = num2 - num1;
                                    end
                                else //numbers are equal
                                    begin
                                    outputsign = 0;
                                    binary = 0;
                                    end
                            end
                        else //different signs
                            begin
                                if(num1 == 0 && num2 == 0)
                                    begin
                                    outputsign = 0;
                                    binary = 0;
                                    end
                                else
                                    begin
                                    outputsign = num1sign;
                                    binary = num1 + num2;
                                    end
                            end
                    end
                2'b10: //multiplication
                    begin
                        show = 4'b0111;
                        binary = num1 * num2;
                            if(num1sign == num2sign) // same sign
                                outputsign = 0;
                            else
                                outputsign = 1;
                    end
                2'b11: //not necessary
                    begin
                        show = 4'b0000;
                        binary = num1;
                    end
            endcase
     end
    

       
       
endmodule
