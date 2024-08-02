`timescale 1ns / 1ps

module PWM_tb();

reg clk,rst,rload,gload,bload;
reg [12:0]duty;
wire rPWM,gPWM,bPWM;
top_mod u1(.clk(clk),.rst(rst),.rload(rload),.gload(gload),.bload(bload),.duty(duty),.rPWM(rPWM),.gPWM(gPWM),.bPWM(bPWM));

initial begin
    clk=1'b0;
        forever #10 clk=~clk;
    end

initial begin
    rst=1'b1;
     #10
     rst = 1'b0;
    end

initial begin
duty=13'b0000000000000;
rload=1'b0;
gload=1'b0;
bload=1'b0;
#10
rload=1'b1;
#2000
gload=1'b1;
#2000
bload=1'b1;
#2000

duty=13'b00000000001111;
#4000000;

duty=13'b00000011111111;
#4000000;
duty=13'b00111111111111;
end
endmodule
