module addr_reg(
			clk,
			data_in,
			data_out
			);
			input clk;
			input [9:0] data_in;
			output reg [9:0] data_out;
			
			initial data_out = 10'b0;
			
			always @ (posedge clk)
					data_out <= data_in + data_out;
					
endmodule
			