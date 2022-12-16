/* 
        Meio Somador
		  
		*/

module sum_half(S, Cout, A, B);
input A, B;
output S, Cout;


xor Xor0(S, A, B);
and And0(Cout, A, B);

endmodule