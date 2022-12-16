// somador 3bit

module sum3bit(S, A, B);
input [2:0] A, B;
output [3:0] S;


wire c1, c2, c3; // sao os cout que conectam cada somador

sum_half 	 circuito0(.S(S[0]), .Cout(c1), .A(A[0]), .B(B[0])); 
sum_complete circuito1(.S(S[1]), .Cout(c2), .A(A[1]), .B(B[1]), .Cin(c1));
sum_complete circuito2(.S(S[2]), .Cout(S[3]), .A(A[2]), .B(B[2]), .Cin(c2));

// Cout ligado ao somador 

endmodule 