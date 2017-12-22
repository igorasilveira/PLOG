
criaTriad(3, Tabuleiro, Posicoes) :-
  Tabuleiro = [
  %linha 1
  [-1, -1, 0, -1, -1],
  %[-1, -1, -2, -1, -1],
  %linha 2
  [-1, 0, -1, 0, -1],
  %[-1, -2, -1, -2, -1],
  %linha 3
  [0, -1, 0, -1, 0]
  ],
  Posicoes = [
  [0, 2],
  [1, 1], [1, 3],
  [2, 0], [2, 2], [2, 4]
  ].

criaTriad(5, Tabuleiro, Posicoes) :-
  Tabuleiro = [
  %linha 1
  [-1, -1, -1, -1, 0, -1, -1, -1, -1],
  %[-1, -1, -1, -1, -2, -1, -1, -1, -1],
  %linha 2
  [-1, -1, -1, 0, -1, 0, -1, -1, -1],
  %[-1, -1, -1, -2, -2, -2, -1, -1, -1],
  %linha 3
  [-1, -1, 0, -1, 0, -1, 0, -1, -1],
  %[-1, -1, -2, -2, -2, -2, -2, -1, -1],
  %linha 4
  [-1, 0, -1, 0, -1, 0, -1, 0, -1],
  %[-1, -2, -2, -2, -2, -2, -2, -2, -1],
  %linha 5
  [0, -1, 0, -1, 0, -1, 0, -1, 0]
  ],
  Posicoes = [
  [0, 4],
  [1, 3], [1, 5],
  [2, 2], [2, 4], [2, 6],
  [3, 1], [3, 3], [3, 5], [3, 7],
  [4, 0], [4, 2], [4, 4], [4, 6], [4, 8]
  ].

criaTriad(7, Tabuleiro, Posicoes) :-
  Tabuleiro = [
  %linha 1
  [-1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1],
  %[-1, -1, -1, -1, -1, -1, -2, -1, -1, -1, -1, -1, -1],
  %linha 2
  [-1, -1, -1, -1, -1, 0, -1, 0, -1, -1, -1, -1, -1],
  %[-1, -1, -1, -1, -1, -2, -2, -2, -1, -1, -1, -1, -1],
  %linha 3
  [-1, -1, -1, -1, 0, -1, 0, -1, 0, -1, -1, -1, -1],
  %[-1, -1, -1, -1, -2, -2, -2, -2, -2, -1, -1, -1, -1],
  %linha 4
  [-1, -1, -1, 0, -1, 0, -1, 0, -1, 0, -1, -1, -1],
  %[-1, -1, -1, -2, -2, -2, -2, -2, -2, -2, -1, -1, -1],
  %linha 5
  [-1, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, -1],
  %[-1, -1, -2, -2, -2, -2, -2, -2, -2, -2, -2, -1, -1],
  %linha 6
  [-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1],
  %[-1, -2, -1, -2, -1, 0, -1, -2, -1, 0, -1, -2, -1],
  %linha 7
  [0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0]
  ],
  Posicoes = [
  [0, 6],
  [1, 5], [1, 7],
  [2, 4], [2, 6], [2, 8],
  [3, 3], [3, 5], [3, 7], [3, 9],
  [4, 2], [4, 4], [4, 6], [4, 8], [4, 10],
  [5, 1], [5, 3], [5, 5], [5, 7], [5, 9], [5, 11],
  [6, 0], [6, 2], [6, 4], [6, 6], [6, 8], [6, 10], [6, 12]
  ].


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
