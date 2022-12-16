/*
Este é um módulo codificador que recebe os botões e produz uma codificação de 2 bits.
A saída EN é só para informar que o codificador está com um sinal codificado em suas saídas, e não um sinal de lixo

B3 - 00
B2 - 01
B1 - 10
B0 - 11
*/
module Codificador_Botoes(S, EN, B);

	input [3:0] B;	// Botões, já passados pelo LevelToPulse
	output [1:0] S;// saídas codificadas
	output EN;		// Informa se alguma entrada foi pressionada
	
	assign S[1] = (~B[3]) & (~B[2]);
	assign S[0] = (~B[3]) & (~B[1]);
	assign EN = ((B[0])&(~B[1])&(~B[2])&(~B[3])) | ((~B[0])&(B[1])&(~B[2])&(~B[3])) | ((~B[0])&(~B[1])&(B[2])&(~B[3])) | ((~B[0])&(~B[1])&(~B[2])&(B[3]));
	
endmodule
