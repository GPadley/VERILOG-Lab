module div_5000(
		clockout,
		clockin
		);
		
		input clockin;
		output reg clockout;

		parameter BIT_SZ = 16;
		reg [BIT_SZ-1:0] count;
	initial clockout = 1'b0;
	initial count = 16'd2500;
	
	always @ (posedge clockin) 
		if (count == 1'b0) begin
			clockout <= ~clockout;
			count <= 16'd2500;
		end
		else begin
			count <= count - 1'b1;
		end
	
			
endmodule		