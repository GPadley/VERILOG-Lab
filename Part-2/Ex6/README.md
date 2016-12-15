# Experiment 6: Implementing a 16-bit	counter	on DE1

To create a 16 bit counter we start off with the similar design to Experiment 5, and adjust the size of the output, to change it from 8 to 16 via changing [7:0] to [15:0]

The next part is implementing the counter into the binary to binary coded decimal which luckily we already have the program in which does that for us. The outputs of that are then put into five 7 segment displays allowing you to see values from 0 - 65535.

    module ex6_top(
    		CLOCK_50,
     		KEY,
    		HEX0,
    		HEX1,
    		HEX2,
	    	HEX3,
    		HEX4
        );
	  input CLOCK_50;
  	input [3:0] KEY;
  	output [6:0] HEX0;
  	output [6:0] HEX1;
  	output [6:0] HEX2;
  	output [6:0] HEX3;
  	output [6:0] HEX4;

  	wire [15:0] count;
  	wire [3:0]	BCD0, BCD1, BCD2, BCD3, BCD4;
  	wire CLOCK_1;
  	div_50000(CLOCK_1, CLOCK_50);
  	counter_16 (CLOCK_50, KEY[1], !KEY[0]&CLOCK_1, count);
  	bin2bcd_16 (count, BCD0, BCD1, BCD2, BCD3, BCD4);
	
		hex_to_7seg		SEG0 (HEX0, BCD0);
		hex_to_7seg		SEG1 (HEX1, BCD1);
		hex_to_7seg		SEG2 (HEX2, BCD2);
		hex_to_7seg		SEG3 (HEX3, BCD3);
		hex_to_7seg		SEG4 (HEX4, BCD4);
		
    endmodule

To define a clock, we have to create a .sdc file in which allows us to define the clock and it's cycle time, this is done by writing this code into a file called ex6_top.sdc which if you read below, it creates a clock called CLOCK_50 and it's period is 20 ns which is 50MHz. 

    create_clock -name "CLOCK_50"	-period	20.000ns [get_ports {CLOCK_50}]

| Temp (C)| FMax (MHz) | 
|------|------|
|85 |422.48 |
| 0 | 445.24|

What you can also see from the data in the table are the setup and hold times for the program to allow it to work out what the maximum frequency is.

The reason that TimeQuest Timing Analyzer is red due to Unconstrained Paths:

|Property|Setup|Hold|
|--------|-----|----|
|Illegal Clocks | 0 | 0 |
| Unconstrained Clocks | 0 | 0 |
| Unconstrained Input Ports | 2 | 2 |
| Unconstrained Input Port Paths | 32 | 32 |
| Unconstrained Output Ports | 35 | 35 |
| Unconstrained Output Port Paths | 490 | 490 |

These mean that from the Synopsys Design Constraints (.sdc file) the setup and hold times for all the input ports and their paths haven't been specified.

For the cascade counter, within the divide by 50000, we need to have the clock come in and every positive edge it counts down from 50000, once it gets to 1, the output goes high and then immediately low after the next clock cycle goes in.

	module div_50000(
		clockout,
		clockin
		);
		
		input clockin;
		output reg clockout;

		parameter BIT_SZ = 16;
		reg [BIT_SZ-1:0] count;
	
	initial count = 4'hc350;
	
	always @ (posedge clockin) 
		if (count == 1'b1) begin
			clockout <= 1'b1;
			count <= 4'hc350;
		end
		else begin
			clockout <= 1'b0;
			count <= count - 1'b1;
		end
	
			
	endmodule		
