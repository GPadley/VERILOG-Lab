# Experiment 11: D-to-A	conversion Using Pulse-Width Modulation

Using pulse width modulation you take data in and count up to that value, for that time it is asserted until it becomes greater than that it then goes low, giving a rectangular wave of varying width depending on how the switches are asserted.

    module pwm (clk,
				data_in,
				load,
				pwm_out
				);

		input		clk;
		input	[9:0] data_in;
		input		load;
		output	pwm_out;
		
		reg	[9:0]	d;
		reg	[9:0] count;
		reg		pwm_out;
		
		always @ (posedge clk)
			if (load == 1'b1)
			d <= data_in;
			
		initial count = 10'b0;
			
		always @ (posedge clk)begin
			count <= count + 1'b1;
			if (count > d)
				pwm_out <= 1'b0;
			else
				pwm_out <= 1'b1;
			end
			
    endmodule
