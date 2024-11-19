module adder_dataflow(co_s, a,b,c_in);
    parameter width=32;
    output wire[width:0] co_s;
    wire[width-1:0] sum;
    wire c_out;
    input wire[width-1:0] a,b;
    input c_in;

    assign {c_out,sum} = a + b + c_in;
    assign co_s = {c_out,sum};
endmodule