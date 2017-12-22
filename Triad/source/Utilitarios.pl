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

extraiNumeroLista([H | _T], Numero) :-
  Numero is H.

getNumber(NumberIn, NumberFinal) :-
	char_code(Number1, NumberIn),
	atom_chars(Number1, Number2),
	number_chars(Number, Number2),
	NumberFinal is Number + 1.

verCasa(Tabuleiro, Y, X, Elemento) :-
  nth1(Y, Tabuleiro, YMatrix),
  nth1(X, YMatrix, Elemento).

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

subLista(List, From, Count, SubList) :-
    findall(E, (nth1(I, List, E), I >= From, I < From + Count), SubList).
