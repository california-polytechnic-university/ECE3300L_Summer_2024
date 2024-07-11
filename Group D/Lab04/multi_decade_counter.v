`timescale 1ns / 1ps

module multi_decade_counter(
    input clk,
    input reset,
    input enable,
    input type, 
    input updown,
    output reg eout,
    output reg [3:0] count
    );
    
    always@(posedge clk, posedge reset)
    begin
        if(reset)
            count <= 0;
        else if(enable)
        begin
                if(!type && !updown)
                begin
                    eout <= (count == 8);
                    count <= (count == 9) ? 4'b0000 : count + 1;
                end
                else if(type && !updown)
                begin
                     eout <= (count == 14);
                     count <= (count == 15) ? 4'b0000 : count + 1;
                end
                else if(!type && updown)
                begin
                     eout <= (count == 1);
                     count <= (count == 0) ? 4'b1001 : count - 1;
                end
                else
                begin
                     eout <= (count == 1);
                     count <= (count == 0) ? 4'b1111 : count - 1;
                end
        end
    end

endmodule

