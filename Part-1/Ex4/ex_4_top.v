module ex_4_top(
		SW,
		HEX0,
		HEX1,
		HEX2,
		HEX3
);
		input		[9:0] SW;
		wire		[3:0] D0, D1, D2, D3;
		output   [6:0] HEX0;
		output   [6:0] HEX1;
		output   [6:0] HEX2;
		output   [6:0] HEX3;

		bin2bcd_10 (SW, D0, D1, D2, D3);
		
		dec_to_7seg		SEG0 (HEX0, D0);
		dec_to_7seg		SEG1 (HEX1, D1);
		dec_to_7seg		SEG2 (HEX2, D2);
		dec_to_7seg		SEG3 (HEX3, D3);
		
endmodule
