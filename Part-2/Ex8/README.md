# Experiment 8: Starting Line Delay Circuit

In this experiment we were tasked with creating a starting light sequence after pressing a button (The light above the switches turn on one by one every 0.5 s), whilst this is happening a 14 bit LFSR is cycling through random values which are at max 16383, once this random value is chosen (when all the LEDs have lit up) a 14 bit delay counter starts counting up to the random value, clocked at 1kHz so it counts in milliseconds, once this reaches the value, it sends a signal back to the finite state machine which controls the LEDs and turns them off, resetting the machine.

![Diagram](https://github.com/GPadley/VERILOG-Lab/blob/master/Part-2/Ex8/Light%20Sequence.png)

In "**fsm.v**" the file contains the code for the finite state machine in which shows how the states switch between each other, initially starting off at IDLE and waiting until **trigger** is set to high (**KEY[3]**) from then on it waits until both the 1 ms and the 0.5 s clock go high until they pass onto the next stage and DELAY waits until  

    always @(posedge clk)
		    case (state)
			    IDLE 			: if (trigger==1'b1) state<= FIRST_LED;
    			DELAY 			: if (time_out==1'b1) state <= TURNOFF;
		    	TURNOFF 		: state <= IDLE;
	    		FIRST_LED 		: if (tick == 1'b1) state <= SECOND_LED;
	    		SECOND_LED 		: if (tick == 1'b1) state <= THIRD_LED;
	    		THIRD_LED 		: if (tick == 1'b1) state <= FOURTH_LED;
    			FOURTH_LED 		: if (tick == 1'b1) state <= FIFTH_LED;
    			FIFTH_LED 		: if (tick == 1'b1) state <= SIXTH_LED;
    			SIXTH_LED 		: if (tick == 1'b1) state <= SEVENTH_LED;
    			SEVENTH_LED 	: if (tick == 1'b1) state <= EIGHTH_LED;
    			EIGHTH_LED 		: if (tick == 1'b1) state <= NINTH_LED;
    			NINTH_LED 		: if (tick == 1'b1) state <= TENTH_LED;
    			TENTH_LED		: if (tick == 1'b1) state <= DELAY;
	    	default: ;
   	endcase // state

	always @(*)
		case (state)
			IDLE 			: ledr[9:0] <= 10'b0000000000;
			FIRST_LED 		: begin ledr[9:0] <= 10'b1000000000;
									en_lfsr <= 1'b1; end
			SECOND_LED 		: ledr[9:0] <= 10'b1100000000;
			THIRD_LED 		: ledr[9:0] <= 10'b1110000000;
			FOURTH_LED 		: ledr[9:0] <= 10'b1111000000;
			FIFTH_LED 		: ledr[9:0] <= 10'b1111100000;
			SIXTH_LED 		: ledr[9:0] <= 10'b1111110000;
			SEVENTH_LED 	: ledr[9:0] <= 10'b1111111000;
			EIGHTH_LED 		: ledr[9:0] <= 10'b1111111100;
			NINTH_LED 		: ledr[9:0] <= 10'b1111111110;
			TENTH_LED		: ledr[9:0] <= 10'b1111111111;
			DELAY 			: begin start_delay <= 1'b1;
									en_lfsr <= 1'b0;
							     	ledr[9:0] <= 10'b1111111111; end
			TURNOFF 		   : ledr[9:0] <= 10'b0000000000;

		default: ;
	endcase

The LFSR uses 14 bits and follows the equation **1 + X12 + X10 + X6 + X**

    always @ (posedge clock)
			if (enable == 1'b1)
				count <= {count [13:0], (((count[11] ^ count[9]) ^ count[5]) ^count[0])};
		assign data_out = count;
