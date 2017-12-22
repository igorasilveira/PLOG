%+++++++++++ Tabuleiro ++++++++++++%
imprimeLinha(_,_, S, S) :-
	write('\n').

imprimeLinha([H | T], Y, 0, S) :-
	write(H),
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
	write(--),
	A is X + 1,
	imprimeSeparador(A, S).

imprimeSeparador(A, A):-
	write('\n').

imprimeTabuleiro([H | T], X, XLimite, YLimite, Espacos):-
	X < YLimite,
	espaco(-5, Espacos),
	write(' |'),
	imprimeLinha(H, X, 0, XLimite),
	espaco(-5, Espacos),
	%imprimeSeparador(-1, XLimite), %--desde o indice -1, para cobrir os numeros das linhas--%
	X1 is X + 1,
	imprimeTabuleiro(T, X1, XLimite, YLimite, Espacos).

imprimeTabuleiro(_, _, _, _, _).

imprimeTabuleiro(Tabuleiro, Espacos) :-
	tamanhoTabuleiro(Tabuleiro, XLimite, YLimite),
	nl,
	%imprimeSeparador(-1, XLimite),
	imprimeTabuleiro(Tabuleiro, 0, XLimite, YLimite, Espacos).

imprimeLista(Valores, Inicio, K, Tamanho) :-
	K =< Tamanho,
	Fim is Inicio + K - 1,
	subLista(Valores, Inicio, Fim, Out),
	%write('Linha '), write(K), write(': '),
	Espacos is Tamanho - K,
	ParaImprimir = [Out],
	imprimeTabuleiro(ParaImprimir, Espacos),
	%write(Out), nl,
	K1 is K + 1,
	Inicio1 is Inicio + K,
	imprimeLista(Valores, Inicio1, K1, Tamanho).

imprimeLista(_, _, _, _).

espaco(Limite, Limite).

espaco(K, Limite) :-
	write(' '),
	K1 is K + 1,
	espaco(K1, Limite).
