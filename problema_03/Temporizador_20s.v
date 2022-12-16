/*
Módulo para emitir um pulso após aproximadamente 20s.
Contagem só é feita enquanto EN for nivl ALTO
*/

module Temporizador_20s(pulse_20s, clock, EN);
	input clock, EN;
	output reg pulse_20s;
	reg [9:0] count;


	always @(posedge clock) begin
		pulse_20s = 1'b0;
		if (EN) begin
			count = count + 10'b0000000001;
			if (count == 10'b1000000000) begin //Se atingir a contagem de 20s, reinicia ou conta de 10s
				count = 10'b0000000000;
				pulse_20s = 1'b1;
			end
		end
		else begin
			count = 10'b0000000000;
		end
	end
	
endmodule
