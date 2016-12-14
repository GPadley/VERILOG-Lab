# Experiment 13: A Fixed Frequency Sinewave	Generator

In this experiment we used a 10 bit counter which adds on 1 every clock cycle of a 10 kHz clock, due to having to count through 1023 values by the time it gets to the end you get a sinewave of frequency 10 Hz output wave.

    module ex13_top(
		CLOCK_50,
		DAC_CS,
		DAC_SDI,
		DAC_LD,
		DAC_SCK,
		PWM_OUT
		);
		input CLOCK_50;
		output DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT;
		wire clktick_16;
		wire [9:0] adrcount, DATA;
		div_5000(
			.clockin (CLOCK_50),
			.clockout (clktick_16)
			);
			
		b_10count(
			.count (adrcount),
			.clock (CLOCK_50),
			.enable (clktick_16)
			);
			
		ROM(
			.address (adrcount[9:0]),
			.clock (clktick_16),
			.q(DATA[9:0])
			);
			
		
		spi2dac (.sysclk (CLOCK_50),
					.data_in (DATA),
					.load (clktick_16),
					.dac_sdi (DAC_SDI),
					.dac_cs (DAC_CS),
					.dac_sck (DAC_SCK),
					.dac_ld (DAC_LD)
					);
		
		pwm (.clk (CLOCK_50),
				.data_in (DATA),
				.load (clktick_16),
				.pwm_out (PWM_OUT))
				;
		
    endmodule
