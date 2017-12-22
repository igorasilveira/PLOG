:- use_module(library(system)).

imprimeTitulo :-
	limpaEcra,
	novaLinha(3),
	write('******************************\n'),
	write('---          TRIAD         ---\n'),
	write('******************************\n'),
	novaLinha(1).

imprimeExit :-
	nl,
  write('*****************************\n'),
  write('--- Now Exiting, goodbye! ---\n'),
  write('*****************************\n'),
  novaLinha(2).

explanation :-
	imprimeTitulo,
  write('*****************************\n'),
  write('---      HOW TO PLAY      ---\n'),
  write('*****************************\n'),
  novaLinha(2),
  write('TODO...'),
  novaLinha(2).

%- Menu Inicial -%

menuPrincipal :-
  imprimeTitulo,
  write('*************************\n'),
  write('*        Main Menu      *\n'),
  write('*************************\n'),
  novaLinha(2),
  write('1: Solve Triad\n'),
  write('2: See Triad Puzzle Explanation\n'),
  write('3: Quit\n\n'),
  repeat,
  read(Choice),
  verificaMenu1(Choice).

verificaMenu1(1) :-
  limpaEcra,
  selecionaTamanho.

verificaMenu1(2) :-
  limpaEcra,
  explanation,
  esperaTecla,
  menuPrincipal.

verificaMenu1(3) :-
  imprimeExit,
  abort.

verificaMenu1(_) :-
  nl,
  write('[ERROR] Invalid option, please choose between 1 and 3\n\n'),
  false.

%- Size Menu -%

selecionaTamanho :-
  imprimeTitulo,
  write('**************************\n'),
  write('*     Select a Number    *\n'),
  write('**************************\n'),
  novaLinha(2),
  write('[NOTICE] The smallest TRIAD allowed is of 3x3\n'),
  novaLinha(2),
  repeat,
  read(Choice),
  verificaMenu2(Choice).

  verificaMenu2(1) :-
    nl,
    write('\n[ERROR] The smallest TRIAD allowed is of 3x3\n\n'),
    !,
    false.

  verificaMenu2(2) :-
    nl,
    write('\n[ERROR] The smallest TRIAD allowed is of 3x3\n\n'),
    !,
    false.

  verificaMenu2(Tamanho) :-
    limpaEcra,
    resolvePuzzle(Tamanho).
