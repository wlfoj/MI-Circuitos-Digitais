module divisor2(CLK_2, CLK_FPGA);
	input CLK_FPGA;
	output CLK_2;
	reg [19:0] Out;

	
	/*initial begin
		//CLK_2 = 1'b0;
		Out = 20'b0000;
	end*/

	always @(posedge CLK_FPGA) begin
		Out = Out + 20'b00000000000000000001;
	end
	
	assign CLK_2 = Out[19];

endmodule
