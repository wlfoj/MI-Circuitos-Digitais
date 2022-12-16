/*
Módulo para decidir de quem é cada vez de ascender no display.
Inverte as saídas do escalonador, pois os digitos são acionados com 0.
Se ON for 0, todos os digitos ficam desligados (ALTO)
	
*/
module Turn_On_Digit(digit, indicador, ON);
	input [3:0] indicador;
	input ON;
	output [3:0] digit;
	
  	// Se ON for 0, todos digitos ficam em nivel ALTO (Apagados)
  	assign digit[0] = ~indicador[0] | ~ON;
  	assign digit[1] = ~indicador[1] | ~ON;
  	assign digit[2] = ~indicador[2] | ~ON;
  	assign digit[3] = ~indicador[3] | ~ON;
	
  
endmodule 