module ex8_top(
	CLOCK_50,
	KEY,
	LEDR,
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4
	);

	input CLOCK_50;
	input [3:0] KEY;
	output [9:0] LEDR;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX2;
	output [6:0] HEX3;
	output [6:0] HEX4;

	wire [13:0] prbs;
	wire [3:0]	BCD0, BCD1, BCD2, BCD3, BCD4;
	wire tick_ms, tick_hs, lfsr_en, delay, timeout;
	div_50000(tick_ms, CLOCK_50); //creates ms clock

	div2500(tick_hs, tick_ms, CLOCK_50); //creates .5s clock
	 //led timer
	fsm(tick_ms, tick_hs, !KEY[3], timeout, lfsr_en, delay, LEDR);
	lfsr(tick_ms,prbs,lfsr_en); //pseudo random code

	bin2bcd_16 (prbs, BCD0, BCD1, BCD2, BCD3, BCD4);

	delay(prbs, tick_ms, delay, timeout); //times the delay before turning off leds


		hex_to_7seg		SEG0 (HEX0, BCD0);
		hex_to_7seg		SEG1 (HEX1, BCD1);
		hex_to_7seg		SEG2 (HEX2, BCD2);
		hex_to_7seg		SEG3 (HEX3, BCD3);
		hex_to_7seg		SEG4 (HEX4, BCD4);

endmodule
