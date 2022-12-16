/*
Módulo para dividir a frequência da FPGA de forma a ser possivel utilizar nas MEF's
*/
module Primeiro_Divisor(CLK_2, CLK_FPGA);
	input CLK_FPGA;
	output CLK_2;
	reg [20:0] Out;

	always @(posedge CLK_FPGA) begin
		Out = Out + 21'b000000000000000000001;
	end
	
	assign CLK_2 = Out[20];

endmodule