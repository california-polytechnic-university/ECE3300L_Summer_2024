`timescale 1ns / 1ps

module upcounter(
    input clk,
    input enable,   
    input selector,
    input rst,
    output [3:0] op
    );
    
    reg [3:0] tmp;
    
    always@(posedge clk)
        begin
            if (rst)
                tmp <=0;
            else
              begin
                if (enable)
                begin
                    if (selector)
                        begin
                            if (tmp <9)
                              tmp <=tmp+1;
                            else
                                tmp <=0;
                     end
                 else
                       begin
                            tmp <= tmp+1;
                            end
                      end
                   end
                 end
                
assign op = tmp;
    
    
endmodule
