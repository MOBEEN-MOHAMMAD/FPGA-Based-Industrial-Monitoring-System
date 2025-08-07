// seg_encoder.v
module seg_encoder(
    input [3:0] val,
    output reg [7:0] ca
);

    always @(*) begin
        case (val)
            0: ca = 8'b0000_0011;
            1: ca = 8'b1001_1111;
            2: ca = 8'b0010_0101;
            3: ca = 8'b0000_1101;
            4: ca = 8'b1001_1001;
            5: ca = 8'b0100_1001;
            6: ca = 8'b0100_0001;
            7: ca = 8'b0001_1111;
            8: ca = 8'b0000_0001;
            9: ca = 8'b0000_1001;
            default: ca = 8'b1111_1111;
        endcase
    end

endmodule

