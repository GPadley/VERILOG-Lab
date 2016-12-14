# Experiment 6: Implementing a 16-bit	counter	on DE1

To create a 16 bit counter we start off with the similar design to Experiment 5, and adjust the size of the output, to change it from 8 to 16 via changing [7:0] to [15:0]

The next part is implementing the counter into the binary to binary coded decimal which luckily we already have the program in which does that for us. The outputs of that are then put into five 7 segment displays allowing you to see values from 0 - 65535.



To define a clock, we have to create 
