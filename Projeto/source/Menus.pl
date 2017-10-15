%- Menu Inicial -%

menuPrincipal :-
  imprimeTitulo,
  write('*************************\n'),
  write('*        Main Menu      *\n'),
  write('*************************\n'),
  novaLinha(2),
  write('1: Play\n'),
  write('2: Quit\n\n'),
  repeat,
  read(Choice),
  verificaInputInicial(Choice).

verificaInputInicial(1) :-
  limpaEcra,
  criaTabuleiro(Tabuleiro),
  jogo(Tabuleiro).

verificaInputInicial(2) :-
  nl,
  write('*****************************\n'),
  write('--- Now Exiting, goodbye! ---'),
  nl,
  write('*****************************\n'),
  novaLinha(2), abort.

verificaInputInicial(_) :-
  nl,
  write('[ERROR] Invalid option, please choose 1 or 2\n\n'),
  false.
