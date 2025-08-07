// motor.v
module motor(
    input clk,
    input fire_in,       // fire sensor input
    output reg IN1,
    output reg IN2
);

    always @(posedge clk) begin
        if (fire_in == 0) begin
            // Fire detected: stop motor
            IN1 <= 0;
            IN2 <= 0;
        end else begin
            // No fire: run motor forward
            IN1 <= 1;
            IN2 <= 0;
        end
    end

endmodule

