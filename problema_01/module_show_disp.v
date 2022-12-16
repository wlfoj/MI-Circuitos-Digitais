/* 
	Modulo para apresentar o valor no display
*/
module module_show_disp(A, B, C, D, E, F, G, P, In);
	input [4:0] In;// LEMBRAR QUE In[4] É O MAIS SIGNIFICATIVO
	output A, B, C, D, E, F, G, P; // Cada saída representa uma cor (Verde, Azul, Vermelho)
	
	wire In0_Inv, In1_Inv, In2_Inv, In3_Inv, In4_Inv, Out_And08;
	wire Out_And01, Out_And02, Out_And03, Out_And04, Out_And05, Out_And06, Out_And07;
	wire Out_And1F, Out_And2F, Out_And3F;
	
	not Inv0(In0_Inv, In[0]);
	not Inv1(In1_Inv, In[1]);
	not Inv2(In2_Inv, In[2]);
	not Inv3(In3_Inv, In[3]);
  	not Inv4(In4_Inv, In[4]);
	
	// Saida A Ok
	and And01(Out_And01, In1_Inv, In4_Inv, In[0]);
	and And02(Out_And02, In[4], In[1], In[0]);
	or Or1A(A, Out_And01, Out_And02);
	
	// Saida B Ok
	and And1B(B, In[4], In4_Inv);// Isso aqui é só para deixar a saída sempre em 0
	
	// Saida C Ok
	and And03(Out_And03, In4_Inv, In[1], In0_Inv);
	and And04(Out_And04, In[1], In0_Inv, In[3]);
	or Or1C(C, Out_And03, Out_And04);
	
	// Saida D Ok
	or Or1D(D, Out_And01, Out_And02);// é igual A
	
	// Saida E Ok
	or Or1E(E, In[0]);
	
	// Saida F
	and And1F(Out_And1F, In4_Inv, In[0]);
	and And2F(Out_And2F, In[4], In[3]);
	and And3F(Out_And3F, In[1], In0_Inv);
	or Or1F(F, Out_And1F, Out_And2F, Out_And3F);
	
	// Saida G Ok
	and And07(Out_And07, In1_Inv, In4_Inv);
	and And08(Out_And08, In[4], In[1], In[0]);
	or Or1G(G, Out_And07, Out_And08);
	
	// Saida P
	not Not1P(P, In[4]);
	
endmodule
