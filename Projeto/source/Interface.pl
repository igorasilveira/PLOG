%- Desenho dos berlindes -%
interpreta(3) :-
	write(' '),
	write('#'),
	write(' ').

interpreta(2) :-
	write(' '),
	write('@'),
	write(' ').

interpreta(1) :-
	write(' '),
	write('*'),
	write(' ').

interpreta(0) :-
	write('   ').

interpreta(_) :-
	write(' err ').

%- Desenho do Tabuleiro -%

imprimeNColTop(0, 0, S) :-
	write('    |'),
	write(' A0|'),
	imprimeNColTop(0, 1, S).

imprimeNColTop(0, Y, S) :-
	Y < S,
	write('A'),
	write(Y),
	write(' |'),
	Y1 is Y + 1,
	imprimeNColTop(0, Y1, S).

imprimeNColTop(0, S, S) :-
	write('\n'),
	imprimeSeparador(-1, S).

imprimeNColTop(_, _, _).

imprimeNColBot(7, 0, S) :-
	write('    |'),
	write(' C0| '),
	imprimeNColBot(7, 1, S).

imprimeNColBot(7, Y, S) :-
	Y < S,
	write('C'),
	write(Y),
	write('| '),
	Y1 is Y + 1,
	imprimeNColBot(7, Y1, S).

imprimeNColBot(7, S, S) :-
	write('\n').

imprimeNColBot(_, _, _).

imprimeLinha(_, Y, S, S) :-
	write('   D'),
	write(Y),
	write('\n').

imprimeLinha([H | T], Y, 0, S) :-
	write(' B'),
	write(Y),
	write(' |'),
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
	write(-----),
	A is X + 1,
	imprimeSeparador(A, S).

imprimeSeparador(A, A):-
	write('\n').

imprimeTabuleiro([H | T], X):-
	X < 7,
	imprimeNColTop(X, 0, 7),
	imprimeLinha(H, X, 0, 7),
	imprimeSeparador(-1, 7),
	X1 is X + 1,
	imprimeNColBot(X1, 0, 7),
	imprimeTabuleiro(T, X1).

imprimeTabuleiro(_, _).

imprimeTabuleiro(Tabuleiro) :-
	limpaEcra,
  imprimeTitulo,
	imprimeTabuleiro(Tabuleiro, 0).

imprimeTitulo :-
	limpaEcra,
	novaLinha(3),
	write('*****************************\n'),
	write('---        SHIFTAGO       ---\n'),
	write('*****************************\n'),
	novaLinha(3).

imprimeExit :-
	nl,
  write('*****************************\n'),
  write('--- Now Exiting, goodbye! ---\n'),
  write('*****************************\n'),
  novaLinha(2).

imprimeGameOver :-
	nl, nl,
  write('*****************************\n'),
  write('---ITS A DRAW, DEAD BOARD!---\n'),
  write('*****************************\n\n'),
	abort.

%Informa Vitoria
informaVitoria(Jogador) :-
	write('\n\nPlayer '),
	write(Jogador),
	write(' won. CONGRATULATIONS!\n\n'),
	write('Press any key to continue...'),
  read_line(A),
	nl.

%Informa jogador Player VS Player
informaJogador(Jogador, 1, J1Pontos, J2Pontos) :-
	write('\n\nIS PLAYER '),
	write(Jogador),
	write(' TURN TO PLAY\n'),
	write('\nPlayer: '),
	write(1),
	write('  Pontos: '),
	write(J1Pontos),
	nl,
	write('\nPlayer: '),
	write(2),
	write('  Pontos: '),
	write(J2Pontos),
	nl.
%Informa jogador Player VS Computer

informaJogador(1, 2, J1Pontos, J2Pontos) :-
	write('\n\nIS PLAYER '),
	write(1),
	write(' [HUMAN] TURN TO PLAY\n'),
	write('\nPlayer: '),
	write(1),
	write('  Pontos: '),
	write(J1Pontos),
	nl,
	write('\nPlayer: '),
	write(2),
	write('  Pontos: '),
	write(J2Pontos),
	nl.

informaJogador(2, 2, J1Pontos, J2Pontos) :-
	write('\n\nIS PLAYER '),
	write(2),
	write(' [COMPUTER] TURN TO PLAY\n'),
	write('\nPlayer: '),
	write(1),
	write('  Pontos: '),
	write(J1Pontos),
	nl,
	write('\nPlayer: '),
	write(2),
	write('  Pontos: '),
	write(J2Pontos),
	nl.

%Informa jogador Computer VS Computer

informaJogador(Jogador, 3, J1Pontos, J2Pontos) :-
 write('\n\nIS PLAYER '),
 write(Jogador),
 write(' [COMPUTER] TURN TO PLAY\n'),
 write('\nPlayer: '),
 write(1),
 write('  Pontos: '),
 write(J1Pontos),
 nl,
 write('\n\nPlayer: '),
 write(2),
 write('  Pontos: '),
 write(J2Pontos),
 nl.

