// Módulo para tratar o bouncing dos botões com MEF de Moore
module LevelToPulseMoore(CLK_FPGA, Btn, Pulse);
	input CLK_FPGA, Btn;
	output Pulse;
	
	reg [1:0] state, nextstate;
	
	parameter A =2'b00;
	parameter B =2'b01;
	parameter C =2'b10;
	

	
	// state register
	always @ ( posedge CLK_FPGA)	
		state <= nextstate ;
		
	// next state logic
	always @ (*)
		case ( state )
			A : if ( Btn ) nextstate <= B ;
			else nextstate <= A ;
			B : if ( Btn ) nextstate <= C ;
			else nextstate <= A ;
			C : if ( Btn ) nextstate <= C ;
			else nextstate <= A ;
			default : nextstate <= A ;
			
		endcase
		
	// output logic
	assign Pulse = ( state == B ) ;
	endmodule