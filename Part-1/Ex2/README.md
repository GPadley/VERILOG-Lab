# Experiment 2 - 7 Segment Decoder in Verilog HDL

The aim of this experiment is to show how much easier it is to program something like a 4 bit input to a 7 segment display can be. To create a Verilog file, go to:

**File -> New: Verilog HDL File**

We typed in:

'''
module ex_2_top(
		SW,
		HEX0
);

		input		[3:0] SW;
		output   [6:0] HEX0;
		
		hex_to_7seg		SEG0 (HEX0, SW);
		
endmodule
'''
