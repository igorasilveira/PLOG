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
  verificaMenu1(Choice).

verificaMenu1(1) :-
  limpaEcra,
  menuGameMode.

verificaMenu1(2) :-
  nl,
  write('*****************************\n'),
  write('--- Now Exiting, goodbye! ---'),
  nl,
  write('*****************************\n'),
  novaLinha(2), abort.

verificaMenu1(_) :-
  nl,
  write('[ERROR] Invalid option, please choose 1 or 2\n\n'),
  false.

  %- Gametype Menu -%

  menuGameMode :-
    imprimeTitulo,
    write('*************************\n'),
    write('*    Player Mode Menu   *\n'),
    write('*************************\n'),
    novaLinha(2),
    write('1: Player - Player\n'),
    write('2: Player - Computer\n'),
    write('3: Computer - Computer\n\n'),
    repeat,
    read(Choice),
    verificaMenu2(Choice).

    verificaMenu2(1) :-
      limpaEcra,
      menuGameType(1).

    verificaMenu2(2) :-
      limpaEcra,
      menuGameType(2).

      verificaMenu2(3) :-
        limpaEcra,
        menuGameType(3).

    verificaMenu2(_) :-
      nl,
      write('[ERROR] Invalid option, please choose between 1 and 3\n\n'),
      false.

      %- Difficulty Menu -%

      menuGameType(ModoJogadores) :-
        imprimeTitulo,
        write('*************************\n'),
        write('*     Type Game Menu    *\n'),
        write('*************************\n'),
        novaLinha(2),
        write('1: Express\n'),
        write('2: Expert\n\n'),
        repeat,
        read(Choice),
        verificaMenu3(ModoJogadores, Choice).

        verificaMenu3(ModoJogadores, 1) :-
          limpaEcra,
          comecaJogo(ModoJogadores, 1).

          verificaMenu3(ModoJogadores, 2) :-
            limpaEcra,
            comecaJogo(ModoJogadores, 2).

        verificaMenu3(_) :-
          nl,
          write('[ERROR] Invalid option, please choose 1 or 2\n\n'),
          false.

%------- JOGO ---------%

jogo(1, 1, Tabuleiro, Jogador, 0, 0) :-
  imprimeTabuleiro(Tabuleiro),
  informaJogador(Jogador),
  write('Select your input cell > '),
  repeat,
  read_line(Choice),
  escolheCelula(Choice),
  trocaJogador(Jogador, NovoJogador),
  jogo(1, 1, Tabuleiro, NovoJogador, 0, 0),
  nl.
