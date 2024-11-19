module adder_structure(co_s,    a,b,c_in);
    parameter width = 32;
    output wire[width:0] co_s;

    input wire[width-1:0] a, b;
    input wire c_in;
    wire [width-2:0] c;
    
    genvar i;
    generate
        for(i=0;i<width;i=i+1) begin: adder_loop
            if(i==0) begin
                FA fa(co_s[i],c[i],a[i],b[i],c_in);
            end
            else if(i==width-1) begin
                FA fa(co_s[i],co_s[i+1],a[i],b[i],c[i-1]);
            end
            else begin
                FA fa(co_s[i],c[i],a[i],b[i],c[i-1]);
            end
        end
    endgenerate
endmodule

