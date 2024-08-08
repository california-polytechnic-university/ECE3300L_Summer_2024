`timescale 1ns / 1ps


module seg7_control(clk_output,reset,dig1,dig2,dig3,dig4,dig5,dig6,dig7,dig8,seg,digit);
input clk_output,reset;
input [3:0]dig1,dig3,dig5,dig6,dig8;
input [1:0]dig7;
input dig2,dig4;
output reg [6:0]seg;
output reg [7:0] digit;

parameter zero  =   7'b0000001;           
parameter one   =   7'b1001111;            
parameter two   =   7'b0010010;            
parameter three =   7'b0000110;          
parameter four  =   7'b1001100;            
parameter five  =   7'b0100100;            
parameter six   =   7'b0100000;            
parameter seven =   7'b0001111;            
parameter eight =   7'b0000000;            
parameter nine  =   7'b0000100;
parameter positive   =   7'b0111010; //positive_alien  
parameter negative   =   7'b1010010; //negative alien  
parameter null  =   7'b1111111; //blank      

reg [2:0] digit_select;
reg [16:0] digit_timer;

always@(posedge clk_output or posedge reset)  //individual segement timer cycles through 8 segments
    begin
        if(reset)
            begin
                digit_select <= 0;
                digit_timer <= 0;
            end
            else if(digit_timer == 99_999)
                begin
                    digit_timer <= 0;
                    digit_select <= digit_select + 1;
                end  
                else 
                    digit_timer <= digit_timer + 1;          
    end
    
 always@*   //selects segment to turn on
    begin
        case(digit_select)
                3'b000 : digit = 8'b11111110;  //dig1 on
                3'b001 : digit = 8'b11111101;  //dig2 on
                3'b010 : digit = 8'b11111011;  //dig3 on
                3'b011 : digit = 8'b11110111;  //dig4 on
                3'b100 : digit = 8'b11101111;  //dig5 on
                3'b101 : digit = 8'b11011111;  //dig6 on
                3'b110 : digit = 8'b10111111;  //dig7 on
                3'b111 : digit = 8'b01111111;  //dig8 on    
                default: digit = 8'b11111111;  //digits all of   
                endcase
    end   
    
 always@*
        case(digit_select)
            3'b000: 
                begin
                        case(dig1)
                            4'b0000: seg = zero ; //0            
                            4'b0001: seg = one  ; //1            
                            4'b0010: seg = two  ; //2            
                            4'b0011: seg = three; //3            
                            4'b0100: seg = four ; //4            
                            4'b0101: seg = five ; //5            
                            4'b0110: seg = six  ; //6            
                            4'b0111: seg = seven; //7            
                            4'b1000: seg = eight; //8            
                            4'b1001: seg = nine ; //9   
                            default: seg = null; //>9
                        endcase   
                   end      
               3'b001: 
               begin
                        case(dig2)
                            1'b0: seg = positive;          
                            1'b1: seg = negative;    
                            default: seg = null;                                
                        endcase
               end   
               3'b010: 
               begin
                         case(dig3)
                            4'b0000: seg = zero ; //0            
                            4'b0001: seg = one  ; //1            
                            4'b0010: seg = two  ; //2            
                            4'b0011: seg = three; //3            
                            4'b0100: seg = four ; //4            
                            4'b0101: seg = five ; //5            
                            4'b0110: seg = six  ; //6            
                            4'b0111: seg = seven; //7            
                            4'b1000: seg = eight; //8            
                            4'b1001: seg = nine ; //9   
                            default: seg = null; //>9
                           endcase   
                end      
               3'b011: 
                begin
                        case(dig4)
                            1'b0: seg = positive;          
                            1'b1: seg = negative;  
                            default: seg = null;                                  
                        endcase   
               end     
               3'b100: begin
                        case(dig5)
                            4'b0000: seg = zero ; //0            
                            4'b0001: seg = one  ; //1            
                            4'b0010: seg = two  ; //2            
                            4'b0011: seg = three; //3            
                            4'b0100: seg = four ; //4            
                            4'b0101: seg = five ; //5            
                            4'b0110: seg = six  ; //6            
                            4'b0111: seg = seven; //7            
                            4'b1000: seg = eight; //8            
                            4'b1001: seg = nine ; //9   
                            default: seg = null; //>9
                        endcase   
                   end      
               3'b101: 
               begin
                    case(dig6)
                            4'b0000: seg = zero ; //0            
                            4'b0001: seg = one  ; //1            
                            4'b0010: seg = two  ; //2            
                            4'b0011: seg = three; //3            
                            4'b0100: seg = four ; //4            
                            4'b0101: seg = five ; //5            
                            4'b0110: seg = six  ; //6            
                            4'b0111: seg = seven; //7            
                            4'b1000: seg = eight; //8            
                            4'b1001: seg = nine ; //9   
                            default: seg = null; //>9                                   
                    endcase
               end   
                    3'b110: 
                        begin
                            case(dig7)
                                2'b00: seg = positive;          
                                2'b01: seg = negative; 
                                2'b10: seg = negative;          
                                2'b11: seg = positive;
                                default: seg = null;
                            endcase   
                        end      
               3'b111: 
                begin
                    case(dig8)
                        2'b00: seg = null;          
                        2'b01: seg = two; 
                        2'b10: seg = four; 
                        2'b11: seg = seven;    
                        default: seg = null;                                
                    endcase   
               end     
               default: seg = null;
            endcase 
endmodule
