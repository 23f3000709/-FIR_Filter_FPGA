module top (
    input  wire clk,        // FPGA clock
    input  wire rst,        // Reset (button or switch)
    input  wire signed [15:0] x_in,   // Input sample
    output wire signed [31:0] y_out   // Filtered output
);

    // Instantiate FIR filter
    fir_filter_fpga fir_inst (
        .clk(clk),
        .rst(rst),
        .x_in(x_in),
        .y_out(y_out)
    );

endmodule
