%- Desenho dos berlindes -%

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

%Informa jogador Player VS Player
informaJogador(1, 1, J1Pontos, J2Pontos) :-
	write('\nPlayer: '),
	write(1),
	write('  Pontos: '),
	write(J1Pontos),
	nl.

informaJogador(2, 1, J1Pontos, J2Pontos) :-
	write('\nPlayer: '),
	write(2),
	write('  Pontos: '),
	write(J2Pontos),
	nl.

%Informa Vitoria
informaVitoria(Jogador) :-
	write('\nPlayer '),
	write(Jogador),
	write(' won. CONGRATULATIONS!\n\n'),
	write('Press any key to continue...'),
  read_line(A),
	nl.

%Informa jogador Player VS Computer

informaJogador(1, 2) :-
	write('\nPlayer: '),
	write(1),
	write(' (HUMAN)\n\n').

informaJogador(2, 2) :-
	write('\nPlayer: '),
	write(2),
	write(' (COMPUTER)\n\n').

%Informa jogador Player VS Computer

informaJogador(1, 3) :-
	write('\nPlayer: '),
	write(1),
	write(' (COMPUTER)\n\n').

informaJogador(2, 3) :-
	write('\nPlayer: '),
	write(2),
	write(' (COMPUTER)\n\n').

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

insereBerlinde([81 | _], _, _, _, _, _, _) :-
	menuPrincipal.

insereBerlinde([113 | _], _, _, _, _, _, _) :-
	menuPrincipal.

insereBerlinde([_ | _], _, _, _, _, _, _) :-
	nl,
	write('[ERROR] Invalid option.\n\n'),
	write('Select your input cell > '),
	false.
