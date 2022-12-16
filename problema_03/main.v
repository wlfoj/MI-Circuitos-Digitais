module main ( Digitos, Segmentos, RGB, Cancela, CLK_FPGA, Si, Se, Sc, Btn, DIGITE_SENHA);
	// Clock da placa e sensor interno, externo e de estacionamento cheio
	input CLK_FPGA, Si, Se, Sc;
	// Botões para a senha
	input [3:0] Btn;
	// Saídas que representam Cancela aberta e que está esperando a senha, respectivamente
	output Cancela, DIGITE_SENHA;
	//
	output [2:0] RGB;
	output [3:0] Digitos;
	output [6:0] Segmentos;
	// Sinais de clock
	wire CLK_1Hz, CLK_P;
	// Para o Debounce dos botões	e a codificação
	wire [3:0] Pulses;
	wire  [1:0] Cods;
	wire EN;
	// Saidas da maquina de senha
	wire out_senha_inativo, out_senha_erro, out_senha_certo, out_count_time;
	// Saidas da maquina principal
	wire out_princ_erro, out_princ_pare, out_princ_siga, out_princ_cheio;
	wire EM_SENHA;
	//Pulso de 20 segundos de inatividade
	wire pulse_20s;
	// estados codificados e o clock em 2 bits para controle do display
	wire [1:0] st_cods, CLK_div;
	// Indicador de quando ligar o display
	wire on_display;
	// Indicdor de qual digito será acionado
	wire [3:0] indicador;
	
	// Dividindo a frequência de clock da placa para poder utilizar nas MEF's
	Primeiro_Divisor divisor_c(CLK_P, CLK_FPGA);
	
	// Etapa de Debounce
	LevelToPulseMoore l0(CLK_P, ~Btn[0], Pulses[0]);
	LevelToPulseMoore l1(CLK_P, ~Btn[1], Pulses[1]);
	LevelToPulseMoore l2(CLK_P, ~Btn[2], Pulses[2]);
	LevelToPulseMoore l3(CLK_P, ~Btn[3], Pulses[3]);
	
	// Etapa de codificação dos botões	
	Codificador_Botoes codificador1(Cods, EN, Pulses);
	
	// Entrando na máquina principal
	MEF_Principal_DEBUG mef1(out_princ_erro, out_princ_pare, out_princ_siga, out_princ_cheio, EM_SENHA, CLK_P, Si, Se, Sc, out_senha_inativo, out_senha_erro, out_senha_certo);
	
	// Entrando na máquina de senha
	MEF_Senha_DEBUG mef2(out_senha_inativo, out_senha_certo, out_senha_erro, out_count_time, CLK_P, Cods, EN, pulse_20s, EM_SENHA);
	
	// Etapa de controle dos RGB 
	Controller_RGB	controller1(RGB[1], RGB[0], RGB[2], CLK_1Hz, out_princ_siga, out_princ_erro, out_princ_pare);
	
	// Etapa para controle da cancela
	Controller_Cancela	controller2( Cancela, out_princ_siga);
	
	// Etapa para exibição no display
	Codificador_Estados	codificador2(st_cods, out_princ_erro, out_princ_pare, out_princ_siga, out_princ_cheio);
	Divisor_Frequencia	divisor_freq(CLK_div, CLK_FPGA);
	Decodificador_Segmentos decoder1( Segmentos, st_cods, CLK_div);
		// ACIONANDO OS DIGITOS
	On_Display	on_off_display(on_display, out_princ_siga, out_princ_erro, out_princ_pare, out_princ_cheio);
	Scheduler	escalonador_digito(indicador, CLK_div);
	Turn_On_Digit	hh(Digitos, indicador, on_display);
	
	// Etapa para controle de inatividade
	Divisor_Frequencia_1Hz divisor_1hz(CLK_1Hz, CLK_FPGA, out_count_time, out_princ_pare);
	Temporizador_20s timer(pulse_20s, CLK_P, out_count_time);
	
	
	assign DIGITE_SENHA = EM_SENHA;
endmodule
