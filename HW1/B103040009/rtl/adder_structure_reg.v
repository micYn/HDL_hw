module adder_structure_reg(q,    a,b,c_in,clk);
    parameter width = 32;
    output wire[width:0] q;
    input wire[width-1:0] a, b;
    input wire c_in,clk;
    wire[width-1:0] sum;
    wire [width-2:0] c;
    wire c_out;
    
    genvar i;
    generate
        for(i=0;i<width;i=i+1) begin: adder_loop
            if(i==0) begin
                FA fa(sum[i],c[i],a[i],b[i],c_in);
            end
            else if(i==width-1) begin
                FA fa(sum[i],c_out,a[i],b[i],c[i-1]);
            end
            else begin
                FA fa(sum[i],c[i],a[i],b[i],c[i-1]);
            end
        end
    endgenerate

    D_FF dff_sum[width-1:0] (q[width-1:0], sum,clk);
    D_FF dff_cout(q[width], c_out,clk);

endmodule
