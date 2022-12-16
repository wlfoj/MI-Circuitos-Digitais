/*
Indica quando o display deverá ser acionado
*/
module On_Display(Out, GO, ERRO, STOP, FULL);
	input GO, ERRO, STOP, FULL;//Os possíveis estados
	output Out;//Se o displat deverá ser ligado, (Só ligo se algum estado for acionado)

	assign Out = (GO & ~ERRO & ~STOP & ~FULL) | (~GO & ERRO & ~STOP & ~FULL) | (~GO & ~ERRO & STOP & ~FULL) | (~GO & ~ERRO & ~STOP & FULL);
	//xor XOR1(Out, ERRO, STOP, GO, FULL);
	
endmodule
