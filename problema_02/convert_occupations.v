/*
	Módulo para converter, em binário, se 4 vagas estão sendo utilizadas
*/
module convert_occupations(Qtd, In);
	input [3:0] In;// Barramento indicando se a vaga está Ocupada ou vazia
	output [2:0] Qtd;// Quantidade de vagas ocupadas
   
	wire In0_Inv, In1_Inv, In2_Inv, In3_Inv;
	wire Wire1, Wire2, Wire3, Wire4, Wire5, Wire6, Wire7, Wire8, Wire9, Wire10;
	
	not Inv0(In0_Inv, In[0]);
	not Inv1(In1_Inv, In[1]);
	not Inv2(In2_Inv, In[2]);
	not Inv3(In3_Inv, In[3]);
	
	// Bit LSB
	and And1(Wire1, In3_Inv, In2_Inv, In1_Inv, In[0]);
	and And2(Wire2, In3_Inv, In2_Inv, In[1], In0_Inv);
	and And3(Wire3, In3_Inv, In[2], In1_Inv, In0_Inv);
	and And4(Wire4, In3_Inv, In[2], In[1], In[0]);
	and And5(Wire5, In[3], In[2], In1_Inv, In[0]);
	and And6(Wire6, In[3], In[2], In[1], In0_Inv);
	and And7(Wire7, In[3], In2_Inv, In1_Inv, In0_Inv);
	and And8(Wire8, In[3], In2_Inv, In[1], In[0]);
	or Or1(Wire9, Wire1, Wire2, Wire3, Wire4);
	or Or2(Wire10, Wire5, Wire6, Wire7, Wire8);
	or Or3(Qtd[0], Wire9, Wire10);
	
	// Bit MSB
	and And0(Qtd[2], In[3], In[2], In[1], In[0]);
	
	// Bit meio
	wire Wire11, Wire12, Wire13, Wire14, Wire15, Wire16, Wire17, Wire18, Wire19;
	and And9(Wire11, In3_Inv, In[1], In[0]);
	and And10(Wire12, In[2], In1_Inv, In[0]);
	and And11(Wire13, In[3], In1_Inv, In[0]);
	and And12(Wire14, In[2], In[1], In0_Inv);
	and And13(Wire15, In[3], In[1], In0_Inv);
	and And14(Wire16, In[3], In[2], In1_Inv);
	and And15(Wire17, In[3], In2_Inv, In[0]);
	or Or4(Wire18, Wire11, Wire12, Wire13, Wire14);
	or Or5(Wire19, Wire15, Wire16, Wire17);
	or Or6(Qtd[1], Wire18, Wire19);
	
  
endmodule
