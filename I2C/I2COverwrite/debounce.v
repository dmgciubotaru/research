// Module to debounce the input lines

module debounce (
    input wire clk,   // Clock input
    input wire in,    // Noisy input signal
    output reg out    // Debounced output
);

reg [7:0] shift_reg; // 8-bit shift register for sampling

always @(posedge clk) begin
    // Shift the noisy input into the shift register
    shift_reg <= {shift_reg[6:0], in};

    // Check if all 8 samples are equal
    if (shift_reg[7] == shift_reg[6] && shift_reg[6] == shift_reg[5] &&
        shift_reg[5] == shift_reg[4] && shift_reg[4] == shift_reg[3] &&
        shift_reg[3] == shift_reg[2] && shift_reg[2] == shift_reg[1] &&
        shift_reg[1] == shift_reg[0]) begin
        out <= shift_reg[0]; // Update the output only if all samples are stable
    end
end

endmodule