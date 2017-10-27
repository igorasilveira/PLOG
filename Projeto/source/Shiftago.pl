:- include('Utilitarios.pl').
:- include('Interface.pl').
:- include('Menus.pl').
:- include('Logica.pl').

start(1) :-
    Posicoes = [
[0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0],
    ],
    imprimeTabuleiro(Posicoes).

start(2) :-
    Posicoes = [
[1, 0, 1, 0, 0, 0, 0],
[1, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0],
[2, 1, 0, 0, 0, 0, 0],
[2, 2, 0, 0, 0, 0, 0],
[2, 1, 0, 1, 2, 1, 1],
[2, 1, 2, 2, 2, 0, 0]
    ],
    imprimeTabuleiro(Posicoes).

start(3) :-
    Posicoes = [
[0, 0, 0, 0, 0, 0, 2],
[2, 2, 0, 0, 0, 0, 1],
[0, 0, 0, 0, 0, 1, 2],
[0, 0, 0, 2, 1, 2, 1],
[0, 0, 0, 1, 1, 2, 1],
[0, 0, 1, 1, 1, 1, 2],
[0, 0, 0, 0, 0, 2, 2],
    ],
    imprimeTabuleiro(Posicoes).

shiftago :-
  limpaEcra,
	menuPrincipal.
