module top_module_tb;

    // Inputs
    reg clk;
    reg [9:0] SW;
    reg [1:0] op;
    reg reset;

    // Outputs
    wire [6:0] seg;
    wire [7:0] AN;

    // Instantiate the Unit Under Test (UUT)
    top_module uut (
        .clk(clk),
        .SW(SW),
        .op(op),
        .reset(reset),
        .seg(seg),
        .AN(AN)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // 100 MHz clock (10 ns period)
    end

    // Initial block to apply test vectors
    initial begin
        // Initialize Inputs
        clk = 0;
        SW = 10'b0000000000;
        op = 2'b00;
        reset = 0;

        // Apply reset
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Test Case 1: Test with different switch values
        SW = 10'b0000100011; // a = 00101 (5), b = 00011 (3)
        op = 2'b00; // Operation 2
        #100;

        // Test Case 2: Test with different operation
        op = 2'b01; // Operation 4
        #100;

        // Test Case 3: Test with another set of switch values
        SW = 10'b1100101100; // a = 11001 (25), b = 10110 (22)
        op = 2'b10; // Operation 7
        #100;

        // Test Case 4: Test with reset
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Test Case 5: Test with final values
        SW = 10'b1111100001; // a = 11111 (31), b = 00001 (1)
        op = 2'b11; // Operation 0
        #100;

        // Finish simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("At time %t, AN = %b, seg = %b", $time, AN, seg);
    end

endmodule
