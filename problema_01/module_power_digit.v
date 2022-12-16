/* 
	Modulo que ascende os digitos do display 
*/ 
module module_power_digit(Out, LED_R);
	input LED_R;// LED vermelho
	output [3:0] Out;//0-Digito 4; 1-Digito 3; 2-Digito 2; 3-Digito 1
	wire High;//Sempre nivel alto
	
	ever_high	circ_out_high(High, LED_R);
	
	buf BufferD0(Out[0], LED_R);
	buf BufferD1(Out[1], High);// Para o display sempre desligado
	buf BufferD2(Out[2], High);// Para o display sempre desligado
	buf BufferD3(Out[3], High);// Para o display sempre desligado
	
endmodule
