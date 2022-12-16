/*
Decodifica os segmentos com base nos estados codificados e o sinal de 2 bits provenientes do 
divisor de frequência
*/
module Decodificador_Segmentos( Segmentos, ST, FREQ);
	input [1:0] ST, FREQ;
	output [6:0] Segmentos;
	
	assign Segmentos[0] = (~ST[1] & ~ST[0]) | (ST[1] & ST[0] & FREQ[0]) | (ST[1] & FREQ[1] & ~FREQ[0]);

	assign Segmentos[1] = (~ST[1] & ~ST[0] & ~FREQ[1]) | (~ST[1] & ~ST[0] & FREQ[0]) | (ST[0] & ~FREQ[1])| (ST[1] & FREQ[1]);

	assign Segmentos[2] = (~ST[1] & ~ST[0]  & ~FREQ[1] & ~FREQ[0]) | (ST[1] & ~FREQ[1] & ~FREQ[0]) | (ST[0] & ~FREQ[1] & FREQ[0]) | (ST[1] & ST[0] & FREQ[1] & ~FREQ[0]) | (ST[1] & ~ST[0] & FREQ[1]);

	assign Segmentos[3] = (ST[1] & ~ST[0] & ~FREQ[1]) | (ST[1] & ~FREQ[1] & FREQ[0]) | (~ST[1] & ST[0] & FREQ[1] & FREQ[0]) | (ST[1] & FREQ[1] & ~FREQ[0]);

	assign Segmentos[4] = (~ST[1] & ST[0] & ~FREQ[1] & ~FREQ[0])| (~ST[1] & ST[0] & FREQ[1] & ~FREQ[0]);

	assign Segmentos[5] = (~ST[1] & ~FREQ[1] & FREQ[0]) | (~ST[1] & ~ST[0] & FREQ[1]) | (ST[1] & ST[0] & FREQ[0]) | (ST[1] & FREQ[1] & ~FREQ[0]);

	assign Segmentos[6] = (~ST[1] & ST[0] & ~FREQ[1] & FREQ[0]);
	
endmodule
	