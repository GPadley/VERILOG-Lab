# Experiment 10:	Interface	with the MCP4911	Digital-to-Analogue	Converter

We were asked to draw the timing diagram of the spi2dac interface, the first 4 lines show the loading, the clock divider and how the DAC_CS goes high when the load falls. Below those 4 lines, I restarted drawing DAC_CS but following the CLOCK_50 due to the fact that there was too many clock cycles for it to go through on the 1 MHz clock. So adter 16 clock cycles on the DAC_CS, it goes low and then the data starts coming out, from MSB to LSB, starting with the top 4 command bits dictating what the next steps to be taken should be, and the 10 bits after that are the 10'h23b data and then 2'b0 due to the don't cares at the bottom of the SR.

![Drawing](https://github.com/GPadley/VERILOG-Lab/blob/master/Part-3/Ex10/clock%20draw.png)

The ModelSim simulation of the Digital to Analogue converter with 10'h23B as the input is below.

![Modelsim](https://github.com/GPadley/VERILOG-Lab/blob/master/Part-3/Ex10/wave.png)

The output TP8 was the one given for the DAC in which when you increase the switch values the voltage goes up on the oscilloscope, up to 3.3 V when all switches are asserted and 0 V when non are asserted.
