# Experiment 8: Starting Line Delay Circuit

In this experiment we were tasked with creating a starting light sequence after pressing a button (The light above the switches turn on one by one every 0.5 s), whilst this is happening a 14 bit LFSR is cycling through random values which are at max 16383, once this random value is chosen (when all the LEDs have lit up) a 14 bit delay counter starts counting up to the random value, clocked at 1kHz so it counts in milliseconds, once this reaches the value, it sends a signal back to the finite state machine which controls the LEDs and turns them off, resetting the machine.

![Diagram](https://github.com/GPadley/VERILOG-Lab/blob/master/Part-2/Ex8/Light%20Sequence.png)
