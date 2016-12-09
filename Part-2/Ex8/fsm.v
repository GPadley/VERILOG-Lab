module fsm(clk, tick, trigger, time_out, en_lfsr, start_delay, ledr);
	parameter BIT_SZ = 13;

	input clk, tick, trigger, time_out;
	output reg en_lfsr, start_delay;
	output reg [9:0] ledr;
	reg[3:0] state;

//Defining the states
	parameter IDLE 			= 4'b0000,
		  	  FIRST_LED 	= 4'b0001,
		  	  SECOND_LED 	= 4'b0011,
		  	  THIRD_LED 	= 4'b0010,
		  	  FOURTH_LED 	= 4'b0110,
		  	  FIFTH_LED 	= 4'b0111,
		  	  SIXTH_LED 	= 4'b0101,
		  	  SEVENTH_LED 	= 4'b0100,
		  	  EIGHTH_LED 	= 4'b1100,
		  	  NINTH_LED 	= 4'b1101,
		  	  TENTH_LED		= 4'b1111,
		  	  DELAY 		= 4'b1110,
		  	  TURNOFF 		= 4'b1010;

	initial state = IDLE;

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

endmodule
