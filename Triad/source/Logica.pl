:- use_module(library(lists)).
:- use_module(library(clpfd)).
:- use_module(library(random)).

criaTriad(3, Tabuleiro, Posicoes) :-
  Tabuleiro = [
  %linha 1
  [-1, -1, 0, -1, -1],
  %[-1, -1, -2, -1, -1],
  %linha 2
  [-1, 0, -1, 0, -1],
  %[-1, -2, -1, -2, -1],
  %linha 3
  [0, -1, 0, -1, 0]
  ],
  Posicoes = [
  [0, 2],
  [1, 1], [1, 3],
  [2, 0], [2, 2], [2, 4]
  ].

criaTriad(5, Tabuleiro, Posicoes) :-
  Tabuleiro = [
  %linha 1
  [-1, -1, -1, -1, 0, -1, -1, -1, -1],
  %[-1, -1, -1, -1, -2, -1, -1, -1, -1],
  %linha 2
  [-1, -1, -1, 0, -1, 0, -1, -1, -1],
  %[-1, -1, -1, -2, -2, -2, -1, -1, -1],
  %linha 3
  [-1, -1, 0, -1, 0, -1, 0, -1, -1],
  %[-1, -1, -2, -2, -2, -2, -2, -1, -1],
  %linha 4
  [-1, 0, -1, 0, -1, 0, -1, 0, -1],
  %[-1, -2, -2, -2, -2, -2, -2, -2, -1],
  %linha 5
  [0, -1, 0, -1, 0, -1, 0, -1, 0]
  ],
  Posicoes = [
  [0, 4],
  [1, 3], [1, 5],
  [2, 2], [2, 4], [2, 6],
  [3, 1], [3, 3], [3, 5], [3, 7],
  [4, 0], [4, 2], [4, 4], [4, 6], [4, 8]
  ].

criaTriad(7, Tabuleiro, Posicoes) :-
  Tabuleiro = [
  %linha 1
  [-1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1],
  %[-1, -1, -1, -1, -1, -1, -2, -1, -1, -1, -1, -1, -1],
  %linha 2
  [-1, -1, -1, -1, -1, 0, -1, 0, -1, -1, -1, -1, -1],
  %[-1, -1, -1, -1, -1, -2, -2, -2, -1, -1, -1, -1, -1],
  %linha 3
  [-1, -1, -1, -1, 0, -1, 0, -1, 0, -1, -1, -1, -1],
  %[-1, -1, -1, -1, -2, -2, -2, -2, -2, -1, -1, -1, -1],
  %linha 4
  [-1, -1, -1, 0, -1, 0, -1, 0, -1, 0, -1, -1, -1],
  %[-1, -1, -1, -2, -2, -2, -2, -2, -2, -2, -1, -1, -1],
  %linha 5
  [-1, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, -1],
  %[-1, -1, -2, -2, -2, -2, -2, -2, -2, -2, -2, -1, -1],
  %linha 6
  [-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1],
  %[-1, -2, -1, -2, -1, 0, -1, -2, -1, 0, -1, -2, -1],
  %linha 7
  [0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0]
  ],
  Posicoes = [
  [1, 6],
  [3, 5], [3, 6], [3, 7],
  [5, 4], [5, 5], [5, 6], [5, 7], [5, 8],
  [7, 3], [7, 4], [7, 5], [7, 6], [7, 7], [7, 8], [7, 9],
  [9, 2], [9, 3], [9, 4], [9, 5], [9, 6], [9, 7], [9, 8], [9, 9], [9, 10],
  [11, 1], [11, 2], [11, 3], [11, 4], [11, 5], [11, 6], [11, 7], [11, 8], [11, 9], [11, 10], [11, 11]
  ].

% Faz update a Board
updateTo(_,[],[],_,_).
updateTo(ElemToChange,[[_|Xs]|Ys],[[ElemToChange|Xs1]|Ys1],0,0) :-
                    !,updateTo(ElemToChange,[Xs|Ys],[Xs1|Ys1],-1,-1).

updateTo(ElemToChange,[[X]|Xs],[[X]|Xs1],-1,-1) :-
                    updateTo(ElemToChange,Xs,Xs1,-1,-1),!.

updateTo(ElemToChange,[[X|Xs]|Ys],[[X|Xs1]|Ys1],-1,-1) :-
                    updateTo(ElemToChange,[Xs|Ys],[Xs1|Ys1],-1,-1).

updateTo(ElemToChange,[[X|Xs]|Ys],[[X|Xs1]|Ys1],N,0) :-
                    N1 is N-1,
                    updateTo(ElemToChange,[Xs|Ys],[Xs1|Ys1],N1,0).

updateTo(ElemToChange,[Xs|Ys],[Xs|Ys1],N,M) :-
                    M1 is M-1,
                    updateTo(ElemToChange,Ys,Ys1,N,M1),!.

