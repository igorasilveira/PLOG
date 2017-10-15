
%- Utilitarios ao Jogo -%

novaLinha(Vezes) :-
    novaLinha(0, Vezes).

novaLinha(Linha, Limite) :-
    Linha < Limite,
    LinhaInc is Linha + 1,
    nl,
    novaLinha(LinhaInc, Limite).
    
novaLinha(_,_).

esperaPorEnter :-
	write('Press any key to continue...'), novaLinha(2),
	get_single_char(_), limpaEcra.

	
limpaEcra :- novaLinha(50), !.
		

obtemNumeroDeTabuleiro(Escolha) :-
	Escolha1 = _,
	get_single_char(Escolha1),
	Escolha is Escolha1 - 48,
	write(Escolha), nl,
	Escolha > -1 , Escolha < 7.

obtemNumeroDeTabuleiro(Escolha) :-
	novaLinha(2),
	write('Please pick a number between 0 and 6...'),
	novaLinha(2),!, 
	obtemNumeroDeTabuleiro(Escolha).

	
obtemNumero(Escolha, LimiteBaixo, LimiteAlto) :-
	Escolha1 = _,
	get_single_char(Escolha1),
	Escolha is Escolha1 - 48,
	write(Escolha), nl,
	A is LimiteBaixo - 1,
	B is LimiteAlto + 1,
	Escolha > A , Escolha < B.

obtemNumero(Escolha, LimiteBaixo, LimiteAlto) :-
	novaLinha(2),
	write('Please pick a number between '), write(LimiteBaixo), write(' and '),
	write(LimiteAlto), write('...'),
	novaLinha(2),!, 
	obtemNumero(Escolha, LimiteBaixo, LimiteAlto).