interpreta(-1) :-
	write('   ').

interpreta(-2) :-
	write(' - ').

interpreta(0) :-
	write('( )').

interpreta(N) :-
	write(' '),
	write(N),
	write(' ').
%+++++++++++ Tabuleiro ++++++++++++%
imprimeLinha(_,_, S, S) :-
	write('\n').

imprimeLinha([H | T], Y, 0, S) :-
	write(' '),
	interpreta(H),
	write('|'),
	imprimeLinha(T, Y, 1, S).

imprimeLinha([H | T], Y, X, S) :-
	X < S,
	interpreta(H),
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
	imprimeLinha(H, X, 0, XLimite),
	imprimeSeparador(-1, XLimite), %--desde o indice -1, para cobrir os numeros das linhas--%
	X1 is X + 1,
	imprimeTabuleiro(T, X1, XLimite, YLimite).

imprimeTabuleiro(_, _, _, _).

imprimeTabuleiro(Tabuleiro) :-
	tamanhoTabuleiro(Tabuleiro, XLimite, YLimite),
	imprimeSeparador(-1, XLimite),
	imprimeTabuleiro(Tabuleiro, 0, XLimite, YLimite).