%A
insereBerlinde([65 | Number], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	trataTopo(Number, TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%B
insereBerlinde([66 | Number], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	trataEsquerda(Number, TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%C
insereBerlinde([67 | Number], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	trataBaixo(Number, TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%D
insereBerlinde([68 | Number], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	trataDireita(Number, TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%a
insereBerlinde([97 | Number], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	trataTopo(Number, TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%b
insereBerlinde([98 | Number], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	trataEsquerda(Number, TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%c
insereBerlinde([99 | Number], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	trataBaixo(Number, TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%d
insereBerlinde([100 | Number], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	trataDireita(Number, TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%A
processaRemocao([65 | Number1], [65 | Number2], ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	getSmaller(Number1, Number2, XInicial, XFinal),
	XInicialFinal is XInicial + 1,
	XFinalFinal is XFinal + 1,
	repeat,
	Y = _,
	pedirColunaLinhaRemocao(1, Y),
	verCasa(Tabuleiro, Y, XInicial, Peca),
	ite(Peca == Jogador, true, (write('\nThat sequence does not belong to you!\n'), false)),
	removerHorizontal(XInicialFinal, XFinalFinal, Y, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%B
processaRemocao([66 | Number1], [66 | Number2], ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	getSmaller(Number1, Number2, YInicial, YFinal),
	YInicialFinal is YInicial + 1,
	YFinalFinal is YFinal + 1,
	repeat,
	X = _,
	pedirColunaLinhaRemocao(2, X),
	verCasa(Tabuleiro, YInicial, X, Peca),
	ite(Peca == Jogador, true, (write('\nThat sequence does not belong to you!\n'), false)),
	removerVertical(YInicialFinal, YFinalFinal, X, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%C
processaRemocao([67 | Number1], [67 | Number2], ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	getSmaller(Number1, Number2, XInicial, XFinal),
	XInicialFinal is XInicial + 1,
	XFinalFinal is XFinal + 1,
	repeat,
	Y = _,
	pedirColunaLinhaRemocao(1, Y),
	verCasa(Tabuleiro, Y, XInicial, Peca),
	ite(Peca == Jogador, true, (write('\nThat sequence does not belong to you!\n'), false)),
	removerHorizontal(XInicialFinal, XFinalFinal, Y, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%D
processaRemocao([68 | Number1], [68 | Number2], ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	getSmaller(Number1, Number2, YInicial, YFinal),
	YInicialFinal is YInicial + 1,
	YFinalFinal is YFinal + 1,
	repeat,
	X = _,
	pedirColunaLinhaRemocao(2, X),
	verCasa(Tabuleiro, YInicial, X, Peca),
	ite(Peca == Jogador, true, (write('\nThat sequence does not belong to you!\n'), false)),
	removerVertical(YInicialFinal, YFinalFinal, X, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%a
processaRemocao([97 | Number1], [97 | Number2], ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	getSmaller(Number1, Number2, XInicial, XFinal),
	XInicialFinal is XInicial + 1,
	XFinalFinal is XFinal + 1,
	repeat,
	Y = _,
	pedirColunaLinhaRemocao(1, Y),
	verCasa(Tabuleiro, Y, XInicial, Peca),
	ite(Peca == Jogador, true, (write('\nThat sequence does not belong to you!\n'), false)),
	removerHorizontal(XInicialFinal, XFinalFinal, Y, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%b
processaRemocao([98 | Number1], [98 | Number2], ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	getSmaller(Number1, Number2, YInicial, YFinal),
	YInicialFinal is YInicial + 1,
	YFinalFinal is YFinal + 1,
	repeat,
	X = _,
	pedirColunaLinhaRemocao(2, X),
	verCasa(Tabuleiro, YInicial, X, Peca),
	ite(Peca == Jogador, true, (write('\nThat sequence does not belong to you!\n'), false)),
	removerVertical(YInicialFinal, YFinalFinal, X, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%c
processaRemocao([99 | Number1], [99 | Number2], ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	getSmaller(Number1, Number2, XInicial, XFinal),
	XInicialFinal is XInicial + 1,
	XFinalFinal is XFinal + 1,
	repeat,
	Y = _,
	pedirColunaLinhaRemocao(1, Y),
	verCasa(Tabuleiro, Y, XInicial, Peca),
	ite(Peca == Jogador, true, (write('\nThat sequence does not belong to you!\n'), false)),
	removerHorizontal(XInicialFinal, XFinalFinal, Y, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%d
processaRemocao([100 | Number1], [100 | Number2], ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	getSmaller(Number1, Number2, YInicial, YFinal),
	YInicialFinal is YInicial + 1,
	YFinalFinal is YFinal + 1,
	repeat,
	X = _,
	pedirColunaLinhaRemocao(2, X),
	verCasa(Tabuleiro, YInicial, X, Peca),
	ite(Peca == Jogador, true, (write('\nThat sequence does not belong to you!\n'), false)),
	removerVertical(YInicialFinal, YFinalFinal, X, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

processaRemocao(Choice1, Choice2, Choice3, Choice4, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Tipo) :-
	getSmaller(Choice1, Choice2, XInicial, XFinal),
	getSmaller(Choice3, Choice4, YInicial, YFinal),
	XInicialFinal is XInicial + 1,
	YInicialFinal is YInicial + 1,
	XFinalFinal is XFinal + 1,
	YFinalFinal is YFinal + 1,
	ite(Tipo == 1, verCasa(Tabuleiro, YInicial, XInicial, Peca), verCasa(Tabuleiro, YFinal, XInicial, Peca)),
	ite(Peca == Jogador, true, (write('\nThat sequence does not belong to you!\n'), false)),
	removerDiagonal(XInicialFinal, XFinalFinal, YInicialFinal, YFinalFinal, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Tipo).

processaRemocao([_ | _], [_ | _], _, _, _, _, _) :-
	nl,
	write('[ERROR] Invalid options.\n\n'),
	false.
