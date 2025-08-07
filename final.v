// final.v
module final(
    input clk,
    input ir,
    input gas_in,
    input fire,
    input reset,
    input reset1,
    output reg buzzer,
    output reg led1,
    output reg led2,
    output reg [13:0] count
);

    // LED for gas detection
    always @(posedge clk) begin
        led1 <= ~gas_in;
    end

    // Clock divider for 1 Hz pulse
    reg [31:0] count1 = 0;
    reg clk1 = 0;
    always @(posedge clk) begin
        if (count1 == 25000000) begin
            count1 <= 0;
            clk1 <= ~clk1;
        end else begin
            count1 <= count1 + 1;
        end
    end

    // People counter based on IR sensor
    reg countup;
    always @(posedge clk1) begin
        countup <= (ir == 0);
    end

    always @(posedge clk1) begin
        if (reset)
            count <= 0;
        else if (countup && count < 9999)
            count <= count + 1;
    end

    // LED2 for gas and fire alert
    always @(posedge clk) begin
        if (reset1)
            led2 <= 0;
        else if (~gas_in)
            led2 <= 1;
        else
            led2 <= 0;
    end

endmodule

