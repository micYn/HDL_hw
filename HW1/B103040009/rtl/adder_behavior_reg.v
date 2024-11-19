module adder_behavior_reg (q,   a, b, ci,clk);
    parameter width = 32;
    output wire[width:0] q;
    reg[width:0] co_s;

    input wire[width-1:0] a, b;
    input wire ci,clk;

    D_FF dff[width:0](q,co_s,clk);

    always @ (*) begin
        co_s = a + b + ci;
    end
endmodule