module delay(
		N,
		clock,
		trigger,
		time_out
		);

		input [13:0] N;
		input clock;
		input trigger;
		output reg time_out;
		reg [13:0] count_delay;
		initial count_delay = 14'b0;
		initial time_out = 1'b0;

		always @ (posedge clock) begin
			if (trigger == 1'b1) begin
				count_delay <= count_delay + 1'b1;
				time_out <= 1'b0;
				end
			if (count_delay == N-1) begin
				time_out <= 1'b1;
				count_delay <= 14'b0;
				end
			end

endmodule
