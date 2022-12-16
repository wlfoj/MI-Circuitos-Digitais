module divisor(clock_div, clock);
	input clock;
	output reg [1:0] clock_div;
	reg [15:0] Out;

	
	initial begin
		clock_div = 2'b00;
		Out = 16'b0000000000000000;
	end

	always @(posedge clock)
	begin
		Out = Out + 16'b0000000000000001;
			if(Out[15] == 1'b1)
				begin
					Out = 16'b0000000000000000;
					clock_div = clock_div + 2'b01;
				end
		end

endmodule
