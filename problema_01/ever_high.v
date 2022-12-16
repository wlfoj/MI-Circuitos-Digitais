/*
Módulo para fornecer uma saída sempre em nível lógico alto
*/
module ever_high(Out, In);
	input In;
	output Out;
	
	wire In_Inv;
	
	not InvLed(In_Inv, In);
	
	or OR01(Out, In_Inv, In);
	
endmodule
