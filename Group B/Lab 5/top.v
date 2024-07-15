`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk,rst,upDown,BCDHex,enable,
    input [4:0] speed,
    input [3:0] load,
    input load_button,
    output [6:0] cc,
    output reg [7:0] an,
    output odp
    );
    wire signal;
    wire [3:0] number1;
    wire [3:0] number2;
    wire [3:0] number3;
    wire [3:0] number4;
    reg [3:0] number_main;
    wire enChain1,enChain2,enChain3;
    reg [19:0] refresh_counter;
    wire [1:0] LED_activating_counter;
    
    always@(posedge clk)
        begin
            if(rst)
                refresh_counter <= 0;
            else
                refresh_counter <= refresh_counter + 1;
        end
    assign LED_activating_counter = refresh_counter[19:18];
    
   
    assign odp = 1;
    
    always@(*)
        begin
            case(LED_activating_counter)
               2'b00:
                    begin
                        an = 8'b11111110;
                        number_main = number1;
                    end
                1:
                    begin
                        an = 8'b11111101;
                        number_main = number2;
                    end
                2:
                    begin
                        an = 8'b11111011;
                        number_main = number3;
                    end
                3:
                    begin
                        an = 8'b11110111;
                        number_main = number4;
                    end
            endcase
        end
    
    
    
    clockManager MAN(
        .clk(clk),
        .reset(rst),
        .enable(enable),
        .speed(speed),
        .clkSignal(signal) //output
    );
 
    counter DIG1(
        .clkSignal(signal),
        .upDown(upDown),
        .BCDHex(BCDHex),
        .rst(rst),
        .enable(enable),
        .loadBus(load),
        .load_b(load_button),
        .num(number1),
        .enout(enChain1)
    );
    
    counter DIG2(
        .clkSignal(signal),
        .upDown(upDown),
        .BCDHex(BCDHex),
        .rst(rst),
        .enable(enChain1),
        .loadBus(load),
        .load_b(load_button),
        .num(number2),
        .enout(enChain2)
    );
    
    counter DIG3(
        .clkSignal(signal),
        .upDown(upDown),
        .BCDHex(BCDHex),
        .rst(rst),
        .enable(enChain2 && enChain1),
        .loadBus(load),
        .load_b(load_button),
        .num(number3),
        .enout(enChain3)
    );
    
    counter DIG4(
        .clkSignal(signal),
        .upDown(upDown),
        .BCDHex(BCDHex),
        .rst(rst),
        .enable(enChain1 && enChain2 && enChain3),
        .loadBus(load),
        .load_b(load_button),
        .num(number4)
    );
    display SEV(
        .num(number_main),
        .disp(cc)
    );
endmodule


