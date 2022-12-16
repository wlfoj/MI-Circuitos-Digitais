
/*
*/
module MEF_Principal_DEBUG ( STERRO, STSTOP, STGO, STFULL, IN_PASW, clk, Si, Se, Sc, IN, ERRO, OK);
	input clk, Si, Se, Sc, IN, ERRO, OK;
	output STERRO, STSTOP, STGO, STFULL, IN_PASW;
	reg [2:0] state , nextstate ;
	parameter I = 3'b000 ;//Inicio
	parameter S = 3'b001 ;//Senha
	parameter A = 3'b010 ;//Acesso
	parameter P = 3'b011 ;//Pare
	parameter E = 3'b100 ;//Erro
	parameter C = 3'b101 ;//Cheio

	// Inicia o estado

	// Lóogica para mudança de estado
	always @ ( posedge clk )
		state <= nextstate ;

	// Lógica para o próximo estado
	always @ (*)
		case ( state )
			I : // Inicial - feito
				if ( (~Se) & (~Sc) ) begin
					nextstate = I ;
				end
				else if ((Se) & (~Sc)) begin
					nextstate = S ;
				end
				else begin
					nextstate = C ;
				end
			// Senha - feito
			S :  
				if ( (~Sc)&(~IN)&(~ERRO)&(~OK)) begin
					nextstate = S ;
				end
				else if ((~Sc)&(~IN)&(~ERRO)&(OK)) begin
					nextstate = A ;
				end
				else if (((~Sc)&(~IN)&(ERRO)&(~OK)) | (~Sc)&(~IN)&(ERRO)&(OK)) begin
					nextstate = E ;
				end
				else if (Sc) begin//////////
					nextstate = C ;
				end
				else begin
					nextstate = I ;
				end
			// ACESSO
			A :  
				if ( ((Se)&(~Si)) |((~Se)&(~Si)) ) begin
					nextstate = A ;
				end
				else if ((Se) & (Si)) begin
					nextstate = P ;
				end
				else begin
					nextstate = I ;
				end
				// C  - feito
			C :  
				if ( Sc ) begin
					nextstate = C ;
				end
				else begin
					nextstate = I ;
				end
	//PARE - feito
			P :  
				if ( (Se)&(Si) ) begin
					nextstate = P ;
				end
				else begin
					nextstate = I ;
				end
	// ERRO - feito
			E :  
				if ( ((~Sc)&(~IN)&(~ERRO)&(~OK)) | (~Sc)&(~IN)&(ERRO)&(~OK) | (~Sc)&(~IN)&(ERRO)&(OK) ) begin
					nextstate = E ;
				end
				else if ((~Sc)&(~IN)&(~ERRO)&(OK)) begin
					nextstate = A ;
				end
				else if (Sc) begin
					nextstate = C ;
				end
				else begin
					nextstate = I ;
				end
	//
			default : nextstate = I ;
	endcase
	
	// Lógica para o pulso
	assign STERRO = ( state == E ) ;//
	assign STFULL = ( state == C ) ;//
	assign STSTOP = ( state == P ) ;//
	assign STGO = 	 ( state == A ) ;//
	assign IN_PASW = ( state == S ) | ( state == E ) ;//
endmodule
