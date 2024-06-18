module mux4x1(
    input [3:0] mux_inp,
    input [1:0] sel,
    output mux_out
    );
    
    wire [5:0] tmp;
    
    not (tmp[5], sel[0]);
    not (tmp[4], sel[1]);
    and (tmp[3], tmp[5], tmp[4], mux_inp[0]);
    and (tmp[2], tmp[5], sel[1], mux_inp[1]);
    and (tmp[1], sel[0], tmp[4], mux_inp[2]);
    and (tmp[0], sel[0], sel[1], mux_inp[3]);
    or (mux_out, tmp[3], tmp[2], tmp[1], tmp[0]); 
    
endmodule
