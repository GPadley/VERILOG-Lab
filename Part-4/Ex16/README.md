# Experiment 16: An Audio In-and-Out (All Pass) Loop

In this experiment we were given the analogue to decimal converter which allows us to take an analogue (audio) input and convert it to digital parameters, with this when can then edit the audio and then using last weeks digital to analogue converter we can output it through a speaker.

The way that the all pass processor worked was that it got rid of the offset in which the ADC has and added on the DAC output and did nothing else to the signal, we were tasked with amplifying the input signal by 4 in which once we have taken off the ADC offset we shift it 2 bits (same as multiplying by 4) and then add on the DAC offset and output it through the headphones.

    module processor (sysclk, data_in, data_out);

	input				sysclk;		// system clock
	input [9:0]		data_in;		// 10-bit input data
	output [9:0] 	data_out;	// 10-bit output data

	wire				sysclk;
	wire [9:0]		data_in;
	reg [9:0] 		data_out;
	wire [9:0]		x,y;

	parameter 		ADC_OFFSET = 10'h181;
	parameter 		DAC_OFFSET = 10'h200;

	assign x = data_in[9:0] - ADC_OFFSET;		
	assign y = {x[7:0], 2'b0};
	
	//  Now clock y output with system clock
	always @(posedge sysclk)
		data_out <=  y + DAC_OFFSET;
		
    endmodule
