module ReLU (
    input signed [35:0] data_in,  // Input data
    output signed [35:0] data_out // Output data after ReLU
);
    assign data_out = (data_in > 0) ? data_in : 0;
endmodule