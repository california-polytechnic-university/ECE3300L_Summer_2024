`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2024 12:53:57 PM
// Design Name: 
// Module Name: alu_circuit
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


module alu_circuit(
    input clk,
    input reset,
    input [1:0] op,
    input [3:0] A,
    input signA,
    input signB,
    input [3:0] B,
    output reg [6:0] sseg,
    output reg [7:0] an,
    output wire dp
    );
     wire [11:0] final_C;
     reg signC;
    // wire [7:0] binary;
     reg[3:0] hundreds;
     reg[3:0] tens;
     reg[3:0] ones;
    assign dp = 1'b1;
    reg[3:0] digit;
    reg[3:0] special_digit;
    reg[3:0] op_digit;
    wire[2:0] s;
    reg[20:0] clk_div;
    assign s = clk_div[20:18];
    reg [7:0] temp_C;
    reg [7:0] aen = 8'b0;
    always@(posedge clk, posedge reset)
    begin
        if(reset)
            clk_div <= 0;
        else
            clk_div <= clk_div + 1;        
    end
    
    always@(*) 
    begin
        case(op)
        2'b00 : 
         begin
            temp_C = 0;
         end   
        2'b01 : 
         begin
            if(signA == signB)
            begin
                temp_C = A + B;
                if(signA == 1'b0 && signB == 1'b0)
                    signC = 1'b0;
                else if(signB == 1 && signA == 1)
                    signC = 1'b1;
            end
           else
            begin
                if((signA == 1'b1 && signB == 1'b0) && (A <= B))
                begin
                    temp_C = B - A;
                    signC = 1'b0;
                end
                else if((signA == 1'b1 && signB == 1'b0) && (A >= B))
                begin
                    temp_C = A - B;
                    signC = 1'b1;
                end
                else if((signA == 1'b0 && signB == 1'b1) && (A <= B))
                begin
                    temp_C = B - A;
                    signC = 1'b1;
                end
                else if((signA == 1'b0 && signB == 1'b1) && (A >= B))
                begin
                    temp_C = A - B;
                    signC = 1'b0;
                end
            end
         end
       2'b10 :
        begin
            if(signA == 1'b0 && signB == 1'b0)
                begin
                    if(A >= B)
                    begin
                        temp_C = A - B;
                        signC = 1'b0;
                    end
                    else
                    begin
                        temp_C = B - A;
                        signC = 1'b1;
                    end
                end
            else if( signA == 1'b1 && signB == 1'b1)
                begin
                    if(B >= A)
                    begin
                        temp_C = B - A;
                        signC = 1'b0;
                    end
                    else
                    begin 
                        temp_C = A - B;
                        signC = 1'b1;
                    end 
                end
            else if( signA == 1'b1 && signB == 1'b0)
                begin
                    temp_C = A + B;
                    signC = 1'b1;
                end
            else
                begin
                    temp_C = A + B;
                    signC = 1'b0;
                end
        end
        
       2'b11 : 
       begin
                temp_C = A*B;
                signC = signA ^ signB;
                           
        end
       
       default: temp_C = 0;
        endcase        
    end
//    assign binary = temp_C;
    
    integer i;
    always@(temp_C)
    begin
        hundreds = 4'd0;
        tens = 4'd0;
        ones = 4'd0;
        
        for(i = 7; i >= 0; i = i-1)
        begin
            if(hundreds >=5)
                hundreds = hundreds + 3;
            if(tens >=5)
                tens = tens + 3;
            if(ones >=5)
                ones = ones + 3;    
                //shift each output left one bit
           hundreds = hundreds << 1;
           hundreds[0] = tens[3];
           tens = tens << 1;
           tens[0] = ones[3];
           ones = ones << 1;
           ones[0] = temp_C[i];
       end
    end
    
  assign final_C = {hundreds,tens,ones};
 
 reg is_special;
 reg is_op;

  always@(*)
  begin
  is_special = 1'b0;
  is_op = 1'b0;
  digit = 4'b0;
  
    case(s)
    0: digit = A;
    1: begin
        is_special = 1'b1;
        special_digit = signA;
        end
    2: digit = B;
    3: begin
        is_special = 1'b1;
        special_digit = signB;
        end
    4: digit = final_C[3:0];
    5: digit = final_C[7:4];
    6: begin
        is_special = 1'b1;
        special_digit = signC;
        end
    7: begin
        is_op = 1'b1;
        op_digit = op;
        end
    default: digit = 4'bz;
    endcase
  end
  
always @(*) begin
   if(is_special)
   begin
    case(special_digit)
        1'b0: sseg = 7'b0101110; //plus sign
        1'b1: sseg = 7'b0100101; //minus sign
        default: sseg = 7'bzzzzzzz;
    endcase
   end
   else if(is_op)
   begin
    case(op_digit)
        0: sseg = 7'b1000000;
        1: sseg = 7'b0100100;
        2: sseg = 7'b0011001;
        3: sseg = 7'b1111000;
        default: sseg = 7'bzzzzzzz;
    endcase
   end
   else
   begin
    case(digit)
    // Decode regular digits
        0: sseg = 7'b1000000;
        1: sseg = 7'b1111001;
        2: sseg = 7'b0100100;
        3: sseg = 7'b0110000;
        4: sseg = 7'b0011001;
        5: sseg = 7'b0010010;
        6: sseg = 7'b0000010;
        7: sseg = 7'b1111000;
        8: sseg = 7'b0000000;
        9: sseg = 7'b0010000;
        10: sseg = 7'b1000000;
        11: sseg = 7'b1111001;
        12: sseg = 7'b0100100;
        13: sseg = 7'b0110000;
        14: sseg = 7'b0011001;
        15: sseg = 7'b0010010;
        default: sseg = 7'bzzzzzzz;
    endcase
    end
  end
  
  always @(*) begin
        if(reset)
               an = 8'b11111111; 
        else
        begin
            an = 8'b11111111;  // All displays off by default
            an[s] = 1'b0;  // Enable the current display
            if(final_C == 0)
            an[6] = 1'b1;
        end
    end
   

endmodule

