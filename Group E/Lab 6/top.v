module top(
    input clk,
    input [9:0] sw,
    input [1:0] operation,
    input rst,
    output [6:0] sseg,
    output [7:0] AN
);
    
    wire [3:0] num1 = sw[3:0]; 
    wire sign_num1 = sw[4];
    wire [3:0] num2 = sw[8:5];
    wire sign_num2 = sw[9];
    wire [7:0] result;
    wire sign;
    
    bcd_calculator calculator(
        .num1(num1),
        .num2(num2),
        .sign_num1(sign_num1),
        .sign_num2(sign_num2),
        .operation(operation),
        .otp(result),
        .sign(sign)
    );
    
    wire [3:0] ones = result % 10; 
    wire [3:0] tens = result / 10; 
    
    wire [6:0] sseg_num1, sseg_num2, sseg_ones, sseg_tens, sseg_operation;
    
    bcd2sseg sseg_num1_inst(.bcd(num1), .sseg(sseg_num1));
    bcd2sseg sseg_num2_inst(.bcd(num2), .sseg(sseg_num2));
    bcd2sseg sseg_ones_inst(.bcd(ones), .sseg(sseg_ones));
    bcd2sseg sseg_tens_inst(.bcd(tens), .sseg(sseg_tens));
    bcd2sseg sseg_operation_inst(
        .bcd((operation == 2'b00) ? 4'd2 : 
             (operation == 2'b01) ? 4'd4 : 
             (operation == 2'b10) ? 4'd7 : 4'd0), 
        .sseg(sseg_operation)
    );

    wire [2:0] anode_sel;
    
    clk_div clock_div (
        .clk(clk),
        .rst(rst),
        .anode_sel(anode_sel)
    );
    
    multiplexed_display display (
        .rst(rst),
        .anode_sel(anode_sel),
        .sseg_num1(sseg_num1),
        .sseg_num2(sseg_num2),
        .sseg_ones(sseg_ones),
        .sseg_tens(sseg_tens),
        .sseg_operation(sseg_operation),
        .num1(num1),
        .num2(num2),
        .sign_num1(sign_num1),
        .sign_num2(sign_num2),
        .sign(sign),
        .result(result),
        .sseg(sseg),
        .AN(AN)
    );
    
endmodule
