# Experiment 2 - 7 Segment Decoder in Verilog HDL

The aim of this experiment is to show how much easier it is to program something like a 4 bit input to a 7 segment display can be. To create a Verilog file, go to:

**File -> New: Verilog HDL File**

We typed in:

	module hex_to_7seg		(out, in);

		output	[6:0] out;
		input		[3:0] in;
		
		reg		[6:0] out;
		
		always @ (*)
			case (in)
			4'h0: out = 7'b1000000;
			4'h1: out = 7'b1111001;
			4'h2: out = 7'b0100100;
			4'h3: out = 7'b0110000;
			4'h4: out = 7'b0011001;
			4'h5: out = 7'b0010010;
			4'h6: out = 7'b0000010;
			4'h7: out = 7'b1111000;
			4'h8: out = 7'b0000000;
			4'h9: out = 7'b0011000;
			4'ha: out = 7'b0001000;
			4'hb: out = 7'b0000011;
			4'hc: out = 7'b1000110;
			4'hd: out = 7'b0100001;
			4'he: out = 7'b0000110;
			4'hf: out = 7'b0001110;
		endcase
	endmodule

Module defines the start of the code and the name of the module comes after it, in this case "**hex_to_7seg**", what comes in the brackets after are the inputs and the outputs of the module, in this case they are "**in**" and "**out**". They are defined by "**output [6:0] out**" meaning that "**out**" is an output which is 7 bits in size, and that "**in**" is an input of 4 bits width. To be able to edit the value of "**out**", it must also be defined as a register through "**reg [6:0] out**"

"**always @ (*)**" means that at at any change always enter this. "**case (in)**" means in the case of in being x, the output "**out**" is y, note that the output is active low .

To enable the switches to alter the display, we need to create a top file in which has the switches as an input and the 7 segment display as its output which then calls the module "**hex_to_7seg**" to change the display. The top file is made by creating a new Verilog file and entering this code:

