
module main( A, B, C, D, E, F, G, P, Display, Rows, Col, CH, clk);
	input [7:0] CH;// Chaves
	input clk;		// Clock da placa
	output A, B, C, D, E, F, G, P;// Segmentos do display
	output [3:0] Display;// Cada digito do display 3-esquerda e 0-direita
	output [6:0] Rows;// cada linha da matriz
	output [1:0] Col;// cada coluna da matriz 1-esquerda e 0-direita
	
	wire [1:0] clk_2;// Sinal de clock já dividido pela frequência
	wire [3:0] Occ, Vacant, Out_Mux, Situations;
	
	// BLOCO PARA O DIVISOR DE FREQUÊNCIA E O INDICA VEZ
	divisor 	divisor_frequencia(clk_2, clk);
	scheduler circuit_ctrl(Situations, clk_2);
	
	// BLOCO PARA CONTAR AS VAGAS OCUPADAS E AS DESOCUPADAS
	occupied circuit_occ(Occ, CH);
	empty 	circuit_emp(Vacant, CH);
	
	// MUX E DECODIFICADOR
	mux 				circuit_mx(Out_Mux, clk_2, Occ, Vacant);
	decodificador circuit_dec(A, B, C, D, E, F, G, P, Out_Mux);
	
	// CONTROLADOR/ACIONADOR DOS DIGITOS DO DISPLAY
	power_digit circuit_on_disp(Display, Situations);
	
	// CONTROLADOR DAS VAGAS NA MATRIZ
	control_matriz circuit_matriz(Rows, Col, Situations, CH);
	
	
endmodule
/* 
	clock - clk - 12
	
	PARA AS CHAVES	
	CH7 - 35
	CH6 - 33
	CH5 - 30
	CH4 - 34
	CH3 - 36
	CH2 - 38
	CH1 - 40
	CH0 - 42

	
	PARA O DISPLAY
	Display[3] - 7 SEG-D1 - PIN_88 é o da esquerda
	Display[2] - 7 SEG-D2 - PIN_66
	Display[1] - 7 SEG-D3 - PIN_68
	Display[0] - 7 SEG-D4 - PIN_37 é o da direita
	A - PIN_90
	B - PIN_70
	C - PIN_41
	D - PIN_98
	E - PIN_100
	F - PIN_92
	G - PIN_39
	P - PIN_96
	
	
	PARA A MATRIZ
	Col[0] - PIN_82 - é a da esquerda
	Col[1] - PIN_78 - é a da direita
	Rows[0] - PIN_85 - é a linha de cima (a 1º)
	Rows[1] - PIN_83 
	Rows[2] - PIN_84
	Rows[3] - PIN_87 - é a linha de baixo (ÚLTIMA)
	Rows[4] - PIN_81 - sempre 1
	Rows[5] - PIN_91 - sempre 1
	Rows[6] - PIN_89 - sempre 1
*/

