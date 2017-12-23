:- use_module(library(system)).

imprimeTitulo :-
	limpaEcra,
	novaLinha(3),
	write('******************************\n'),
	write('---          TRID          ---\n'),
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
  write('The Trid puzzle is a triangular puzzle that is quite similar to Sudoku\n'),
	write('in any given range, you must place numbers in each inner triangle vertex\n'),
	write('such that no digit is repetead along any straight line.\n'),
	write('In our approach, you can choose the PC to solve a randomly sized Trid puzzle,\n'),
	write('or specify its size, after selecting the option one "Solve a Trid puzzle".\n'),
	write('The output is a Trid puzzle solved.\n'),
	novaLinha(2).

%- Menu Inicial -%

menuPrincipal :-
  imprimeTitulo,
  write('*************************\n'),
  write('*        Main Menu      *\n'),
  write('*************************\n'),
  novaLinha(2),
  write('1: Solve a Trid\n'),
  write('2: See Triad Puzzle Explanation\n'),
  write('3: Quit\n\n'),
  repeat,
  read(Choice),
  verificaMenu1(Choice).

verificaMenu1(1) :-
  limpaEcra,
  selecionaTipo.

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

% Trid Menu %

selecionaTipo :-
  imprimeTitulo,
  write('**************************\n'),
  write('*      Select a Type     *\n'),
  write('**************************\n'),
  novaLinha(2),
  write('1: Random Size\n'),
  write('2: Custom Size\n\n'),
  repeat,
  read(Choice),
  verificaMenu2(Choice).

verificaMenu2(1) :-
  limpaEcra,
  random(3, 12, Tamanho),	%entre 3 e 11
  resolvePuzzle(Tamanho).

verificaMenu2(2) :-
  limpaEcra,
	selecionaTamanho.

verificaMenu2(_) :-
	nl,
  write('[ERROR] Invalid option, please choose between 1 and 2\n\n'),
  false.

%- Size Menu -%

selecionaTamanho :-
  imprimeTitulo,
  write('**************************\n'),
  write('*     Select a Number    *\n'),
  write('**************************\n'),
  novaLinha(2),
  write('[NOTICE] The smallest TRID allowed is of 3x3\n'),
  novaLinha(2),
  repeat,
  read(Choice),
  verificaMenu3(Choice).

  verificaMenu3(1) :-
    nl,
    write('\n[ERROR] The smallest TRID allowed is of 3x3\n\n'),
    !,
    false.

  verificaMenu3(2) :-
    nl,
    write('\n[ERROR] The smallest TRID allowed is of 3x3\n\n'),
    !,
    false.

  verificaMenu3(Tamanho) :-
    limpaEcra,
    resolvePuzzle(Tamanho).
