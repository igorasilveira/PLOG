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
	updateVertical(Jogador, 0, NumberFinal,Tabuleiro,Tabuleiro2),
	trocaJogador(Jogador, NovoJogador),
	jogo(TipoJogo, ModoJogadores, Tabuleiro2, NovoJogador, J1Pontos, J2Pontos).

trataDireita([NumberReceived | T], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	Tabuleiro2 = _,
	getNumber(NumberReceived, NumberFinal),
	updateBoard(Jogador, NumberFinal, 7, Tabuleiro,Tabuleiro2),
	trocaJogador(Jogador, NovoJogador),
	jogo(TipoJogo, ModoJogadores, Tabuleiro2, NovoJogador, J1Pontos, J2Pontos).

trataEsquerda([NumberReceived | T], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	Tabuleiro2 = _,
	getNumber(NumberReceived, NumberFinal),
	updateBoard(Jogador, NumberFinal, 1, Tabuleiro,Tabuleiro2),
	trocaJogador(Jogador, NovoJogador),
	jogo(TipoJogo, ModoJogadores, Tabuleiro2, NovoJogador, J1Pontos, J2Pontos).

trataBaixo([NumberReceived | T], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	Tabuleiro2 = _,
	getNumber(NumberReceived, NumberFinal),
	updateBoard(Jogador, 7, NumberFinal, Tabuleiro,Tabuleiro2),
	trocaJogador(Jogador, NovoJogador),
	jogo(TipoJogo, ModoJogadores, Tabuleiro2, NovoJogador, J1Pontos, J2Pontos).

updateVertical(Jogador, Y, Number, Tabuleiro, Tabuleiro2) :-
	Y < 7,
	Y1 is Y + 1,
	updateBoard(Jogador, Y1, Number, Tabuleiro, Tabuleiro2),
	updateVertical(Jogador, Y1, Number, Tabuleiro, Tabuleiro2).

updateVertical(_, 7, _, _, _).
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
