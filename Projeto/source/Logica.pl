criaTabuleiro(Tabuleiro) :-
	Tabuleiro = [
	[0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0]
].

comecaJogo(ModoJogadores, TipoJogo) :-
  criaTabuleiro(Tabuleiro),
  Jogador = 1,
  jogo(TipoJogo, ModoJogadores, Tabuleiro, Jogador, 0, 0).

trocaJogador(1, NovoJogador) :-
	NovoJogador = 2.

trocaJogador(1, NovoJogador) :-
	NovoJogador = 1.

trataTopo([NumberReceived | T], TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	Tabuleiro2 = _,
	char_code(Number1, NumberReceived),
	atom_chars(Number1, Number2),
	number_chars(Number, Number2),
	updateBoard(Jogador, 2, Number,Tabuleiro,Tabuleiro2),
	trocaJogador(Jogador, NovoJogador),
	jogo(TipoJogo, ModoJogadores, Tabuleiro2, NovoJogador, J1Pontos, J2Pontos).

trataDireita(Number, TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	write('Direita\n').

trataEsquerda(Number, TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	write('Esquerda\n').

trataBaixo(Number, TipoJogo, ModoJogadores, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
	write('Baixo\n').

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
