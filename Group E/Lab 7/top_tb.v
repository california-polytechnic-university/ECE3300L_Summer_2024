module top_tb ();
    reg clk, rst, load_r, load_g, load_b;
    reg [12:0] duty;
    wire PWM_r, PWM_g, PWM_b;

    rgb_driver pwm_r_inst(
        .clk(clk),
        .rst(rst),
        .load(load_r),
        .duty(duty),
        .PWM(PWM_r)
    );

    rgb_driver pwm_g_inst(
        .clk(clk),
        .rst(rst),
        .load(load_g),
        .duty(duty),
        .PWM(PWM_g)
    );

    rgb_driver pwm_b_inst(
        .clk(clk),
        .rst(rst),
        .load(load_b),
        .duty(duty),
        .PWM(PWM_b)
    );

    initial begin
        clk = 0;
        rst = 1;
        load_r = 0;
        load_g = 0;
        load_b = 0;
        duty = 0;

        #10 rst = 0;

        #10 load_r = 1;
        #10 duty = 13'b0000000001111;
        #500;
        
        #10 load_g = 1;
        #10 duty = 13'b0000000111111;
        #500;
        
        #10 load_b = 1;
        #10 duty = 13'b0000001111111;
        #500;      
        
        $finish;
    end

    always #5 clk = ~clk;

endmodule
