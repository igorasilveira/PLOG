:- include('Utilitarios.pl').
:- include('Interface.pl').
:- include('Logica.pl').

triad(_Modo) :-
  limpaEcra,
  resolvePuzzle(_Modo).
