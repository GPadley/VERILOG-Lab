module div2500(
		clockout,
		enable,
		clockin
		);

		input clockin;
		input enable;
		output reg clockout;

		parameter BIT_SZ = 12;
		reg [BIT_SZ-1:0] count;

	initial count = 12'd500;

	always @ (posedge clockin)
			if (count == 1'b1) begin
				clockout <= 1'b1;
				count <= 12'd500;
			end
			else if (enable == 1'b1)begin
				clockout <= 1'b0;
				count <= count - 1'b1;
			end


endmodule
