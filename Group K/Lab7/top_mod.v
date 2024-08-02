`timescale 1ns / 1ps

module top_mod #(parameter size=13)(clk,rst,rload,gload,bload,duty,rPWM,gPWM,bPWM);
input clk,rst,rload,gload,bload;
input [size-1:0]duty;
output rPWM,gPWM,bPWM;
wire slow_clk,lock,locked_clk;

clk_wiz_0 CLK_GEN_SLOW (.clk_out1(slow_clk),.reset(rst),.locked(lock),.clk_in1(clk));

assign locked_clk= slow_clk & lock;

PWM_mod #(.size(size)) red(.clk(locked_clk),.rst(rst),.load(rload),.duty(duty),.PWM(rPWM));
PWM_mod #(.size(size)) green(.clk(locked_clk),.rst(rst),.load(gload),.duty(duty),.PWM(gPWM));
PWM_mod #(.size(size)) blue(.clk(locked_clk),.rst(rst),.load(bload),.duty(duty),.PWM(bPWM));

endmodule

