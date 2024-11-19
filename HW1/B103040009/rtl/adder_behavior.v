module adder_behavior (co_s,   a, b, ci);
    parameter width = 32;
    output reg[width:0] co_s;
    
    input wire[width-1:0] a, b;
    input wire ci;

    always @ (*) begin
        co_s = a + b + ci;
    end
endmodule