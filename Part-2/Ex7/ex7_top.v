module ex7_top (
		KEY,
		HEX0,
		HEX1
		);
		input [3:0] KEY;
		output [6:0] HEX0, HEX1;
		
		wire [6:0] count;
		
		prbs(KEY[3],count);
		
		
		hex_to_7seg SEG0 (HEX0, count[3:0]);
		hex_to_7seg SEG1 (HEX1, count[6:4]);
		
endmodule