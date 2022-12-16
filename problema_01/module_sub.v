/* Modulo completo para um subtrator de 4 bits
	Seguindo o projeto apresentado no livro 

	Subtração = A - B
*/
module module_sub(Out, A, B);
	// A-Senha registrada / B-Senha digitada
	input [3:0] A, B;
	output [4:0] Out;
	wire T1, T2, T3;
	
	sub_half 	 circuito0 (.Out(Out[0]), .Carry_Out(T1), .A(A[0]), .B(B[0]));
	sub_complete circuito1 (.Out(Out[1]), .Carry_Out(T2), .A(A[1]), .B(B[1]), .Carry_In(T1));
	sub_complete circuito2 (.Out(Out[2]), .Carry_Out(T3), .A(A[2]), .B(B[2]), .Carry_In(T2));
	sub_complete circuito3 (.Out(Out[3]), .Carry_Out(Out[4]), .A(A[3]), .B(B[3]), .Carry_In(T3));

endmodule
