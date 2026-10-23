`timescale 1ns/1ps

module digitalclk_tb;

reg clk;
reg rst;
reg enter;
reg [3:0] password;

wire unlock;
wire locked;
wire error;

digitalclk dut (
    .clk(clk),
    .rst(rst),
    .enter(enter),
    .password(password),
    .unlock(unlock),
    .locked(locked),
    .error(error)
);

// 10 ns clock period
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Task: submit a password
task submit_password;
    input [3:0] pass;
    begin
        @(negedge clk);
        password = pass;
        enter = 1;

        @(negedge clk);
        enter = 0;

        // Allow the FSM to process the password
        repeat (2) @(negedge clk);
    end
endtask

initial begin
    $dumpfile("door_lock.vcd");
    $dumpvars(0, digitalclk_tb);

    rst = 1;
    enter = 0;
    password = 4'b0000;

    $display("\n===== TEST 1: RESET =====");
    repeat (2) @(negedge clk);
    rst = 0;
    @(negedge clk);

    if (locked && !unlock && !error)
        $display("PASS: Reset state");
    else
        $display("FAIL: Reset state");

    $display("\n===== TEST 2: CORRECT PASSWORD =====");
    submit_password(4'b1011);

    if (unlock && !locked && !error)
        $display("PASS: Correct password unlocks");
    else
        $display("FAIL: Correct password");

    // Wait for automatic relocking.
    // The unlock timer counts clock cycles.
    $display("\n===== TEST 3: AUTOMATIC RELOCK =====");
    wait (locked == 1'b1);
    @(negedge clk);

    if (locked && !unlock)
        $display("PASS: Door relocked");
    else
        $display("FAIL: Automatic relock");

        $display("\n===== TEST 4: WRONG PASSWORD =====");

    @(negedge clk);
    password = 4'b0101;
    enter = 1;

    @(negedge clk);
    enter = 0;

    // Wait for the FSM to evaluate the password.
    @(negedge clk);

    if (locked && !unlock && error)
        $display("PASS: Wrong password detected");
    else
        $display("FAIL: Wrong password");
    
    // Allow the error indication to clear.
    repeat (2) @(negedge clk);

    $display("\n===== TEST 5: RESET AFTER ERROR =====");
    rst = 1;
    @(negedge clk);
    rst = 0;
    @(negedge clk);

    if (locked && !unlock && !error)
        $display("PASS: Reset clears error");
    else
        $display("FAIL: Reset after error");

    $display("\n===== TEST 6: REPEATED WRONG PASSWORDS =====");
    submit_password(4'b0000);
    submit_password(4'b0000);
    submit_password(4'b0000);

    if (locked && !unlock && error &&
        dut.state == 2'b11)
        $display("PASS: Error lockout reached");
    else
        $display("FAIL: Error lockout");

    $display("\n===== TEST 7: RESET CLEARS LOCKOUT =====");
    rst = 1;
    @(negedge clk);
    rst = 0;
    @(negedge clk);

    if (locked && !unlock && !error &&
        dut.state == 2'b00)
        $display("PASS: Reset clears lockout");
    else
        $display("FAIL: Reset did not clear lockout");

    $display("\n===== ALL TESTS FINISHED =====");
    #10;
    $finish;
end

initial begin
    $monitor(
        "Time=%0t clk=%b rst=%b enter=%b password=%b unlock=%b locked=%b error=%b",
        $time, clk, rst, enter, password, unlock, locked, error
    );
end

// Safety timeout: prevents an endless simulation.
initial begin
    #5000;
    $display("FAIL: Simulation timeout");
    $finish;
end

endmodule
