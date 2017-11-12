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

extraiNumeroLista([H | T], Numero) :-
  Numero is H.

getNumber(NumberIn, NumberFinal) :-
	char_code(Number1, NumberIn),
	atom_chars(Number1, Number2),
	number_chars(Number, Number2),
	NumberFinal is Number + 1.

getSmaller([Number1 | T], [Number2 | T], SmallerNumber, LargerNumber) :-
  write('A\n'),
	getNumber(Number1, FirstNumber),
	getNumber(Number2, SecondNumber),
  write('B\n'),
	ite(FirstNumber < SecondNumber, (SmallerNumber is FirstNumber, LargerNumber is SecondNumber), (SmallerNumber is SecondNumber, LargerNumber is FirstNumber)).

getPoints(2, Pontos) :-
  Pontos is 2.

getPoints(3, Pontos) :-
  Pontos is 5.

getPoints(4, Pontos) :-
  Pontos is 10.

getIntervalo(LimiteBaixo, LimiteCima, Output) :-
  read_line(Choice),
  extraiNumeroLista(Choice, Numero),
  getNumber(Numero, Saida),
  ite((Saida >= LimiteBaixo, Saida =< LimiteCima), Output = Saida, (write('\nInvalid choice!\n'), false)).

verCasa(Tabuleiro, Y, X, Elemento) :-
  nth1(Y, Tabuleiro, YMatrix),
  nth1(X, YMatrix, Elemento).

atualizaPontos(1, J1Pontos, J2Pontos, Pontos, J1PontosAtualizado, J2PontosAtualizado) :-
  J1PontosAtualizado is J1Pontos + Pontos,
  J2PontosAtualizado is J2Pontos.

atualizaPontos(2, J1Pontos, J2Pontos, Pontos, J1PontosAtualizado, J2PontosAtualizado) :-
  J1PontosAtualizado is J1Pontos,
  J2PontosAtualizado is J2Pontos + Pontos.

ite(If, Then, _) :-
  If, !, Then.

ite(_, _, Else) :-
  Else.
