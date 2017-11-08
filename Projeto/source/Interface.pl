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
	novaLinha(3),
	write('*****************************\n'),
	write('---        SHIFTAGO       ---\n'),
	write('*****************************\n'),
	novaLinha(3).

informaJogador(Jogador) :-
	write('\nPlayer: '),
	write(Jogador),
	write('\n\n').


escolheCelula('A0') :-
	write('A0\n').

escolheCelula('A1') :-
	write('A1\n').

escolheCelula('A2') :-
	write('A2\n').

escolheCelula('A3') :-
	write('A3\n').

escolheCelula('A4') :-
	write('A4\n').

escolheCelula('A5') :-
	write('A5\n').

escolheCelula('A6') :-
	write('A6\n').

escolheCelula('B0') :-
	write('B0\n').

escolheCelula('B1') :-
	write('B1\n').

escolheCelula('B2') :-
	write('B2\n').

escolheCelula('B3') :-
	write('B3\n').

escolheCelula('B4') :-
	write('B4\n').

escolheCelula('B5') :-
	write('B5\n').

escolheCelula('B6') :-
	write('B6\n').

escolheCelula('C0') :-
	write('C0\n').

escolheCelula('C1') :-
	write('C1\n').

escolheCelula('C2') :-
	write('C2\n').

escolheCelula('C3') :-
	write('C3\n').

escolheCelula('C4') :-
	write('C4\n').

escolheCelula('C5') :-
	write('C5\n').

escolheCelula('C6') :-
	write('C6\n').

escolheCelula('D0') :-
	write('D0\n').

escolheCelula('D1') :-
	write('D1\n').

escolheCelula('D2') :-
	write('D2\n').

escolheCelula('D3') :-
	write('D3\n').

escolheCelula('D4') :-
	write('D4\n').

escolheCelula('D5') :-
	write('D5\n').

escolheCelula('D6') :-
	write('D6\n').

escolheCelula(_) :-
	nl,
	write('[ERROR] Invalid option.\n\n'),
	write('Select your input cell > '),
	false.


escolheCelulaLetra(_) :-
	nl,
	write('[ERROR] Invalid option.\n\n'),
	write('Select your input cell letter [A, B, C, D] > '),
	false.
