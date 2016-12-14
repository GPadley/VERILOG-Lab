module ex10_top(
		CLOCK_50,
		SW,
		DAC_CS,
		DAC_SDI,
		DAC_LD,
		DAC_SCK
		);
		input CLOCK_50;
		input [9:0] SW;
		output DAC_CS, DAC_SDI, DAC_LD, DAC_SCK;
		wire clktick_16;
		
		div_5000(
			.clockin (CLOCK_50),
			.clockout (clktick_16)
			);
		
		spi2dac (.sysclk (CLOCK_50),
					.data_in (SW[9:0]),
					.load (clktick_16),
					.dac_sdi (DAC_SDI),
					.dac_cs (DAC_CS),
					.dac_sck (DAC_SCK),
					.dac_ld (DAC_LD)
					);
		
		
endmodule