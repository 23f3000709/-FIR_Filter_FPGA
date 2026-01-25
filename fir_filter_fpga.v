//=========================================================
// FIR Filter FPGA Implementation
// 24-tap FIR filter (Direct Form)
// Coefficients generated from MATLAB
//=========================================================

module fir_filter_fpga (
    input  wire        clk,
    input  wire        rst,
    input  wire signed [15:0] x_in,
    output reg  signed [31:0] y_out
);

    integer i;

    // Delay line
    reg signed [15:0] x_reg [0:23];

    // FIR coefficients (Q1.15 or integer-scaled from MATLAB)
    reg signed [15:0] b [0:23];

    // Accumulator
    reg signed [31:0] acc;

    // -----------------------------------------
    // Coefficient initialization (MATLAB output)
    // -----------------------------------------
    initial begin
        b[0]  = -38;
        b[1]  = -76;
        b[2]  = 107;
        b[3]  = 550;
        b[4]  = 631;
        b[5]  = -162;
        b[6]  = -855;
        b[7]  = 34;
        b[8]  = 1477;
        b[9]  = 471;
        b[10] = -2518;
        b[11] = -1861;
        b[12] = 5604;
        b[13] = 13829;
        b[14] = 13829;
        b[15] = 5604;
        b[16] = -1861;
        b[17] = -2518;
        b[18] = 471;
        b[19] = 1477;
        b[20] = 34;
        b[21] = -855;
        b[22] = -162;
        b[23] = 631;
    end

    // -----------------------------------------
    // FIR Filter Operation
    // -----------------------------------------
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset delay line and output
            for (i = 0; i < 24; i = i + 1)
                x_reg[i] <= 0;

            y_out <= 0;
        end
        else begin
            // Shift register
            x_reg[0] <= x_in;
            for (i = 1; i < 24; i = i + 1)
                x_reg[i] <= x_reg[i-1];

            // Multiply-Accumulate (MAC)
            acc = 0;
            for (i = 0; i < 24; i = i + 1)
                acc = acc + x_reg[i] * b[i];

            y_out <= acc;
        end
    end

endmodule
