/*
	Meio Subtrator
*/
module sub_half(Out, Carry_Out, A, B);
	input A, B;
	output Out, Carry_Out;

	wire A_Inv;
	
	not Inv0(A_Inv, A);
	
	xor Xor0(Out, A, B);
	and And0(Carry_Out, A_Inv, B);
	
endmodule
