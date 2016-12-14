# Experiment 14: A Variable Sinewave Generator

To create a variable sinewave generator you work by skipping through values within the ROM, this is done by having the value of the switch be added onto a counter every clock cycle and used to access the ROM, cycling you through the values, once you get to a wave of 5000 kHz you would expect that increasing the switches would increase the frequency, but sadly due to the sampling frequency being 10000 kHz you get aliasing to happen which causes the frequency to decrease linearly the more you increase it past that point.

    module addr_reg(
			clk,
			data_in,
			data_out
			);
			input clk;
			input [9:0] data_in;
			output reg [9:0] data_out;
			
			initial data_out = 10'b0;
			
			always @ (posedge clk)
					data_out <= data_in + data_out;
					
    endmodule
