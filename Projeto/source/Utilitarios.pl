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

getNumber(NumberIn, NumberFinal) :-
	char_code(Number1, NumberIn),
	atom_chars(Number1, Number2),
	number_chars(Number, Number2),
	NumberFinal is Number + 1.

verCasa(Tabuleiro, Y, X, Elemento) :-
  nth1(Y, Tabuleiro, YMatrix),
  nth1(X, YMatrix, Elemento).

atualizaPontos(1, J1Pontos, J2Pontos, Pontos, J1PontosAtualizado, J2PontosAtualizado) :-
  J1PontosAtualizado is J1Pontos + Pontos,
  J2PontosAtualizado is J2Pontos.

atualizaPontos(2, J1Pontos, J2Pontos, Pontos, J1PontosAtualizado, J2PontosAtualizado) :-
  J1PontosAtualizado is J1Pontos,
  J2PontosAtualizado is J2Pontos + Pontos.
