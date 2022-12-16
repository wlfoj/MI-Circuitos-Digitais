module decodificador( A, B, C, D, E, F, G, P, In);
	input [3:0] In;
	output  A, B, C, D, E, F, G, P;

	wire In0_Inv, In1_Inv, In2_Inv, In3_Inv;

	not Not1(In0_Inv, In[0]);
	not Not2(In1_Inv, In[1]);
	not Not3(In2_Inv, In[2]);
	not Not4(In3_Inv, In[3]);

	// segmento A
	wire Wire1, Wire2, Wire4;
	and And1(Wire1, In[3], In[0]);
	and And2(Wire2, In[2], In1_Inv, In0_Inv);
	and And4(Wire4, In2_Inv, In1_Inv, In[0]);
	or   Or1(A, Wire1, Wire2, Wire4);  // Tirar uma and 0110 e um fio

	// segmento B
	wire Wire5, Wire6, Wire7;
	and And5(Wire5, In[3], In[0]);
	and And6(Wire6, In[2],In1_Inv , In[0]);
	and And7(Wire7, In3_Inv, In[2], In[1], In0_Inv);
	or    Or2( B, Wire5, Wire6, Wire7);


	// segmento C
	wire Wire8, Wire9;
	and And8(Wire8, In[3], In[0]);
	and And9(Wire9, In3_Inv, In2_Inv, In[1],In0_Inv);
	or    Or3( C, Wire8, Wire9);

	// segmento D
	wire Wire10, Wire11, Wire12;
	and And10(Wire10, In[2], In1_Inv, In0_Inv);
	and And11(Wire11, In3_Inv, In2_Inv, In1_Inv, In[0]);
	and And12(Wire12, In3_Inv, In[2], In[1], In[0]);
	or    Or4(D, Wire10, Wire11, Wire12);

	// segmento E
	wire Wire13, Wire14, Wire15;
	and And13(Wire13, In[2], In1_Inv);
	and And14(Wire14, In1_Inv, In[0]);
	and And15(Wire15, In3_Inv, In[1], In[0]);
	or Or5(E, Wire13, Wire14, Wire15);

	// segmento F
	wire Wire16, Wire17, Wire18;
	and And16(Wire16, In3_Inv, In2_Inv, In1_Inv, In[0]);
	and And17(Wire17, In3_Inv, In2_Inv, In[1]);
	and And18(Wire18, In3_Inv, In[1], In[0]);
	or Or6(F, Wire16, Wire17, Wire18);

	// segmento G
	wire Wire19, Wire20, Wire21;
	and And19(Wire19, In3_Inv, In2_Inv,In1_Inv);
	and And20(Wire20, In3_Inv, In[2], In[1], In[0]);
	and And21(Wire21, In[3], In[2]);
	or Or7(G, Wire19, Wire20, Wire21);

	// semento P
	or Or8(P,In3_Inv, In[3]);


endmodule