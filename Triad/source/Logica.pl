:- use_module(library(lists)).
:- use_module(library(clpfd)).
:- use_module(library(random)).

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

insereValores(Tabuleiro, [], [], Out) :-
  updateBoard(-1, 0, 0, Tabuleiro, Out).

insereValores(Tabuleiro, [PosHead | PosTail], [ValHead | ValTail], Out) :-
  nth0(0, PosHead, Y),
  nth0(1, PosHead, X),
  updateBoard(ValHead, Y, X, Tabuleiro, NovoTabuleiro),
  insereValores(NovoTabuleiro, PosTail, ValTail, Out).

resolvePuzzle(_Tamanho) :-
  imprimeTitulo,
  nl,
  write('Solving '), write(_Tamanho) ,write('x'), write(_Tamanho) , write(' Triad'), nl,
  reset_timer,
  calculaSolucao(Valores, _Tamanho),
  mostraResolucao(_Tamanho, Valores),
  print_time,
  esperaTecla, menuPrincipal.

mostraResolucao(_Tamanho, Valores) :-
  imprimeTitulo,
  write('    Solution for '), write(_Tamanho), write('x'),
  write(_Tamanho), write(' Triad'),
  novaLinha(2),
  imprimeLista(Valores, 1, 1, _Tamanho),
  %write(Valores),
  novaLinha(2).
