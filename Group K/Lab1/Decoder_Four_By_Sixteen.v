`timescale 1ns / 1ps


module Decoder_Four_By_Sixteen(
    input S3, S2, S1, S0, E,
    output D15, D14, D13, D12, D11, D10, D9, D8, D7, D6, D5, D4, D3, D2, D1, D0
    );

    wire notS3;
    wire notS2;
    wire notS1;
    wire notS0;

    not not3(notS3,S3);
    not not2(notS2,S2);
    not not1(notS1,S1);
    not not0(notS0,S0);

    and and0(D0,notS3,notS2,notS1,notS0,E);   //0000
    and and1(D1,notS3,notS2,notS1,S0,E);      //0001
    and and2(D2,notS3,notS2,S1,notS0,E);      //0010
    and and3(D3,notS3,notS2,S1,S0,E);         //0011
    and and4(D4,notS3,S2,notS1,notS0,E);      //0100
    and and5(D5,notS3,S2,notS1,S0,E);         //0101
    and and6(D6,notS3,S2,S1,notS0,E);         //0110
    and and7(D7,notS3,S2,S1,S0,E);            //0111
    and and8(D8,S3,notS2,notS1,notS0,E);      //1000
    and and9(D9,S3,notS2,notS1,S0,E);         //1001
    and and10(D10,S3,notS2,S1,notS0,E);       //1010
    and and11(D11,S3,notS2,S1,S0,E);          //1011
    and and12(D12,S3,S2,notS1,notS0,E);       //1100
    and and13(D13,S3,S2,notS1,S0,E);          //1101
    and and14(D14,S3,S2,S1,notS0,E);          //1110
    and and15(D15,S3,S2,S1,S0,E);             //1111

endmodule