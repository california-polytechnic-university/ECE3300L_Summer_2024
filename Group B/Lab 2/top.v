module top(
            input [13:0] top_sw,
            output [2:0] top_led
            );
            
            
            mux4x1 LEDRED(
                    .mux_inp(top_sw[5:2]),
                    .sel(top_sw[1:0]),
                    .mux_out(top_led[0])
                    );
                    
             mux4x1 LEDGREEN(
                    .mux_inp(top_sw[9:6]),
                    .sel(top_sw[1:0]),
                    .mux_out(top_led[1])
                    );         
                    
                    
               mux4x1 LEDBLUE(
                    .mux_inp(top_sw[13:10]),
                    .sel(top_sw[1:0]),
                    .mux_out(top_led[2])
                    );       
                    
endmodule
