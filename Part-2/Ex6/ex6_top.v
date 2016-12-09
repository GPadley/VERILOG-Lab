module ex6_top(
		CLOCK_50,
		KEY,
		HEX0,
		HEX1,
		HEX2,
		HEX3,
		HEX4
);
	input CLOCK_50;
	input [3:0] KEY;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	output [6:0] HEX3;
	output [6:0] HEX4;

	wire [15:0] count;
	wire [3:0]	BCD0, BCD1, BCD2, BCD3, BCD4;
	wire CLOCK_1;
	div_50000(CLOCK_1, CLOCK_50);
	counter_16 (CLOCK_50, KEY[1], !KEY[0]&CLOCK_1, count);
	bin2bcd_16 (count, BCD0, BCD1, BCD2, BCD3, BCD4);
	
	
		hex_to_7seg		SEG0 (HEX0, BCD0);
		hex_to_7seg		SEG1 (HEX1, BCD1);
		hex_to_7seg		SEG2 (HEX2, BCD2);
		hex_to_7seg		SEG3 (HEX3, BCD3);
		hex_to_7seg		SEG4 (HEX4, BCD4);
		
endmodule