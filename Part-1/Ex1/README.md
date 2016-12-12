# Exercise 1 - Block Diagram 7 Segment Display

In exercise 1, we were given an incomplete diagram for a binary value 4'b0000 - 4'b1111 to be mapped to a 7 segment display. What we had to add to the design was the output for one of the 7 segment display LEDs, it was:
*out4 = /in3*in0 + /in3*in2*/in1 + /in2*/in1*in0*
![Output 4](https://github.com/GPadley/VERILOG-Lab/blob/master/Part-1/Ex1/out4.png "Output 4")

The next thing to do once finishing this was creating the top block in which took the input from 4 of the board switches SW[3:0] and then into the 7 segment display decoder and then output onto the displays on the board. Before we do this we have to map the pins of the board to the data.

The point of doing this is that it becomes very complicated to implement designs like this due to the large number of inputs and outputs causing it to become messy and difficult to understand upon inspection. In the next exercise, we will look at implementing this through the use of Verilog, so how us how this can work.
![Block Diagram of 7 Segment Display](https://github.com/GPadley/VERILOG-Lab/blob/master/Part-1/Ex1/Block%20Diagram.png "Complete Schematic")
