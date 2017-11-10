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
  read_line(Choice),
  verificaMenu1(Choice).

verificaMenu1([49 | _]) :-
  limpaEcra,
  menuGameMode.

verificaMenu1([50 | _]) :-
  imprimeExit, abort.

verificaMenu1([_ | _]) :-
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
    read_line(Choice),
    verificaMenu2(Choice).

    verificaMenu2([49 | _]) :-
      limpaEcra,
      menuGameType(1).

    verificaMenu2([50 | _]) :-
      limpaEcra,
      menuGameType(2).

      verificaMenu2([51 | _]) :-
        limpaEcra,
        menuGameType(3).

    verificaMenu2([_ | _]) :-
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
        read_line(Choice),
        verificaMenu3(ModoJogadores, Choice).

        verificaMenu3(ModoJogadores, [49 | _]) :-
          limpaEcra,
          comecaJogo(ModoJogadores, 1).

          verificaMenu3(ModoJogadores, [50 | _]) :-
            limpaEcra,
            comecaJogo(ModoJogadores, 2).

        verificaMenu3([_ | _]) :-
          nl,
          write('[ERROR] Invalid option, please choose 1 or 2\n\n'),
          false.

%------- JOGO ---------%


jogo(1, _, Tabuleiro, _, 5, 0) :-
  imprimeTabuleiro(Tabuleiro),
  informaVitoria(1),
  menuPrincipal.

jogo(1, _, Tabuleiro, _, 0, 5) :-
  imprimeTabuleiro(Tabuleiro),
  informaVitoria(1),
  menuPrincipal.

%----------------EXPRESS------------------------

%Player Vs Player, Express
jogo(1, 1, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
  imprimeTabuleiro(Tabuleiro),
  informaJogador(Jogador, 1, J1Pontos, J2Pontos),
  write('\nSelect your input cell (Q to exit) > '),
  repeat,
  read_line(Choice),
  insereBerlinde(Choice, 1, 1, Tabuleiro, Jogador, J1Pontos, J2Pontos),
  nl.

%Player Vs Computer, Express
jogo(1, 2, Tabuleiro, 1, J1Pontos, J2Pontos) :-
  imprimeTabuleiro(Tabuleiro),
  informaJogador(1, 2),
  write('\nSelect your input cell (Q to exit) > '),
  repeat,
  read_line(Choice),
  insereBerlinde(Choice, 1, 2, Tabuleiro, 1, J1Pontos, J2Pontos),
  nl.

jogo(1, 2, Tabuleiro, 2, J1Pontos, J2Pontos) :-
  imprimeTabuleiro(Tabuleiro),
  informaJogador(2, 2),
  random(65, 68, Letter),
  random(48, 54, Number),
  Choice = [Letter, Number],
  insereBerlinde(Choice, 1, 2, Tabuleiro, 2, J1Pontos, J2Pontos),
  nl.


%Player Vs Computer, Express

jogo(1, 3, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
  imprimeTabuleiro(Tabuleiro),
  informaJogador(Jogador, 3),
  random(65, 68, Letter),
  random(48, 54, Number),
  Choice = [Letter, Number],
  insereBerlinde(Choice, 1, 3, Tabuleiro, Jogador, J1Pontos, J2Pontos),
  nl.

jogo(1, 3, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
  imprimeTabuleiro(Tabuleiro),
  informaJogador(Jogador, 3),
  random(65, 68, Letter),
  random(48, 54, Number),
  Choice = [Letter, Number],
  insereBerlinde(Choice, 1, 3, Tabuleiro, Jogador, J1Pontos, J2Pontos),
  nl.

%----------------EXPERT------------------------
%Player Vs Player, Express
jogo(2, 1, Tabuleiro, Jogador, J1Pontos, J2Pontos) :-
  imprimeTabuleiro(Tabuleiro),
  informaJogador(Jogador, 1, J1Pontos, J2Pontos),
  write('\nSelect your input cell (Q to exit) > '),
  repeat,
  read_line(Choice),
  insereBerlinde(Choice, 2, 1, Tabuleiro, Jogador, J1Pontos, J2Pontos),
  nl.
