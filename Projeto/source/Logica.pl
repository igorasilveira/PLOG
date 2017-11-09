criaTabuleiro(Tabuleiro) :-
	Tabuleiro = [
	[0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0]
].

comecaJogo(ModoJogadores, TipoJogo) :-
  criaTabuleiro(Tabuleiro),
  Jogador is 1,
  jogo(TipoJogo, ModoJogadores, Tabuleiro, Jogador, 0, 0).

trocaJogador(1, NovoJogador) :-
	NovoJogador = 2.

trocaJogador(2, NovoJogador) :-
	NovoJogador = 1.

trataTopo([NumberReceived | T], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	Tabuleiro2 = _,
	char_code(Number1, NumberReceived),
	atom_chars(Number1, Number2),
	number_chars(Number, Number2),
	insereVertical(Tabuleiro, Tabuleiro2, 0, 0, Number, Jogador),
	trocaJogador(Jogador, NovoJogador),
	jogo(TipoJogo, ModoJogadores, Tabuleiro2, NovoJogador, J1Pontos, J2Pontos).

trataDireita(Number, TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	write('Direita\n').

trataEsquerda(Number, TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	write('Esquerda\n').

trataBaixo(Number, TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	write('Baixo\n').

insereVertical([H | T], [H2 | T2], X, Y, XLimite, Simbolo) :-
	Y < 7,
	Y1 is Y + 1,
	H2 = H,
	insereEmLinha(H, H2, X, XLimite, Simbolo),
	insereVertical(T, T2, X, Y1, XLimite, Simbolo).

insereVertical(_, _, _, _, _, _).

insereEmLinha([H | T], [H2 | T2], X, XLimite, Simbolo) :-
	X == XLimite,
	X1 is X + 1,
	H2 = 0,
	insereEmLinha(T, T2, X1, XLimite, 1).

insereEmLinha([H | T], [H2 | T2], X, XLimite, Simbolo) :-
	X < 7,
	X1 is X + 1,
	H2 = 1,
	insereEmLinha(T, T2, X1, XLimite, Simbolo).

insereEmLinha(_, _, 7, _, _).
