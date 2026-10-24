module digitalclk (
    clk,
    rst,
    enter,
    password,
    unlock,
    locked,
    error
);

input clk;
input rst;
input enter;
input [3:0] password;

output unlock;
output locked;
output error;
