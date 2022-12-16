/*
Somador completo
*/
module sum_complete(S, Cout, A, B, Cin);
input A, B, Cin;
output S, Cout;

wire Out_And0, Out_And1, Out_And2, Out_And3, Out_And4, Out_And5, Out_And6, Out_And7;

wire A_Inv, B_Inv, Cin_Inv;

not Inv0(A_Inv, A);
not Inv1(B_Inv, B);
not Inv2(Cin_Inv, Cin);

// saída S
and And0(Out_And0, A_Inv, B_Inv, Cin);
and And1(Out_And1, A_Inv, B, Cin_Inv);
and And2(Out_And2, A, B_Inv, Cin_Inv);
and And3(Out_And3, A, B, Cin);
or Or1(S, Out_And0, Out_And1, Out_And2, Out_And3);

// saída Cout
and And4(Out_And4, A_Inv, B, Cin);
and And5(Out_And5, A, B_Inv, Cin);
and And6(Out_And6, A, B, Cin_Inv);
and And7(Out_And7, A, B, Cin);
or Or2(Cout, Out_And4, Out_And5, Out_And6, Out_And7);
endmodule