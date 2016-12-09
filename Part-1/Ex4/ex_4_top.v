module ex_4_top(
		SW,
		HEX0,
		HEX1,
		HEX2,
		HEX3
);
		input		[9:0] SW;
		wire		[15:0] DO;
		output   [6:0] HEX0;
		output   [6:0] HEX1;
		output   [6:0] HEX2;
		output   [6:0] HEX3;

		bin2bcd_16 (SW, DO[3:0], DO[7:4], DO[11:8], DO[15:12]);
		
		dec_to_7seg		SEG0 (HEX0, DO[3:0]);
		dec_to_7seg		SEG1 (HEX1, DO[7:4]);
		dec_to_7seg		SEG2 (HEX2, DO[11:8]);
		dec_to_7seg		SEG3 (HEX3, DO[15:12]);
		
endmodule