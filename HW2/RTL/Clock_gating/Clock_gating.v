module hw2_pipe_clkgating (
    input wire[7:0] a,
    input wire[7:0] b,
    input wire[7:0] c,
    input wire s,
    input wire clk,
    input wire reset,
    output wire[15:0] second_stage_result  //the final output
);
    wire[7:0] first_stage_result;

    wire gclk;
    assign gclk = (|c) & clk;

    wire modified_reset;
    assign modified_reset = (c == 8'b0) ? 1'b1 : reset;

    first_stage fs(.a(a),.b(b),.s(s),.clk(clk),.reset(reset),.first_stage_result(first_stage_result));
    second_stage ss(.sum(first_stage_result),.c(c),.clk(gclk),.reset(modified_reset),.second_stage_result(second_stage_result));

endmodule
module first_stage (
    input wire[7:0] a,
    input wire[7:0] b,
    input wire s,
    input wire clk,
    input wire reset,
    output wire[7:0] first_stage_result //reg type due to always block
);
    wire[7:0] sum;
    assign sum = (s==1 ? a+b : a-b);
    D_FF_8 dff8(.d(sum),.clk(clk),.reset(reset),.q(first_stage_result));
endmodule
module second_stage (
    input wire[7:0] sum,
    input wire[7:0] c,
    input wire clk,
    input wire reset,
    output wire[15:0] second_stage_result  //reg type for always block
);
    wire[15:0] product;
    assign product = c*sum;
    D_FF_16 dff16(.d(product),.clk(clk),.reset(reset),.q(second_stage_result));
endmodule