`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2024 09:57:09 AM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk,
    input [9:0] switches, // 10 switches for two 5-bit signed operands (x, y) 
    input [1:0] operation, // operation switch for add (00), sub (01), and multiply (10)
    input reset_calculator, // reset calculator (not used b/c switch placement overrides)
    output [6:0] sseg, // sseg out
    output [7:0] AN // anode out
    );
    
    wire [4:0] x = switches[4:0]; // first 5 switches for BCD x value
    wire [4:0] y = switches[9:5]; // next 5 switches for BCD y value
    wire [7:0] result; // 8 bit signed result (+81 or -81 max from multiplying bc of BCD)
    wire sign; // sign bit
    
    bcd_calculator calculator( // instantiate bcd calculator
        .x(x),
        .y(y),
        .operation(operation),
        .reset_calculator(reset_calculator),
        .result(result),
        .sign(sign)
    );
    
    wire [3:0] ones = result % 10; // obtain ones place from result for display
    wire [3:0] tens = result / 10; // obtain tens place from result for display
    
    wire [6:0] sseg_x; // x value for sseg 
    wire [6:0] sseg_y; // y value for sseg
    wire [6:0] sseg_ones; // ones value for sseg result
    wire [6:0] sseg_tens; // tens value for sseg result
    wire [6:0] sseg_operation; // operation symbol for sseg display
    
    bcd2sseg sseg_x_inst( // instantiate x value for sseg
        .bcd(x[3:0]),
        .sseg(sseg_x)
    );
    
    bcd2sseg sseg_y_inst( // instantiate y value for sseg
        .bcd(y[3:0]),
        .sseg(sseg_y)
    );
    
    bcd2sseg sseg_ones_inst( // instantiate ones value for sseg result
        .bcd(ones),
        .sseg(sseg_ones)
    );
    
    bcd2sseg sseg_tens_inst( // instantiate tens value for sseg result
        .bcd(tens),
        .sseg(sseg_tens)
    );
    
    bcd2sseg sseg_operation_inst( // instantiate operation for sseg
        .bcd((operation == 2'b00) ? 4'd2 : // display 2 if add
             (operation == 2'b01) ? 4'd4 : // display 4 if sub
             (operation == 2'b10) ? 4'd7 : 4'd0), // display 7 if multiply, blank if (11)
         .sseg(sseg_operation)
    );

    // multiplexed display logic
    reg [6:0] sseg_reg [7:0];

    always @(*) 
    begin
        if (reset_calculator) // reset not functional bc the switches override reset right after
        begin
            sseg_reg[0] = 7'b0000000; // display blank digits
            sseg_reg[1] = 7'b0000000;
            sseg_reg[2] = 7'b0000000;
            sseg_reg[3] = 7'b0000000;
            sseg_reg[4] = 7'b0000000;
            sseg_reg[5] = 7'b0000000;
            sseg_reg[6] = 7'b0000000;
            sseg_reg[7] = 7'b0000000;
        end
        else
        begin
            case (anode_select) // select anode for update
                3'b000: sseg_reg[0] = sseg_x; // value of x
                3'b001: sseg_reg[1] = (x[4]) ? 7'b0100101 : 7'b0101110; // sign of x (alien symbol)
                3'b010: sseg_reg[2] = sseg_y; // value of y
                3'b011: sseg_reg[3] = (y[4]) ? 7'b0100101 : 7'b0101110; // sign of y (alien symbol)
                3'b100: sseg_reg[4] = sseg_ones; // ones value for result on sseg
                3'b101: sseg_reg[5] = sseg_tens; // tens value for result on sseg
                3'b110: sseg_reg[6] = (result == 8'b00000000) ? 7'b1111111 : // blank sign if result is 0
                                      (sign) ? 7'b0100101 : 7'b0101110; // sign of result
                3'b111: sseg_reg[7] = (operation == 2'b00) ? 7'b0100100 : // 2 if add
                                   (operation == 2'b01) ? 7'b0011001 : // 4 if sub
                                   (operation == 2'b10) ? 7'b1111000 : // 7 if multiply
                                    7'b1111111; // default is blank
            endcase
        end
    end

    
    reg [15:0] clk_divider; // clock divider for sseg display multiplexing
    reg [2:0] anode_select; // anode selection counter
    
    always @(posedge clk or posedge reset_calculator) 
    begin
        if (reset_calculator) // reset not functional bc the switches override reset right after
        begin
            clk_divider <= 16'd0;// clear clock divider
            anode_select <= 3'd0; // clear anode select
        end 
        else 
        begin
            clk_divider <= clk_divider + 1; // increase clock divider
            if (clk_divider == 16'd10000) // value for good refresh rate
            begin 
                clk_divider <= 16'd0; // reset clock divider
                anode_select <= anode_select + 1; // increase anode select for display update
            end
        end
    end
    
    // control the anodes to select which display is active
    assign AN = ~(8'b00000001 << anode_select); // activate one display at a time (fast)
    
    // assign current sseg value based on anode select
    assign sseg = sseg_reg[anode_select];
    
endmodule
