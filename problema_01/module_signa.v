/*
	Módulo para acionar o LED RGB na cor correta
*/
module module_signa(LED, In);
	input [4:0] In;// Resultado da subtração
	output [2:0] LED;// 0 Verde; 1 Azul; 2 Vermelho

	wire In0_Inv, In1_Inv, In2_Inv, In3_Inv, In4_Inv, LEDG_Inv, LEDB_Inv;
	wire Out_Nand0, Out_And00, Out_And01, Out_And02, Out_And03;
	
	not Inv0(In0_Inv, In[0]);
	not Inv1(In1_Inv, In[1]);
	not Inv2(In2_Inv, In[2]);
	not Inv3(In3_Inv, In[3]);
  	not Inv4(In4_Inv, In[4]);
	
	//Sinaliza o verde quando a as entradas forem 0 (representa que as senhas são iguais)
  	and And06(LED[0], In0_Inv, In1_Inv, In2_Inv, In3_Inv, In4_Inv);//Ok
	
	//Sinaliza o LED azul quando a diferença estiver entre -3 e +3, excluindo o 0
  	and And00(Out_And00, In4_Inv, In3_Inv, In2_Inv, In[0]);
	and And01(Out_And01, In4_Inv, In3_Inv, In2_Inv, In[1]);

	and And02(Out_And02, In[4], In[3], In[2], In[1]);
	and And03(Out_And03, In[4], In[3], In[2], In[0]);
	
	or Or01(LED[1], Out_And00, Out_And01, Out_And02, Out_And03);

	//Sinaliza o LED vermelho se não for nenhum dos casos acima
	not Inv5(LEDG_Inv, LED[0]);
	not Inv6(LEDB_Inv, LED[1]);
	and And05(LED[2], LEDB_Inv, LEDG_Inv);
	
endmodule
