`timescale 1ns / 100ps

module counter_8_new(
	clock,
	reset,
	count);
	
	parameter BIT_SZ = 8;
	input clock;
	input reset;
	output [BIT_SZ-1:0] count;
	
	reg [BIT_SZ-1:0] count;
	
	initial count = 0;
	
	always @ (posedge clock)begin
		if (reset == 1'b1)
			count <= 0;
		else
			count <= count + 1'b1;
	end		
endmodule