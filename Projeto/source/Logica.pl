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
	verificaSequenciaHorizontal(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Jogador, Pontos, 0, 1, 0),
	verificaSequenciaVertical(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Jogador, Pontos, 1, 0, 0).

%Verifica Pontos no Tabuleiro para o jogador atual Modo Express (HORIZONTAL)
verificaSequenciaHorizontal(1, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, _, Pontos, _, _, 5) :-
	Pontos is 5,
	atualizaPontos(Jogador, J1Pontos, J2Pontos, Pontos, J1PontosAtualizado, J2PontosAtualizado),
	trocaJogador(Jogador, NovoJogador),
	jogo(1, ModoJogadores, Tabuleiro, NovoJogador, J1PontosAtualizado, J2PontosAtualizado).

%Verifica Pontos no Tabuleiro para o jogador atual Modo Expert
verificaSequenciaHorizontal(2, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, _, Pontos, _, _, 7) :-
	Pontos is 7,
	write('is 7\n'),
	atualizaPontos(Jogador, J1Pontos, J2Pontos, Pontos, J1PontosAtualizado, J2PontosAtualizado),
	trocaJogador(Jogador, NovoJogador),
	jogo(2, ModoJogadores, Tabuleiro, NovoJogador, J1PontosAtualizado, J2PontosAtualizado).

verificaSequenciaHorizontal(2, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, _, Pontos, _, _, 6) :-
	Pontos is 6,
	write('is 6\n'),
	atualizaPontos(Jogador, J1Pontos, J2Pontos, Pontos, J1PontosAtualizado, J2PontosAtualizado),
	trocaJogador(Jogador, NovoJogador),
	jogo(2, ModoJogadores, Tabuleiro, NovoJogador, J1PontosAtualizado, J2PontosAtualizado).

verificaSequenciaHorizontal(2, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, _, Pontos, X, Y, 5) :-
	Pontos is 5,
	atualizaPontos(Jogador, J1Pontos, J2Pontos, Pontos, J1PontosAtualizado, J2PontosAtualizado),
	trocaJogador(Jogador, NovoJogador),
	jogo(2, ModoJogadores, Tabuleiro, NovoJogador, J1PontosAtualizado, J2PontosAtualizado).

verificaSequenciaHorizontal(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, X, Y, Contador) :-
	X < 7,
	Peca == Jogador,
	X1 is X + 1,
	Contador1 is Contador + 1,
	verCasa(Tabuleiro, Y, X1, NovaPeca),
	NovaPeca == Jogador,
	verificaSequenciaHorizontal(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, NovaPeca, Pontos, X1, Y, Contador1).

verificaSequenciaHorizontal(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, _, Y, Contador) :-
	Y < 7,
	Y1 is Y + 1,
	verificaSequenciaHorizontal(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, 0, Y1, 0).

verificaSequenciaHorizontal(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, 0, Y1, Contador).

%Verifica Pontos no Tabuleiro para o jogador atual Modo Express (VERTICAL)
verificaSequenciaVertical(1, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, _, Pontos, _, _, 5) :-
	Pontos is 5,
	atualizaPontos(Jogador, J1Pontos, J2Pontos, Pontos, J1PontosAtualizado, J2PontosAtualizado),
	trocaJogador(Jogador, NovoJogador),
	jogo(TipoJogo, ModoJogadores, Tabuleiro, NovoJogador, J1PontosAtualizado, J2PontosAtualizado).

verificaSequenciaVertical(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, X, Y, Contador) :-
	Y < 7,
	Peca == Jogador,
	Y1 is Y + 1,
	Contador1 is Contador + 1,
	verCasa(Tabuleiro, Y1, X, NovaPeca),
	NovaPeca == Jogador,
	verificaSequenciaVertical(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, NovaPeca, Pontos, X, Y1, Contador1).

verificaSequenciaVertical(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, X, _, Contador) :-
	X < 7,
	X1 is X + 1,
	verificaSequenciaVertical(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, X1, 0, 0).

verificaSequenciaVertical(TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos, Peca, Pontos, Y, 0, Contador) :-
	trocaJogador(Jogador, NovoJogador),
	jogo(TipoJogo, ModoJogadores, Tabuleiro, NovoJogador, J1Pontos, J2Pontos).
