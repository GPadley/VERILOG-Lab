module lfsr(
		clock,
		data_out,
		enable
		);
		input clock;
		input enable;
		output [13:0] data_out;
		reg [13:0] count;
		initial count = 16'd128;

		always @ (posedge clock)
			if (enable == 1'b1)
				count <= {count [13:0], (((count[11] ^ count[9]) ^ count[5]) ^count[0])};
				assign data_out = count;
endmodule
