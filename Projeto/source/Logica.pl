:- use_module(library(random)).

criaTabuleiro(Tabuleiro) :-
	Tabuleiro = [
	[0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0]
].

comecaJogo(ModoJogadores, TipoJogo) :-
  criaTabuleiro(Tabuleiro),
  Jogador is 1,
  jogo(TipoJogo, ModoJogadores, Tabuleiro, Jogador, 0, 0).

trocaJogador(1, NovoJogador) :-
	NovoJogador = 2.

trocaJogador(2, NovoJogador) :-
	NovoJogador = 1.

trataTopo([NumberReceived | T], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	Tabuleiro2 = _,
	getNumber(NumberReceived, NumberFinal),
	updateVerticalTopo(Jogador, Jogador, 0, NumberFinal,Tabuleiro,Tabuleiro2, TipoJogo, ModoJogadores, J1Pontos, J2Pontos).

trataDireita([NumberReceived | T], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	Tabuleiro2 = _,
	getNumber(NumberReceived, NumberFinal),
	updateHorizontalDireita(Jogador, Jogador, NumberFinal, 8, Tabuleiro,Tabuleiro2, TipoJogo, ModoJogadores, J1Pontos, J2Pontos).

trataEsquerda([NumberReceived | T], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	Tabuleiro2 = _,
	getNumber(NumberReceived, NumberFinal),
	updateHorizontalEsquerda(Jogador, Jogador, NumberFinal, 0,Tabuleiro,Tabuleiro2, TipoJogo, ModoJogadores, J1Pontos, J2Pontos).

trataBaixo([NumberReceived | T], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	Tabuleiro2 = _,
	getNumber(NumberReceived, NumberFinal),
	updateVerticalBaixo(Jogador, Jogador, 8, NumberFinal,Tabuleiro,Tabuleiro2, TipoJogo, ModoJogadores, J1Pontos, J2Pontos).

%UPDATES VERTICAIS

updateVerticalTopo(Jogador, Peca, Y, Number, Tabuleiro, Tabuleiro2, TipoJogo, ModoJogadores, J1Pontos, J2Pontos) :-
	Y < 7,
	Peca \= 0,
	Y1 is Y + 1,
	verCasa(Tabuleiro, Y1, Number, NovaPeca),
	updateBoard(Peca, Y1, Number, Tabuleiro, Tabuleiro2),
	updateVerticalTopo(Jogador, NovaPeca, Y1, Number, Tabuleiro2, Tabuleiro3, TipoJogo, ModoJogadores, J1Pontos, J2Pontos).

updateVerticalTopo(Jogador, _, _, _, Tabuleiro, Tabuleiro2, TipoJogo, ModoJogadores, J1Pontos, J2Pontos):-
	verificaSequencia(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

updateVerticalBaixo(Jogador, Peca, Y, Number, Tabuleiro, Tabuleiro2, TipoJogo, ModoJogadores, J1Pontos, J2Pontos) :-
	Y > 0,
	Peca \= 0,
	Y1 is Y - 1,
	verCasa(Tabuleiro, Y1, Number, NovaPeca),
	updateBoard(Peca, Y1, Number, Tabuleiro, Tabuleiro2),
	updateVerticalBaixo(Jogador, NovaPeca, Y1, Number, Tabuleiro2, Tabuleiro3, TipoJogo, ModoJogadores, J1Pontos, J2Pontos).

updateVerticalBaixo(Jogador, _, _, _, Tabuleiro, Tabuleiro2, TipoJogo, ModoJogadores, J1Pontos, J2Pontos):-
	verificaSequencia(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%UPDATES HORIZONTAIS
updateHorizontalDireita(Jogador, Peca, Number, X, Tabuleiro, Tabuleiro2, TipoJogo, ModoJogadores, J1Pontos, J2Pontos) :-
	X > 0,
	Peca \= 0,
	X1 is X - 1,
	verCasa(Tabuleiro, Number, X1, NovaPeca),
	updateBoard(Peca, Number, X1, Tabuleiro, Tabuleiro2),
	updateHorizontalDireita(Jogador, NovaPeca, Number, X1, Tabuleiro2, Tabuleiro3, TipoJogo, ModoJogadores, J1Pontos, J2Pontos).

updateHorizontalDireita(Jogador, _, _, _, Tabuleiro, Tabuleiro2, TipoJogo, ModoJogadores, J1Pontos, J2Pontos):-
	verificaSequencia(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

updateHorizontalEsquerda(Jogador, Peca, Number, X, Tabuleiro, Tabuleiro2, TipoJogo, ModoJogadores, J1Pontos, J2Pontos) :-
	X < 7,
	Peca \= 0,
	X1 is X + 1,
	verCasa(Tabuleiro, Number, X1, NovaPeca),
	updateBoard(Peca, Number, X1, Tabuleiro, Tabuleiro2),
	updateHorizontalEsquerda(Jogador, NovaPeca, Number, X1, Tabuleiro2, Tabuleiro3, TipoJogo, ModoJogadores, J1Pontos, J2Pontos).

updateHorizontalEsquerda(Jogador, _, _, _, Tabuleiro, Tabuleiro2, TipoJogo, ModoJogadores, J1Pontos, J2Pontos):-
	verificaSequencia(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

% Faz update a Board
updateTo(_,[],[],_,_).
updateTo(ElemToChange,[[_|Xs]|Ys],[[ElemToChange|Xs1]|Ys1],1,1) :-
                    !,updateTo(ElemToChange,[Xs|Ys],[Xs1|Ys1],0,0).

updateTo(ElemToChange,[[X]|Xs],[[X]|Xs1],0,0) :-
                    updateTo(ElemToChange,Xs,Xs1,0,0),!.

updateTo(ElemToChange,[[X|Xs]|Ys],[[X|Xs1]|Ys1],0,0) :-
                    updateTo(ElemToChange,[Xs|Ys],[Xs1|Ys1],0,0).

updateTo(ElemToChange,[[X|Xs]|Ys],[[X|Xs1]|Ys1],N,1) :-
                    N1 is N-1,
                    updateTo(ElemToChange,[Xs|Ys],[Xs1|Ys1],N1,1).

updateTo(ElemToChange,[Xs|Ys],[Xs|Ys1],N,M) :-
                    M1 is M-1,
                    updateTo(ElemToChange,Ys,Ys1,N,M1),!.

updateBoard(ElemToChange,Y,X,Board,NewBoard) :-
                    updateTo(ElemToChange,Board,NewBoard,X,Y).

verificaSequencia(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	Pontos = _,
	verificaSequenciaHorizontalEsquerda(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, 0, Pontos, 0, 1, 0),
	verificaSequenciaHorizontalDireita(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, 0, Pontos, 8, 1, 0),
	verificaSequenciaVerticalAscendente(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, 0, Pontos, 1, 8, 0),
	verificaSequenciaVerticalDescendente(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, 0, Pontos, 1, 0, 0),
	write('PASSA TODAS VERIFICACOES\n'),
	trocaJogador(Jogador, NovoJogador),
	jogo(TipoJogo, ModoJogadores, Tabuleiro, NovoJogador, J1Pontos, J2Pontos).

%-------------------- verifica sequencia horizontal (esquerda para direita) [EXPRESS]---------------
verificaSequenciaHorizontalEsquerda(1, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, _, Pontos, _, _, 5) :-
	Pontos is 5,
	atualizaPontos(Jogador, J1Pontos, J2Pontos, Pontos, J1PontosAtualizado, J2PontosAtualizado),
	trocaJogador(Jogador, NovoJogador),
	jogo(1, ModoJogadores, Tabuleiro, NovoJogador, J1PontosAtualizado, J2PontosAtualizado).

%-------------------- verifica sequencia horizontal (esquerda para direita) [EXPRESS]---------------
verificaSequenciaHorizontalDireita(1, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, _, Pontos, _, _, 5) :-
	Pontos is 5,
	atualizaPontos(Jogador, J1Pontos, J2Pontos, Pontos, J1PontosAtualizado, J2PontosAtualizado),
	trocaJogador(Jogador, NovoJogador),
	jogo(1, ModoJogadores, Tabuleiro, NovoJogador, J1PontosAtualizado, J2PontosAtualizado).

%-------------------- verifica sequencia vertical (esquerda para direita) [EXPERT]---------------
verificaSequenciaHorizontalEsquerda(2, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, _, Pontos, X, Y, 5) :-
	triggerSequencia(ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

verificaSequenciaHorizontalEsquerda(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, 0, 7, 0).

verificaSequenciaHorizontalEsquerda(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, X, Y, Contador) :-
	X < 7,
	ite(Peca == Jogador, Contador1 is Contador + 1, Contador1 is 0),
	X1 is X + 1,
	verCasa(Tabuleiro, Y, X1, NovaPeca),
	verificaSequenciaHorizontalEsquerda(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, NovaPeca, Pontos, X1, Y, Contador1).

verificaSequenciaHorizontalEsquerda(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, _, Y, Contador) :-
	Y < 7,
	Y1 is Y + 1,
	verificaSequenciaHorizontalEsquerda(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, 0, Pontos, 0, Y1, 0).

%-------------- TRIGGER pedido remoção linha --------------------
verificaSequenciaHorizontalDireita(2, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, _, Pontos, X, Y, 5) :-
	triggerSequencia(ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%-------------------- verifica sequencia vertical (esquerda para direita) [EXPERT]---------------
verificaSequenciaHorizontalDireita(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, 8, 7, 0).

verificaSequenciaHorizontalDireita(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, X, Y, Contador) :-
	X > 1,
	ite(Peca == Jogador, Contador1 is Contador + 1, Contador1 is 0),
	X1 is X - 1,
	verCasa(Tabuleiro, Y, X1, NovaPeca),
	verificaSequenciaHorizontalDireita(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, NovaPeca, Pontos, X1, Y, Contador1).

verificaSequenciaHorizontalDireita(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, _, Y, Contador) :-
	Y < 7,
	Y1 is Y + 1,
	verificaSequenciaHorizontalDireita(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, 0, Pontos, 8, Y1, 0).

%-------------- TRIGGER pedido remoção coluna --------------------
verificaSequenciaVerticalDescendente(1, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, _, Pontos, X, Y, 5) :-
	Pontos is 5,
	atualizaPontos(Jogador, J1Pontos, J2Pontos, Pontos, J1PontosAtualizado, J2PontosAtualizado),
	trocaJogador(Jogador, NovoJogador),
	jogo(1, ModoJogadores, Tabuleiro, NovoJogador, J1PontosAtualizado, J1PontosAtualizado).

%-------------- TRIGGER pedido remoção coluna --------------------
verificaSequenciaVerticalDescendente(2, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, _, Pontos, X, Y, 5) :-
	triggerSequencia(ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

%-------------------- verifica sequencia vertical (cima para baixo) ---------------
verificaSequenciaVerticalDescendente(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, 7, 0, 0).

verificaSequenciaVerticalDescendente(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, X, Y, Contador) :-
	Y < 7,
	ite(Peca == Jogador, Contador1 is Contador + 1, Contador1 is 0),
	Y1 is Y + 1,
	verCasa(Tabuleiro, Y1, X, NovaPeca),
	verificaSequenciaVerticalDescendente(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, NovaPeca, Pontos, X, Y1, Contador1).

verificaSequenciaVerticalDescendente(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, X, _, Contador) :-
	X < 7,
	X1 is X + 1,
	verificaSequenciaVerticalDescendente(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, 0, Pontos, X1, 0, 0).

%-------------- TRIGGER pedido remoção coluna --------------------
verificaSequenciaVerticalAscendente(1, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, _, Pontos, X, Y, 5) :-
	Pontos is 5,
	atualizaPontos(Jogador, J1Pontos, J2Pontos, Pontos, J1PontosAtualizado, J2PontosAtualizado),
	trocaJogador(Jogador, NovoJogador),
	jogo(1, ModoJogadores, Tabuleiro, NovoJogador, J1PontosAtualizado, J1PontosAtualizado).

%-------------------- verifica sequencia vertical (baixo para cima) ---------------
verificaSequenciaVerticalAscendente(2, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, _, Pontos, X, Y, 5) :-
	triggerSequencia(ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos).

verificaSequenciaVerticalAscendente(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, 7, 8, Contador).

verificaSequenciaVerticalAscendente(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, X, Y, Contador) :-
	Y > 1,
	ite(Peca == Jogador, Contador1 is Contador + 1, Contador1 is 0),
	Y1 is Y - 1,
	verCasa(Tabuleiro, Y1, X, NovaPeca),
	verificaSequenciaVerticalAscendente(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, NovaPeca, Pontos, X, Y1, Contador1).

verificaSequenciaVerticalAscendente(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, X, _, Contador) :-
	X < 7,
	X1 is X + 1,
	verificaSequenciaVerticalAscendente(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, 0, Pontos, X1, 8, 0).

%-------- remoçao de berlindes horizontal -------------
removeBerlindesHorizontal(X, Y, XLimite, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	X < XLimite,
	updateBoard(0, Y, X, Tabuleiro, Tabuleiro2),
	X1 is X + 1,
	removeBerlindesHorizontal(X1, Y, XLimite, ModoJogadores, Tabuleiro2, Jogador, J1Pontos, J2Pontos).

removeBerlindesHorizontal(X, Y, XLimite, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	jogo(2, ModoJogadores, Tabuleiro, NovoJogador, J1Pontos, J2Pontos).

%-------- remoçao de berlindes vertical -------------
removeBerlindesVertical(Y, X, YLimite, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	Y < YLimite,
	updateBoard(0, Y, X, Tabuleiro, Tabuleiro2),
	Y1 is Y + 1,
	removeBerlindesVertical(Y1, X, YLimite, ModoJogadores, Tabuleiro2, Jogador, J1Pontos, J2Pontos).

removeBerlindesVertical(Y, X, YLimite, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	jogo(2, ModoJogadores, Tabuleiro, NovoJogador, J1Pontos, J2Pontos).

%------------------ Escolhe tratamento vertical ----------------
escolherVertical(YInicial, YFinal, X, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	OutroYLimite is YFinal - 1,
	T is YFinal - YInicial,
	getPoints(T, Pontos),
	atualizaPontos(Jogador, J1Pontos, J2Pontos, Pontos, J1PontosAtualizado, J2PontosAtualizado),
	removeBerlindesVertical(YInicial, X, OutroYLimite, ModoJogadores, Tabuleiro, Jogador, J1PontosAtualizado, J2PontosAtualizado).

escolherHorizontal(XInicial, XFinal, Y, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	OutroXLimite is XFinal - 1,
	T is XFinal - XInicial,
	getPoints(T, Pontos),
	atualizaPontos(Jogador, J1Pontos, J2Pontos, Pontos, J1PontosAtualizado, J2PontosAtualizado),
	removeBerlindesHorizontal(XInicial, Y, OutroXLimite, ModoJogadores, Tabuleiro, Jogador, J1PontosAtualizado, J2PontosAtualizado).
