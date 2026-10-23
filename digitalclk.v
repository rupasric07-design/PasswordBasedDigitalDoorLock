`timescale 1ns/1ps
module digitalclk (
input wire clk,
input wire rst,
input wire enter,
input wire [3:0] password,
output reg unlock,
output wire locked,
output reg error
);

parameter [3:0] CORRECT_PASSWORD = 4'b1011;

localparam LOCKED   = 2'b00;
localparam CHECK    = 2'b01;
localparam UNLOCKED = 2'b10;
localparam ERROR    = 2'b11;

reg [1:0] state;
reg [1:0] next_state;
reg [3:0] password_reg;
reg [1:0] attempts;

reg [3:0] unlock_timer;

assign locked = ~unlock;

// Sequential logic: state, password, counters and outputs
always @(posedge clk or posedge rst) begin
    if (rst) begin
        state         <= LOCKED;
        password_reg  <= 4'b0000;
        attempts      <= 2'b00;
        unlock_timer  <= 4'b0000;
        unlock        <= 1'b0;
        error         <= 1'b0;
    end else begin
        state <= next_state;

        case (state)

            LOCKED: begin
                unlock <= 1'b0;
                error  <= 1'b0;

                if (enter)
                    password_reg <= password;
            end

            CHECK: begin
                if (password_reg == CORRECT_PASSWORD) begin
                    attempts     <= 2'b00;
                    unlock_timer <= 4'b0000;
                    unlock       <= 1'b1;
                    error        <= 1'b0;
                end else begin
                    if (attempts < 2'b11)
                        attempts <= attempts + 1'b1;

                    unlock <= 1'b0;
                    error  <= 1'b1;
                end
            end

            UNLOCKED: begin
                error <= 1'b0;

                if (unlock_timer == 4'd9) begin
                    unlock       <= 1'b0;
                    unlock_timer <= 4'b0000;
                end else begin
                    unlock_timer <= unlock_timer + 1'b1;
                    unlock       <= 1'b1;
                end
            end

            ERROR: begin
                unlock <= 1'b0;
            end

            default: begin
                unlock <= 1'b0;
                error  <= 1'b0;
            end

        endcase
    end
end

// Next-state combinational logic
always @(*) begin
    next_state = state;

    case (state)

        LOCKED: begin
            if (enter)
                next_state = CHECK;
        end

        CHECK: begin
            if (password_reg == CORRECT_PASSWORD)
                next_state = UNLOCKED;
            else if (attempts >= 2'b10)
                next_state = ERROR;
            else
                next_state = LOCKED;
        end

        UNLOCKED: begin
            if (unlock_timer == 4'd9)
                next_state = LOCKED;
        end

        ERROR: begin
            if (rst)
                next_state = LOCKED;
            else
                next_state = ERROR;
        end

        default: next_state = LOCKED;

    endcase
end

endmodule
