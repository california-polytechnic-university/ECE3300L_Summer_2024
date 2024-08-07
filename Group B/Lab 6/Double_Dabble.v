`timescale 1ns / 1ps

module Double_Dabble(
   input [6:0] bin,
   output reg [3:0] num3, num4
   );
   
integer i;
reg [7:0] bcd;	
always @(bin) 
    begin
        bcd=0;		 	
        for (i=0;i<7;i=i+1)
            begin					//Iterate once for each bit in input number
                if (bcd[3:0] > 4) bcd[3:0] = bcd[3:0] + 3;		//If any BCD digit is >= 5, add three
                if (bcd[7:4] > 4) bcd[7:4] = bcd[7:4] + 3;
            bcd = {bcd[7:0],bin[6-i]};				//Shift one bit, and shift in proper bit from input 
            end
    end
always@(bcd)
    begin
        num3 = bcd[7:4];
        num4 = bcd[3:0];
    end
endmodule
