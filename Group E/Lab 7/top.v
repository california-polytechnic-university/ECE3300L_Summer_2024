module top #(parameter size = 13)(
    input clk, rst, load_r, load_g, load_b,
    input [size-1:0] SW,
    output PWM_r, PWM_g, PWM_b   
    );
    
    wire clk_slow, lock, clk_locked;
    
    clk_wiz_0 clk_gen_slow(
    // Clock out ports  
    .clk_out1(clk_slow),
    // Status and control signals               
    .reset(rst), 
    .locked(lock),
    // Clock in ports
    .clk_in1(clk)
    );
    
    assign clk_locked = clk_slow & lock;
    
    rgb_driver #(.r_size(size)) pwm_r(
    .clk(clk_locked),
    .rst(rst),
    .load(load_r),
    .duty(SW),
    .PWM(PWM_r)
    );
    
    rgb_driver #(.r_size(size)) pwm_g(
    .clk(clk_locked),
    .rst(rst),
    .load(load_g),
    .duty(SW),
    .PWM(PWM_g)
    );
    
    rgb_driver #(.r_size(size)) pwm_b(
    .clk(clk_locked),
    .rst(rst),
    .load(load_b),
    .duty(SW),
    .PWM(PWM_b)
    );
    
endmodule
