module ex14_top(
		CLOCK_50,
		SW,
		DAC_CS,
		DAC_SDI,
		DAC_LD,
		DAC_SCK,
		PWM_OUT,
		HEX0,
		HEX1,
		HEX2,
		HEX3,
		HEX4
		);
		input CLOCK_50;
		input [9:0] SW;
		output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;
		output DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT;
		wire [3:0] BCD_0, BCD_1, BCD_2, BCD_3, BCD_4;
		wire clktick_16;
		wire [9:0] adr, DATA;
		wire [23:0] freq;
		div_5000(
			.clockin (CLOCK_50),
			.clockout (clktick_16)
			);
			
		addr_reg(
			.clk (clktick_16),
			.data_in (SW[9:0]),
			.data_out (adr[9:0])
			);
			
		mult2( 
			.dataa (SW),
			.result (freq)
			);
			
		bin2bcd_16 (freq[23:10], BCD_0, BCD_1, BCD_2, BCD_3, BCD_4);
			
		hex_to_7seg SEG0 (HEX0, BCD_0);
		hex_to_7seg SEG1 (HEX1, BCD_1);
		hex_to_7seg SEG2 (HEX2, BCD_2);
		hex_to_7seg SEG3 (HEX3, BCD_3);
		hex_to_7seg SEG4 (HEX4, BCD_4);
			
		ROM(
			.address (adr[9:0]),
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