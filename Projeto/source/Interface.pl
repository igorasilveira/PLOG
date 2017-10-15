:- include('Utilitarios.pl').

%+++++++++++ Tabuleiro ++++++++++++%	

imprimeNCol(0, 0, S) :-
	write('   | '),
	write('0 | '),	
	imprimeNCol(0, 1, S).
	
imprimeNCol(0, Y, S) :-
	Y < S,
	write(Y),
	write(' | '),
	Y1 is Y + 1,
	imprimeNCol(0, Y1, S).

imprimeNCol(0, S, S) :-
	write('\n'),
	imprimeSeparador(-1, S).

imprimeNCol(_, _, _).


imprimeLinha(_,_, S, S) :-
	write('\n').	

imprimeLinha([H | T], Y, 0, S) :-
	write(' '),
	write(Y),
	write(' |'),
	interpreta(H),
	write('|'),
	imprimeLinha(T, Y, 1, S).

imprimeLinha([H | T], Y, X, S) :- 
	X < S,
	write(H),
	write('|'),
	A is X + 1,
	imprimeLinha(T, Y, A, S).

imprimeLinha(_, A, A, _) :-
	write('\n').

	
imprimeSeparador(X, S) :-
	X < S,
	write(----),
	A is X + 1,
	imprimeSeparador(A, S).

imprimeSeparador(A, A):-
	write('\n').

imprimeTabuleiro([H | T], X, XLimite, YLimite):-
	X < YLimite,
	imprimeNCol(X, 0, XLimite),
	imprimeLinha(H, X, 0, XLimite),
	imprimeSeparador(-1, XLimite), %--desde o indice -1, para cobrir os numeros das linhas--% 
	X1 is X + 1,
	imprimeTabuleiro(T, X1, XLimite, YLimite).
	
imprimeTabuleiro(_, _, _, _).

imprimeTabuleiro(Tabuleiro) :-
	tamanhoTabuleiro(Tabuleiro, XLimite, YLimite),
	imprimeTabuleiro(Tabuleiro, 0, XLimite, YLimite).