updateBoard(ElemToChange,Y,X,Board,NewBoard) :-
                    updateTo(ElemToChange,Board,NewBoard,X,Y).

selecionaPares(Tamanho, Tamanho, _, []).

selecionaPares(Count, Tamanho, Posicoes, [H | T]) :-
  length(Posicoes, TamanhoPosicoes),
  random(0, TamanhoPosicoes, Indice),
  nth0(Indice, Posicoes, H, RestoPosicoes),
  Count1 is Count + 1,
  selecionaPares(Count1, Tamanho, RestoPosicoes, T).

geraNumeros(Tabuleiro, [], Out):-
  updateBoard(-1, 0, 0, Tabuleiro, Out).

geraNumeros(Tabuleiro, [H|T], Out) :-
  nth0(0, H, Y),
  nth0(1, H, X),
  random(6, 12, Numero),
  updateBoard(Numero, Y, X, Tabuleiro, NovoTabuleiro),
  geraNumeros(NovoTabuleiro, T, Out).

calculaSolucao(5, Valores) :-
  Valores = [V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15],
  domain(Valores, 1, 5),
  V1 #\= V2, V1 #\= V3, V1 #\= V4, V1 #\= V6, V1 #\= V7, V1 #\= V10, V1 #\= V11, V1 #\= V15,
  V2 #\= V3, V2 #\= V4, V2 #\= V5, V2 #\= V7, V2 #\= V9, V2 #\= V11, V2 #\= V13,
  V4 #\= V5, V4 #\= V6, V4 #\= V7, V4 #\= V8, V4 #\= V11, V4 #\= V13,
  V5 #\= V6, V5 #\= V8, V5 #\= V9, V5 #\= V12, V5 #\= V14,
  V6 #\= V9, V6 #\= V10, V6 #\= V13, V6 #\= V15,
  V7 #\= V8, V7 #\= V9, V7 #\= V10, V7 #\= V11, V7 #\= V12,
  V8 #\= V9, V8 #\= V10, V8 #\= V12, V8 #\= V13,
  V9 #\= V10, V9 #\= V13, V9 #\= V14,
  V10 #\= V14, V10 #\= V15,
  V11 #\= V12, V11 #\= V13, V11 #\= V14, V11 #\= V15,
  V12 #\= V13, V12 #\= V14, V12 #\= V15,
  V13 #\= V14, V13 #\= V15,
  V14 #\= V15,
  labeling([], Valores).

calculaSolucao(Valores, _Tamanho) :-
  _Celulas is floor((exp(_Tamanho, 2) + _Tamanho) / 2),
  length(Valores, _Celulas),
  domain(Valores, 1, _Tamanho),
  write('Valores: '), write(Valores), nl,
  X is _Tamanho + 1,
  constrainLinhas(Valores, 1, 1, _Celulas, _Tamanho),
  constrainDiagonais(Valores, 1, 1, _Celulas, _Tamanho),
  labeling([], Valores).

constrainLinhas(Valores, K, Index, Celulas, Tamanho) :-
  Index =< Celulas - (Tamanho - 1),
    write('Index: '), write(Index),
    write('  K: '), write(K), nl,
  Index1 is Index + K,
  K1 is K + 1,
  restricaoLinhaCompleta(Valores, 1, K, Index),
  constrainLinhas(Valores, K1, Index1, Celulas, Tamanho).

constrainLinhas(_, _, _, _, _).
%percorre todos os K nós da linha
restricaoLinhaCompleta(_, K, K, _).

restricaoLinhaCompleta(Valores, Contador, K, Index) :-
  nth1(Index, Valores, V1), %no a ser tratado
  Next is Index + 1,
  auxLinhaCompleta(V1, Valores, 0, K, Index), %constringe a linha
  Contador1 is Contador + 1,
  restricaoLinhaCompleta(Valores, Contador1, K, Next).

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

insereValores(Tabuleiro, [], [], Out) :-
  updateBoard(-1, 0, 0, Tabuleiro, Out).

insereValores(Tabuleiro, [PosHead | PosTail], [ValHead | ValTail], Out) :-
  nth0(0, PosHead, Y),
  nth0(1, PosHead, X),
  updateBoard(ValHead, Y, X, Tabuleiro, NovoTabuleiro),
  insereValores(NovoTabuleiro, PosTail, ValTail, Out).

resolvePuzzle(_Tamanho) :-
  criaTriad(_Tamanho, Tabuleiro, Posicoes),
  %imprimeTabuleiro(Tabuleiro),
  calculaSolucao(Valores, _Tamanho),
  %calculaSolucao(_Tamanho, Valores),
  %write(Valores).
  insereValores(Tabuleiro, Posicoes, Valores, NovoTabuleiro),
  imprimeTabuleiro(NovoTabuleiro).
