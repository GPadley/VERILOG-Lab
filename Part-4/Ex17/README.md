# Experiment 17: Echo Synthesizer with Fixed Delay

For the echo we use a FIFO in which means first in, first out, so when we start getting data in, it is inputted into the FIFO there are 8192 memory slots, so due to the 10 kHz load input for it to become full 8196 clock cycles must pass which is 0.8196 s delay. Within the processor, we take the data in and the FIFO data, quarter the data from the FIFO (echoes are quieter), add them together and then output, still with the offsets being taken off and added together. 

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

	assign x = {1'b0, data_delay[9:1]};		// x is input in 2's complement
	
	assign y = data_in[9:0] + x;
	assign z = y - ADC_OFFSET;
	
	//  Now clock y output with system clock
	always @(posedge sysclk)
		data_out <=  z + DAC_OFFSET;
		
    endmodule
