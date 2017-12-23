:- use_module(library(lists)).
:- use_module(library(clpfd)).
:- use_module(library(random)).

calculaSolucao(Valores, _Tamanho) :-
  _Celulas is floor((exp(_Tamanho, 2) + _Tamanho) / 2),
  length(Valores, _Celulas),
  domain(Valores, 1, _Tamanho),
  constrainLinhas(Valores, 1, 1, _Celulas, _Tamanho),
  constrainDiagonais(Valores, 1, 1, _Celulas, _Tamanho),
  labeling([], Valores).

%corre linha a linha - ex nós 1, 2, 4, 7
constrainLinhas(Valores, K, Index, Celulas, Tamanho) :-
  Index =< Celulas - (Tamanho - 1),
  Index1 is Index + K,
  K1 is K + 1,
  restricaoLinhaCompleta(Valores, 1, K, Index),
  constrainLinhas(Valores, K1, Index1, Celulas, Tamanho).

constrainLinhas(_, _, _, _, _).

%percorre todos os K nós da linha
restricaoLinhaCompleta(_, _, 0, _).

restricaoLinhaCompleta(Valores, Contador, K, Index) :-
  nth1(Index, Valores, V1), %no a ser tratado
  Next is Index + 1,
  auxLinhaCompleta(V1, Valores, 1, K, Index), %constringe a linha
  Contador1 is Contador + 1,
  K1 is K - 1,
  restricaoLinhaCompleta(Valores, Contador1, K1, Next).

auxLinhaCompleta(_, _, Final, Final, _).
auxLinhaCompleta(V1, Valores, Contador, K, Index) :-
  Contador1 is Contador + 1,
  NextRight is Index + Contador,
  nth1(NextRight, Valores, V2),
  V1 #\= V2,
  auxLinhaCompleta(V1, Valores, Contador1, K, Index).

constrainDiagonais(_, Tamanho, _, _, Tamanho).
constrainDiagonais(_, _, Celulas, Celulas, _).
constrainDiagonais(Valores, K, Index, Celulas, Tamanho) :-
  K < Tamanho,
  Index1 is Index + K,
  K1 is K + 1,
  safeLine(Valores, 0, K, Index, Celulas, Tamanho),
  constrainDiagonais(Valores, K1, Index1, Celulas, Tamanho).

%percorre todos os K nós da linha
safeLine(_, K, K, _, _, _).
safeLine(Valores, Contador, K, Index, Celulas, Tamanho) :-
  Index < Celulas - (Tamanho - 1),
  nth1(Index, Valores, V1), %no a ser tratado
  Next is Index + 1,
  safeDiagonal(V1, Valores, K, Index, Index, Tamanho), %constringe os diagonais
  Contador1 is Contador + 1,
  safeLine(Valores, Contador1, K, Next, Celulas, Tamanho).

safeDiagonal(_, _, Final, _, _, Final).
safeDiagonal(V1, Valores, K, IndexLeft, IndexRight, Final) :-
  NextLeft is IndexLeft + K,
  NextRight is IndexRight + K + 1,
  nth1(NextLeft, Valores, V2),
  nth1(NextRight, Valores, V3),
  V1 #\= V2, V1 #\= V3,
  K1 is K + 1,
  safeDiagonal(V1, Valores, K1, NextLeft, NextRight, Final).

resolvePuzzle(_Tamanho) :-
  imprimeTitulo,
  nl,
  write('Solving '), write(_Tamanho) ,write('x'), write(_Tamanho) , write(' Trid'), nl,
  reset_timer,
  calculaSolucao(Valores, _Tamanho),
  mostraResolucao(_Tamanho, Valores),
  print_time,
  esperaTecla, menuPrincipal.

mostraResolucao(_Tamanho, Valores) :-
  imprimeTitulo,
  write('    Solution for '), write(_Tamanho), write('x'),
  write(_Tamanho), write(' Trid'),
  novaLinha(2),
  imprimeLista(Valores, 1, 1, _Tamanho),
  %write(Valores),
  novaLinha(2).
