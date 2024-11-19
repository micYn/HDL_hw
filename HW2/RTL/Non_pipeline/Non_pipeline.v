module hw2_nonpipe (
    input wire[7:0] a,
    input wire[7:0] b,
    input wire[7:0] c,
    input wire s,
    output reg[15:0] result
);
    always @(*) begin
        if (s == 1) begin
            result = (a + b) * c;
        end else begin
            result = (a - b) * c;
        end
    end
endmodule