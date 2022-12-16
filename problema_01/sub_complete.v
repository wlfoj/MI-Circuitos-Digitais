/*
	Subtrator completo
*/
module sub_complete(Out, Carry_Out, A, B, Carry_In);
	input A, B, Carry_In;
	output Out, Carry_Out;

	wire Out_Xor0, A_Inv, Out_And0, Out_And1, Out_And2;
	
	not Inv0(A_Inv, A);

	xor Xor0(Out_Xor0, A, B);
	xor Xor1(Out, Out_Xor0, Carry_In);

	and And0(Out_And0, A_Inv, B);
	and And1(Out_And1, A_Inv, Carry_In);
	and And2(Out_And2, B, Carry_In);
	or Or0(Carry_Out, Out_And0, Out_And1, Out_And2);
endmodule
