# Experiment 3 - 10-Bit Binary Switch on 3 7 Segment Displays

The aim of this experiment is to see if we are able to take initiative and take the 10 bit switch value and put it onto the first 3 7 segment displays. The way to do this was to:

1. Alter the size of the switch input
2. Add on extra 7 segment display outputs
3. Create a top file in which implements this

To start off we looked at the "**pin_assignment.txt**" file to see what the next 7 segment displays were defined as and luckily they are called HEX1 and HEX2, so adding these in to the new project we wrote the top file:

    module ex_3_top(
		    SW,
		    HEX0,
		    HEX1,
		    HEX2
    );

		    input 	 [9:0] SW;
		    output   [6:0] HEX0;
	    	output   [6:0] HEX1;
	    	output   [6:0] HEX2;
		
		    hex_to_7seg		SEG0 (HEX0, SW[3:0]);
		    hex_to_7seg		SEG1 (HEX1, SW[7:4]);
		    hex_to_7seg		SEG2 (HEX2, SW[9:8]);
		
    endmodule
    
Adding the "**hex_to_7seg**" Verilog file from the previous file into this one and setting up the "**ex3_top.qsf**" file with the "**pin_assignment.txt**" this sets up the program to be able to be compiled and then programmed onto the board in the same way as before.
