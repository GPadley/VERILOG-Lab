# Experiment 4 - Displaying 10-Bit Binary as BCD Digits on the 7 Segment Displays

In this exercise, we had to look at how we can convert binary to binary coded decimal so that when we display it on the 7 segment displays, we are shown the binary value opposed to the hexadecimal value. With 10 bits, the maximum decimal value you can have is 1023, so for the display we need to have 4 7 segment displays.

The way that the conversion of the binary is done is through shifting the bits in from the bottom and when the value becomes greater than 5, 3 is added onto it, using this method, once all bits have been shifted in, you end up with the binary coded decimal you would need to give the value you inputted. This is shown in the example below.

![bin2bcd](https://github.com/GPadley/VERILOG-Lab/blob/master/Part-1/Ex4/AlgorithmTable.png)

Comparing the usage of the resources, shows that there is next to no difference from implementing using a 10 bit converter to a 16 bit decoder due to the fact that the 16 bit converter uses 1 more ALM than the 10 bit converter. This is due to the fact that Quartus optimises the program to use the minimum amount of resources possible by getting rid of unused inputs.

![16 Bit](https://github.com/GPadley/VERILOG-Lab/blob/master/Part-1/Ex4/16bit.png)
![10 Bit](https://github.com/GPadley/VERILOG-Lab/blob/master/Part-1/Ex4/10bit.png)

