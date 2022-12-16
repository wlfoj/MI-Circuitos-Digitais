/*
Circuito que aciona o LED RGB correto, de acordo com o devido estado
Inclusive faz o led azul piscar na frequência do sinal do clk_1hz
*/
module Controller_RGB(LED_G, LED_R, LED_B, clk_1hz, GO, ERRO, STOP);
  input clk_1hz, GO, ERRO, STOP;
  output LED_G, LED_R, LED_B;
  
  assign LED_B = STOP & clk_1hz;
  assign LED_G = GO;
  assign LED_R = ERRO;

endmodule 