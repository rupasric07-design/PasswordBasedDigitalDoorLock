`timescale 1ns/1ps

module digitalclk_gate_tb;

    reg clk;
    reg rst;
    reg enter;
    reg [3:0] password;

    wire unlock;
    wire locked;
    wire error;

    // Instantiate the synthesized design
    digitalclk dut (
        .clk(clk),
        .rst(rst),
        .enter(enter),
        .password(password),
        .unlock(unlock),
        .locked(locked),
        .error(error)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("digitalclk_gate.vcd");
        $dumpvars(0, digitalclk_gate_tb);

        clk      = 0;
        rst      = 1;
        enter    = 0;
        password = 4'b0000;

        #20;
        rst = 0;

        // Test 1: Correct password (1011)
        #10;
        password = 4'b1011;
        enter = 1;
        #10;
        enter = 0;

        #30;

        // Test 2: Incorrect password
        password = 4'b0101;
        enter = 1;
        #10;
        enter = 0;

        #30;

        $display("Gate-level simulation completed.");
        $finish;
    end

    initial begin
        $monitor("Time=%0t rst=%b enter=%b password=%b unlock=%b locked=%b error=%b",
                 $time, rst, enter, password, unlock, locked, error);
    end

endmodule
