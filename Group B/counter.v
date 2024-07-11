`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module counter(
    input clkSignal,
    input upDown,
    input BCDHex,
    input rst, enable,
    output reg [3:0] num,
    output reg enout
    );
    
//    wire [3:0] tmp;

 

    always@(*)
        begin
            if(~rst)
            begin
                if(enable)
                begin
                    if(upDown)
                    begin
                       
                        if(~BCDHex)
                        begin
                            if (num > 4'b1000)
                            enout <= 1'b1;
                            else
                            enout <= 1'b0;
                        end
                        else
                        begin
                            if (num > 4'b1110)
                            enout <= 1'b1;
                            else
                            enout <= 1'b0;
                        end
                    end
                    else
                    begin
                        if(num < 4'b0001)
                        begin
                            enout <= 1'b1;
                            
                        end
                        else
                            enout <= 1'b0;
                    end
                end
            end
        end
    always@(posedge clkSignal or posedge rst)
        begin
            if (rst)
                num <= 0;
            else
            begin
                
                
                    if(enable)
                    begin
                    if (upDown) //up count
                        begin
                            if (~BCDHex)
                                begin
                                    if (num < 4'b1001)
                                        begin
                                        num = num + 1;                              
                                        end
                                    else
                                        begin
                                        num <= 0;                              
                                        end
                                end
                            else
                                begin
                                    num <= num + 1;
                                end
                        end 
                    else // down count
                        begin
                            if(~BCDHex)
                                begin
                                if (num > 0)
                                num <= num - 1;
                                else
                                num <= 4'b1001;
                                end
                           else
                                num <= num - 1;
                        end
                    end
               
            end
        end
    
endmodule
