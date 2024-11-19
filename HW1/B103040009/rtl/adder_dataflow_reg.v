module adder_dataflow_reg(q, a,b,c_in,clk);
    parameter width=32;
    
    output wire[width:0] q;
    input wire[width-1:0] a,b;
    input wire c_in,clk;
    wire c_out;
    wire[width-1:0] sum;

    assign {c_out,sum} = a + b + c_in;

    // D_FF dff[width:0] (q,{c_out,sum},clk);
    D_FF dff_sum[width-1:0] (q[width-1:0], sum, clk);
    D_FF dff_cout(q[width], c_out, clk);

endmodule