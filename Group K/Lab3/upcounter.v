`timescale 1ns / 1ps

module upcounter(clk,reset,enable,selector,op);
input clk,reset,enable,selector;
output wire [3:0]op;
reg [3:0] temp;

always @(posedge clk or posedge reset)
    begin
        if(reset) 
            temp<=0;
        else
            begin
                if(enable)
                    begin
                        if(selector)
                            begin
                                if(temp<9)
                                    temp<=temp+1;                              
                                 else
                                    temp<=0;
                            end
                         else
                            begin
                                temp<=temp+1;
                            end
                    end 
            end       
    end
 assign op=temp;
endmodule
