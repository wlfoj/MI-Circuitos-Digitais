
/*
	Módulo para indicar de quem é a vez de ligar display.
	Faz o escalonamento das situações.
*/
module scheduler(Out, In);
	input [1:0] In;// sinal clock com frequência reduzida
	output [3:0] Out;// sinal de controle (escalonado)
	
	wire In0_Inv, In1_Inv;
	
	not Inv0(In0_Inv, In[0]);
	not Inv1(In1_Inv, In[1]);
	
	and And0(Out[0], In1_Inv, In0_Inv);
	and And1(Out[1], In1_Inv, In[0]);
	and And2(Out[2], In[1], In0_Inv);
	and And3(Out[3], In[1], In[0]);
endmodule