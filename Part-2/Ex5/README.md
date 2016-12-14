# Experiment 5: Designing a Counter

The 8 bit counter designed was:

    `timescale 1ns / 100ps

    module counter_8(clock, enable, count);
	
	  parameter BIT_SZ = 8;
	  input clock;
	  input enable;
	  output [BIT_SZ-1:0] count;
	
  	reg [BIT_SZ-1:0] count;
	
	  initial count = 0;
	
	  always @ (posedge clock)
		      if (enable == 1'b1)
			    count <= count + 1'b1;
			
    endmodule
    
The way that the code works is that when there is a positive clock edge and the enable is active high, the count increments by 1, when the count reaches 8'b11111111 and one more is added on, it overflows and returns to 8'b0 and restarts the counting again.

# Simulation of the counter in ModelSim

