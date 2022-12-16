/*
1ºLINHA - PIN_85
CH7 -> L04 - 1º COLUNA - PIN_82
CH6 -> L05 - 2º COLUNA - PIN_78

2º LINHA - PIN_83
CH5 -> L09 - 1º COLUNA
CH4 -> L10 - 2º COLUNA

3º LINHA - PIN_84
CH2 -> L15 - 2º COLUNA
CH3 -> L14 - 1º COLUNA

4º LINHA - PIN_87
CH0 -> L20 - 2º COLUNA
CH1 -> L19 - 1º COLUNA
*/

/*
as linhas chegam 1000 (o 1 indica que é a vez da ultima linhas)
mas para ir pra matriz tem ir 0 aí inverte tudo (0111)
*/

/*
Ver se pode até quanto de tensão negativa*/
module control_matriz(Row_Out, Col_Out, Row_In, CH);
	input [7:0] CH;//As chaves
	input [3:0] Row_In;// Isso aqui é o indica_vez na forma ex: 1000
	
	output [6:0] Row_Out;
	output [1:0] Col_Out;
   
	// Inversão das linhas, para ficar com 0 para ascender com o ddp. 0111
	not Inv0(Row_Out[0], Row_In[0]);
	not Inv1(Row_Out[1], Row_In[1]);
	not Inv2(Row_Out[2], Row_In[2]);
	not Inv3(Row_Out[3], Row_In[3]);
	
	// Col0 - esquerda
	wire Wire1, Wire2, Wire3, Wire4;
	and And1(Wire1, Row_In[0], CH[7]);// Linha superior (1º
	and And2(Wire2, Row_In[1], CH[5]);
	and And3(Wire3, Row_In[2], CH[3]);
	and And4(Wire4, Row_In[3], CH[1]);// Linha mais a baixo (4º
	or Or1(Col_Out[0], Wire1, Wire2, Wire3, Wire4);
	
	// Col1 - direita
	wire Wire5, Wire6, Wire7, Wire8;
	and And5(Wire5, Row_In[0], CH[6]);// Linha superior (1º
	and And6(Wire6, Row_In[1], CH[4]);
	and And7(Wire7, Row_In[2], CH[2]);
	and And8(Wire8, Row_In[3], CH[0]);// Linha mais a baixo (4º
	or Or2(Col_Out[1], Wire5, Wire6, Wire7, Wire8);
	
	// MANTENDO AS LINHAS TUDO EM NÍVEL ALTO PARA NÃO LIGAR
	wire High, CH_Inv;
	not Inv00(CH_Inv, CH[0]);
	or OR11(High, CH[0], CH_Inv);// 1 em booleano
	
	and AND_R4(Row_Out[4], High, High);
	and AND_R5(Row_Out[5], High, High);
	and AND_R6(Row_Out[6], High, High);
  
endmodule

/*	MAPA DAS VAGAS
	CH7	CH6 		LINHA - 0111
	CH5	CH4 		LINHA - 1011
	CH3	CH2 		LINHA - 1101
	CH1	CH0 		LINHA - 1110
	1		1
	1		1
	1		1
*/
