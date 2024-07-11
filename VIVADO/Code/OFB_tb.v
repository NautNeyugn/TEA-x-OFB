`timescale 1ns / 1ps

module OFB_tb;

    // Inputs
    reg [63:0] data_in;
    reg [127:0] key;
    reg [63:0] iv;
    reg clk;
    reg reset;

    // Outputs
    wire [63:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    OFB uut (
        .data_in(data_in), 
        .key(key), 
        .iv(iv), 
        .clk(clk), 
        .reset(reset), 
        .data_out(data_out)
    );

    initial begin
        // Initialize Inputs
        data_in = 64'h0123456789abcdef;
        key = 128'h0123456789abcdef0123456789abcdef;
        iv = 64'h0123456789abcdef;
        clk = 0;
        reset = 1;

        // Wait 50 ns for global reset to finish
        #50;
        reset = 0;
        #20;
        $display("Time: %0t, data_in: %h, data_out: %h", $time, data_in, data_out);

        // Add stimulus here
        #50;
        reset = 1;
        #50;
        reset = 0;
        data_in = 64'had463072d1ca97fb;
        #20;
        $display("Time: %0t, data_in: %h, data_out: %h", $time, data_in, data_out);

        // Add stimulus here
        #50;
        reset = 1;
        #50;
        reset = 0;
        data_in = 64'h0011223344556677;
        #20;
        $display("Time: %0t, data_in: %h, data_out: %h", $time, data_in, data_out);
        
        // Add stimulus here
        #50;
        reset = 1;
        #50;
        reset = 0;
        data_in = 64'hac7457261c343c63;
        #20;
        $display("Time: %0t, data_in: %h, data_out: %h", $time, data_in, data_out);
        
    end

    always #10 clk = ~clk;

endmodule