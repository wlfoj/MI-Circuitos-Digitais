module mux(Out, Ctl, Occ, Liv);
	input [3:0] Occ, Liv;
	input [1:0] Ctl;
	output reg [3:0] Out;//saída
   
	// Começa com os valores zerados
	initial begin
		Out = 4'b0000;
	end
  
	// Sempre na borda de subida do clock
	always @(*) 
		begin
			case(Ctl)
				2'b00 : Out = Occ;			// 1110 digito da direita
				2'b01 : Out = 4'b1110;    //O 1101  segundo da direita (O)
				2'b10 : Out = Liv;			// 1011 segundo da esquerda
				2'b12 : Out = 4'b1111;    //L  0111 o da esquerda (L)
				default : Out = 4'b1100;//12 para sinal de erro em indica_vez
			endcase;
		end
  
endmodule
