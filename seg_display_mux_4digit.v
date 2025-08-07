// seg_display_mux_4digit.v
module seg_display_mux_4digit(
    input clk,
    input [13:0] count,
    output reg [7:0] ca,
    output reg [3:0] an
);

    reg [1:0] digit_sel = 0;
    wire [3:0] d0, d1, d2, d3;
    wire [7:0] ca0, ca1, ca2, ca3;

    // Split count into digits
    assign d0 = count % 10;
    assign d1 = (count / 10) % 10;
    assign d2 = (count / 100) % 10;
    assign d3 = (count / 1000) % 10;

    // Use seg_encoder to get 7-segment codes
    seg_encoder seg0_enc(.val(d0), .ca(ca0));
    seg_encoder seg1_enc(.val(d1), .ca(ca1));
    seg_encoder seg2_enc(.val(d2), .ca(ca2));
    seg_encoder seg3_enc(.val(d3), .ca(ca3));

    // Clock divider for multiplexing (~1 kHz)
    reg [15:0] clk_div = 0;
    reg clk_mux = 0;
    always @(posedge clk) begin
        clk_div <= clk_div + 1;
        if (clk_div == 50000) begin
            clk_div <= 0;
            clk_mux <= ~clk_mux;
        end
    end

    // Digit select and segment output
    always @(posedge clk_mux) begin
        digit_sel <= digit_sel + 1;
        case (digit_sel)
            2'b00: begin ca <= ca0; an <= 4'b1110; end
            2'b01: begin ca <= ca1; an <= 4'b1101; end
            2'b10: begin ca <= ca2; an <= 4'b1011; end
            2'b11: begin ca <= ca3; an <= 4'b0111; end
        endcase
    end

endmodule

