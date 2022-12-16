/*Sinal de clock de aproximadamente 1hz
Só emite o sinal, quando for o estado de pare ou quando estiver esperando a senha
na MEF principal*/
module Divisor_Frequencia_1Hz(clock_div, clock, EN, out_princ_pare);
	input clock, EN, out_princ_pare;
	output clock_div;
	reg [25:0] Out;

	
	initial begin
		Out = 26'b00000000000000000000000000;
	end

	always @(posedge clock) begin
		if (EN | out_princ_pare) begin
			Out <= Out + 26'b00000000000000000000000001;
		end
		else begin
			Out <= 25'b00000000000000000000000000;
		end
	end
	
	assign clock_div = Out[25];
	
endmodule