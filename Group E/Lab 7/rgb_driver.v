module rgb_driver #(parameter r_size = 8)(
    input clk, rst, load,
    input [r_size-1:0] duty,
    output reg PWM
    );
    
    reg [r_size-1:0] r_count, duty_load;
    
    always @ (posedge clk or posedge rst)
        begin: r_counter
        if (rst == 1)
            r_count <= 0;
        else
            r_count <= r_count + 1;
        end
        
    always @ (posedge clk or posedge rst)
        begin: comparator
        if (rst == 1)
            PWM <= 0;
        else
            if (r_count < duty_load)
                PWM <= 1;
            else 
                PWM <= 0;
        end
        
        always @ (posedge clk or posedge rst)
            begin
            if (rst == 1)
                duty_load <= 0;
            else
                if (load == 1)
                    duty_load <= duty;
                else
                    duty_load <= duty_load + 1;
            end
    
endmodule
