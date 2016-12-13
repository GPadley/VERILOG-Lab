# Experiment 1 - Block Diagram 7 Segment Display

In experiment 1, we were given an incomplete diagram for a binary value 4'b0000 - 4'b1111 to be mapped to a 7 segment display. Once making the experiment project, we needed to add the incomplete schematic file in which Professor Cheung had provided for us. To do this you open the file in Quartus and then go to:

**Project -> Add Current Files To Project...**

To complete the design was the output for one of the 7 segment display LEDs, it was:
**out4 = /in3*in0 + /in3*in2*/in1 + /in2*/in1*in0**
![Output 4](https://github.com/GPadley/VERILOG-Lab/blob/master/Part-1/Ex1/out4.png "Output 4")

The next thing to do once finishing this was creating the top block in which took the input from 4 of the board switches SW[3:0] and then into the 7 segment display decoder and then output onto the displays on the board. Before we do this we have to map the pins of the board to the data. To enable several bit long lines into the block you need to use Bus lines which carry multiple bits in and out.

![Overall Output](https://github.com/GPadley/VERILOG-Lab/blob/master/Part-1/Ex1/Overall%20Block.png)

After doing this we had to map the names of the inputs and outputs to the pins on the Cyclone V board. To do this we need to go to:
**Assignment -> Pin Planner**

And change all inputs and outputs location and I/O Standard manually through it, they need to be:

| Signal Name | Pin Location | I/O Standard |
| --------|---------|-------| 
| HEX[6]  | PIN_AH28 | 3.3V LVTTL |
| HEX[5]  | PIN_AG28 | 3.3V LVTTL |
| HEX[4]  | PIN_AF28 | 3.3V LVTTL |
| HEX[3]  | PIN_AG27 | 3.3V LVTTL |
| HEX[2]  | PIN_AE28 | 3.3V LVTTL |
| HEX[1]  | PIN_AE27 | 3.3V LVTTL |
| HEX[0]  | PIN_AE26 | 3.3V LVTTL |
| SW[3] | PIN_AF10 | 3.3V LVTTL |
| SW[2] | PIN_AF9 | 3.3V LVTTL |
| SW[1] | PIN_AC12 | 3.3V LVTTL |
| SW[0] | PIN_AB12 | 3.3V LVTTL |

After entering all the data into the table, defining what the inputs are, you are able to Compile the software through:

**Processing -> Start Compilation**

Once this has gone through and there was no errors (Fails to compile), you are able to program the board:

**Tools -> Programmer: Auto Detect -> 5CSEMA5: Delete "SOCVHPS" -> Add File: Output Files -> Ex1_top.sof -> Start**

Once this is done when you change the 4 right most switches you should see the 7 Segment display numbers from 0 - F.

The point of doing this is that it becomes very complicated to implement designs like this due to the large number of inputs and outputs causing it to become messy and difficult to understand upon inspection. In the next exercise, we will look at implementing this through the use of Verilog, so how us how this can work.
![Block Diagram of 7 Segment Display](https://github.com/GPadley/VERILOG-Lab/blob/master/Part-1/Ex1/Block%20Diagram.png "Complete Schematic")
