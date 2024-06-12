`timescale 1ns / 1ps


module Decoder_Four_By_Sixteen_TB(

    );
    
    //instantiating testbench inputs and outputs
    reg tbS3, tbS2, tbS1, tbS0, tbE;
    wire tbD15, tbD14, tbD13, tbD12, tbD11, tbD10, tbD9, tbD8, tbD7, tbD6, tbD5, tbD4, tbD3, tbD2, tbD1, tbD0;
    
    //instantiating 4x16 module
    Decoder_Four_By_Sixteen Decoder_Four_By_Sixteen_TB(
        .S3(tbS3), 
        .S2(tbS2), 
        .S1(tbS1), 
        .S0(tbS0),
        .E(tbE),
        
        .D15(tbD15),
        .D14(tbD14),
        .D13(tbD13),
        .D12(tbD12),
        .D11(tbD11),
        .D10(tbD10),
        .D9(tbD9),
        .D8(tbD8),
        .D7(tbD7),
        .D6(tbD6),
        .D5(tbD5),
        .D4(tbD4),
        .D3(tbD3),
        .D2(tbD2),
        .D1(tbD1),
        .D0(tbD0)
        
    );
    
    integer a, b, c, d, e;
    initial
    begin: test
    
    for(a = 0; a < 2; a = a+1)
        begin:ELoop
        #20
        tbE = a;
        
        for(b = 0; b < 2; b = b+1)
            begin: S3Loop
            #20
            tbS3 = b;
            
            for(c = 0; c < 2; c = c+1)
                begin:S2Loop
                #20
                tbS2 = c;
                
                for(d = 0; d < 2; d = d+1)
                    begin:S1Loop
                    #20
                    tbS1 = d;
                    
                    for(e = 0; e < 2; e = e+1)
                        begin:S0Loop
                        #20
                        tbS0 = e;
                        end
                    end
                end
            end
        end
    
    #50
    $finish;
    end
    
endmodule
