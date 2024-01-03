// Module that reads the I2C lines and detects data and start and stop conditions
module I2CPhy(
	input rst,
	input clk,
	input sda,
	input scl,
	output reg start,
	output reg stop,
	output reg data
);

// Input buffering
// We need the last value of the line to be able to identify transitions
reg last_sda;
reg last_scl;


always @(posedge rst or posedge clk) begin
	if(rst) begin
		last_sda <= 1;
		last_scl <= 1;
	end else begin
		last_sda <= sda;
		last_scl <= scl;
		start <=  (last_scl ==1 && scl == 1 && last_sda == 1 && sda == 0);
		stop <= (last_scl == 1 && scl == 1 && last_sda == 0 && sda == 1);
		data <= (last_scl == 0 && scl == 1);
	end
end
	
endmodule