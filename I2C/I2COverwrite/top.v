module top(
	input clk,
	input nrst,
	input sda,
	input scl,
	
	output wire out_0,
	output wire nout_1
);

wire rst ;
assign rst  = !nrst;

wire out_1;
assign nout_1 = !out_1;

wire sda_stable;
wire scl_stable;

debounce debounce_sda(.clk(clk), .in(sda), .out(sda_stable));
debounce debounce_scl(.clk(clk), .in(scl), .out(scl_stable));


I2COverwrite Overwrite(
	.sda(sda_stable),
	.scl(scl_stable),
	.clk(!clk),
	.rst(rst),
	.out_0(out_0),
	.out_1(out_1)
);




endmodule