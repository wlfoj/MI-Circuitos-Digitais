/*
	Módulo principal da aplicação (Top-Level)
*/
module module_main(LEDs, Display, A, B, C, D, E, F, G, P, Input_D, Input_R);
	input [3:0] Input_D, Input_R;	// D-Digitado  R-Registrado
	output [2:0] LEDs;// 0-Verde  1-Azul  2-Vermelho
	output [3:0] Display;
	output A, B, C, D, E, F, G, P;//Segmentos do display
	//wire Out_A, Out_B, Out_C, Out_D, Out_E, Out_F, Out_G, Out_P, Out_OnDis;
	wire [4:0] Result_sub;//Fios para o resultado da subtração
	wire [2:0] Wire_LEDs;//Intermediário para ligar em buffer
	
	//
	module_sub 				circ_sub(.Out(Result_sub), .A(Input_R), .B(Input_D));
	module_signa 			circ_signal(.LED(Wire_LEDs), .In(Result_sub));
	module_power_digit 	circ_disp_on(.Out(Display), .LED_R(Wire_LEDs[2]));
	module_show_disp		circ_show_disp(A, B, C, D, E, F, G, P, Result_sub);
	
	/* Portas buffer para garantir energia necessária para acionar as saídas com o brilho suficiente */
	//Acionamentos do LED
	buf Buffer0(LEDs[0], Wire_LEDs[0]);
	buf Buffer1(LEDs[1], Wire_LEDs[1]);
	buf Buffer2(LEDs[2], Wire_LEDs[2]);
	//Acionamento dos segmentos
	//buf BufferA(A, Out_A);
	//buf BufferB(B, Out_B);
	//buf BufferC(C, Out_C);
	//buf BufferD(D, Out_D);
	//buf BufferE(E, Out_E);
	//buf BufferF(F, Out_F);
	//buf BufferG(G, Out_G);
	//buf Bufferp(P, Out_P);
	//Acionamento dos dígitos
	//buf BufferD0(Display[0], Out_OnDis);
	//buf BufferD1(Display[1], High);
	//buf BufferD2(Display[2], High);
	//buf BufferD3(Display[3], High);

endmodule
