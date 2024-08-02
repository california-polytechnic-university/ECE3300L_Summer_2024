`timescale 1ns / 1ps


module PWM_mod #(parameter size= 8)(clk,rst,load,duty,PWM);
input clk,rst,load;
input [size-1:0] duty;
output reg PWM;
reg [size-1:0] count;
reg [size-1:0] duty_load;

    always@(posedge clk or posedge rst)
        begin: counter
            if (rst)
                count<=0;
            else
                count<=count+1;        
        end

    always@(posedge clk or posedge rst)
        begin: compare
            if (rst)
                PWM<= 1'b0;
            else
                if(count<duty_load)
                    PWM<= 1'b1;
                else
                    PWM <=1'b0;        
        end
        
        always@(posedge clk or posedge rst)
        begin
            if (rst)
                duty_load<= 0;
            else
                begin
                    if (load)
                        duty_load <= duty;
                    else
                        duty_load <= duty_load+1;
                end     
        end
endmodule
