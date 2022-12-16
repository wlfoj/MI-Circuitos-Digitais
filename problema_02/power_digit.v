/*
	Módulo para decidir de quem é cada vez de ascender no display
	
	Ele pega a vez indicada pelo 1 e inverte, pois o display ascende com o 0
	
	Chegando 1000 do indica vez (oq seria acionar primeiro digito)
	vai sair 0111, para acionar o primeiro digito
*/
module power_digit(display, indicador);
	input [3:0] indicador;
	output [3:0] display;
	
	not Not0(display[0], indicador[0]);
	not Not1(display[1], indicador[1]);
	not Not2(display[2], indicador[2]);
	not Not3(display[3], indicador[3]);
  
endmodule
