:- use_module(library(lists)).
%- Utilitarios ao Jogo -%

novaLinha(Vezes) :-
    novaLinha(0, Vezes).

novaLinha(Linha, Limite) :-
    Linha < Limite,
    LinhaInc is Linha + 1,
    nl,
    novaLinha(LinhaInc, Limite).

novaLinha(_,_).

limpaEcra :- novaLinha(50), !.

esperaTecla :-
  write('\nEnter anything and "." + ENTER to continue > '),
  read(_Choice).

extraiNumeroLista([H | _T], Numero) :-
  Numero is H.

getNumber(NumberIn, NumberFinal) :-
	char_code(Number1, NumberIn),
	atom_chars(Number1, Number2),
	number_chars(Number, Number2),
	NumberFinal is Number.

ite(If, Then, _) :-
  If, !, Then.

ite(_, _, Else) :-
  Else.

tamanhoLista(Lista, Conta):-
		X = _,
        auxiliarTamanho(Lista, X),
		Conta is X.

auxiliarTamanho([],X) :-
	X = 0.

auxiliarTamanho([ _ | Cauda ], Conta):-
        auxiliarTamanho(Cauda,Anterior),
        Conta = Anterior + 1.

tamanhoTabuleiro([H | T], XLimite, YLimite) :-
		tamanhoLista(H, XLimite),
		tamanhoLista(T, Tamanho),
		YLimite is Tamanho + 1.

subLista(L, M, N, S) :-
    findall(E, (nth1(I, L, E), I >= M, I =< N), S).

reset_timer :- statistics(walltime,_).
print_time :-
	statistics(walltime,[_,T]),
	TS is ((T//10)*10)/1000,
	nl, write('Solution Time: '), write(TS), write('s'), nl, nl.
