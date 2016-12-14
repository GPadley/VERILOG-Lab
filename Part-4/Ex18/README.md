# Experiment 18: Multiple Echoes

With this experiment I changed the input into the FIFO from the data input into the data output in which then when we compiled and programmed the box it saturated and gave a lot of noise, so we increased the divide from 2 to 4 which solved the problem and provided a multiple echo.

        module processor (sysclk, data_in, data_delay, data_out);

	input				sysclk;		// system clock
	input [9:0]		data_in;		// 10-bit input data
	input [9:0]		data_delay;
	output [9:0] 	data_out;	// 10-bit output data

	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x,y,z;

	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;

	assign x = data_in[9:0] - ADC_OFFSET;		// x is input in 2's complement
	
	assign y = x - {2'b0, data_delay[9:2]};
	
	//  Now clock y output with system clock
	always @(posedge sysclk)
		data_out <=  z + DAC_OFFSET;
		
    endmodule
