module pwm    
#(parameter R = 13)(
    input clk,
    input reset_n,
    input [R - 1:0] duty,
    output pwm_out
    );
    

    reg [R - 1:0] Q_reg, Q_next;
    
    always @(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            Q_reg <= 'b0;
        else
            Q_reg <= Q_next;
    end
    

    always @(*)
    begin
        Q_next = Q_reg + 1;
    end
    

    assign pwm_out = (Q_reg < duty);
endmodule
