/*
	Módulo sair as vagas livres
*/
module empty(S, CH);
	input [7:0] CH;// chaves da placa
	output [3:0] S;// resultado da soma
	//
	wire [3:0] occ1, occ2;
	
	//TEM QUE BARRAR/NEGAR O CH
	wire [7:0] CH_Inv;
	not Inv0(CH_Inv[0], CH[0]);
	not Inv1(CH_Inv[1], CH[1]);
	not Inv2(CH_Inv[2], CH[2]);
	not Inv3(CH_Inv[3], CH[3]);
	not Inv4(CH_Inv[4], CH[4]);
	not Inv5(CH_Inv[5], CH[5]);
	not Inv6(CH_Inv[6], CH[6]);
	not Inv7(CH_Inv[7], CH[7]);
	
	convert_occupations circuito01(.Qtd(occ1), .In(CH_Inv[3:0]));
	convert_occupations circuito02(.Qtd(occ2), .In(CH_Inv[7:4]));

	// Somador 3 bits
	sum3bit circuit02(S, occ1, occ2);
  
endmodule
//00000000
//00000001
//00000011
//00100001
//10000001
//01000100
//00111100
//10100101
//10110111
//11111111
//11101111
//00000000
//11111110
//01101101
