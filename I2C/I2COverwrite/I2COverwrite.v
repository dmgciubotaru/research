// This module reads out the frame, and enables the overwrite
module I2COverwrite
(
	input sda,
	input scl,
	input clk,
	input rst, 
	output reg out_0,
	output reg out_1
);

// Wires to be plugged in thi Phy for detecting I2C bus state
wire i2c_start;
wire i2c_stop;
wire i2c_data;

I2CPhy phy(
	.rst(rst),
	.clk(clk),
	.sda(sda),
	.scl(scl),
	.start(i2c_start),
	.stop(i2c_stop),
	.data(i2c_data)
);

reg[8:0] data[3:0]; // Reg to keep the read data
reg[3:0] bitcnt; // Reg to keep the remaining bit count to be read from current data
reg[3:0] bytecnt; // Current byte count that is being transmitted

// This logic is used to read out the I2C frame data into data
always @(posedge rst or posedge clk) begin
	if(rst) begin
		bitcnt <= 8;
		bytecnt <= 0;
	end else begin
		// START condition
		if(i2c_start) begin
			bitcnt <= 8;
			bytecnt <= 0;
		end
		
		// STOP condition
		if(i2c_stop) begin
		end
		
		if(i2c_data) begin
			data[bytecnt][bitcnt] <= sda;
			if(bitcnt == 0) begin
				bitcnt <= 8;
				bytecnt <= bytecnt + 1;
			end else begin
				bitcnt <= bitcnt - 1;
			end
		end
	end
end


// Hack logic
wire write_0; // This enables the overwirte 1 logic
wire write_1; // This enabbles the overwrite 0 logic
wire is_target_id; 

wire [6:0] target; // The target address of the current frame
wire rw; // RW flag value of current frame
assign target = data[0][8:2]; 
assign rw = data[0][1];


assign is_target_id = ((bytecnt > 0) && (target == 'h50)); // Logic to detect if the targeted address is transmitted 0x50
// the overwrite logic is enabled only on the second byte of a read operation on 0x50
assign en_overwrite = (is_target_id == 1)  && (rw == 1) && (bytecnt == 1)  && (bitcnt != 0); 
// This is the new value that we send on the bus
parameter overwrite_byte = {8'h55, 1'b1};

assign write_0 = en_overwrite  && (overwrite_byte[bitcnt] == 0);
assign write_1 = en_overwrite  && (overwrite_byte[bitcnt] == 1);

// out logic
always @(posedge rst or posedge clk) begin
	if(rst) begin
		out_0 <= 0;
		out_1 <= 0;
	end else begin
		if (scl == 0) begin
			out_0 <= write_0;
			out_1 <= write_1;
		end
	end
end


	
endmodule