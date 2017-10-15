%- Desenho dos berlindes -%

interpreta('*') :-
	%SWI%
	%ansi_format([bold,fg(red)], '(', []),%
	%write(' '),%
	%ansi_format([bold,fg(red)], ')', []),%
	%NON SWI
	write(' * ').
	

interpreta('+') :-
	%SWI%
	%ansi_format([bold,fg(blue)], '(', []),%
	%write(' '),
	%ansi_format([bold,fg(blue)], ')', []).%
	%NON SWI%
	write(' @ ').

interpreta(' ') :-
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
	imprimeTabuleiro(Tabuleiro, 0).