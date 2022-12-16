/*
	Módulo sair as vagas ocupadas
*/
module occupied(S, CH);
	input [7:0] CH;// chaves da placa
	output [3:0] S;// resultado da soma
	//
	wire [3:0] occ1, occ2;
	//
	convert_occupations circuito01(.Qtd(occ1), .In(CH[3:0]));
	convert_occupations circuito02(.Qtd(occ2), .In(CH[7:4]));
	// Somador 3 bits
	sum3bit circuit02(S, occ1, occ2);
	
endmodule
