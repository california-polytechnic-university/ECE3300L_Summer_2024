`timescale 1ns / 1ps

module decoder_4x16_tb();

                reg [3:0] switch;
                wire [15:0] light;

            decoder_4x16 NAG (
                                .sw(switch),
                                .led(light)
                               );

 initial 
      begin
               
        switch = 4'b0000;
        #50;
        
        switch = 4'b0001;
        #50;
        
        switch = 4'b0010;
        #50;
        
        switch = 4'b0011;
        #50;
        
        switch = 4'b0100;
        #50;
        
        switch = 4'b0101;
        #50;
        
        switch = 4'b0110;
        #50;
        
        switch = 4'b0111;
        #50;
        
        switch = 4'b1000;
        #50;
        
        switch = 4'b1001;
        #50;
        
        switch = 4'b1010;  //10
        #50;
        
        switch = 4'b1011;
        #50;
        
        switch = 4'b1100;
        #50;
        
        switch = 4'b1101;
        #50;
        
        switch = 4'b1110;
        #50;
        
        switch = 4'b1111;
        #50;

        $finish;
    end

endmodule
