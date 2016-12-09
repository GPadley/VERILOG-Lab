module prbs(
		clock,
		count
		);
		
		parameter BIT_SZ = 7;
		input clock;
		output [BIT_SZ-1:0] count;
		reg [BIT_SZ-1:0] count;
		initial count = 7'b000001;
		always @ (posedge clock) begin
				count <= {count [5:0], count[6]^count[2]};
		end	
			
endmodule