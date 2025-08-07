// monitoring.v
module monitoring(
    input clk,
    input ir,
    input gas_in,
    input fire,
    input reset,
    input reset1,
    output buzzer,
    output led1,
    output led2,
    output [13:0] count,
    output [7:0] ca,
    output [3:0] an,
    output IN1,
    output IN2,
    output EN
);

    // Instantiate final module
    final f1 (
        .clk(clk),
        .ir(ir),
        .gas_in(gas_in),
        .fire(fire),
        .reset(reset),
        .reset1(reset1),
        .buzzer(buzzer),
        .led1(led1),
        .led2(led2),
        .count(count)
    );

    // Instantiate motor driver control module
    motor m1 (
        .clk(clk),
        .fire_in(fire),
        .IN1(IN1),
        .IN2(IN2)
    );

    // Segment display
    seg_display_mux_4digit display_mux (
        .clk(clk),
        .count(count),
        .ca(ca),
        .an(an)
    );

endmodule

