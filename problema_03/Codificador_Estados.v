/*Codificando os estados da máquina principal em um sinal de 2 bits*/
module Codificador_Estados(COD, ERRO, PARE, SIGA, CHEIO);

	input ERRO, PARE, SIGA, CHEIO;
	output [1:0] COD;// saídas codificadas
	
	assign COD[1]= (~SIGA) & (~CHEIO);
	assign COD[0] = ((SIGA)&(~CHEIO))|((ERRO)&(~PARE));
	

endmodule