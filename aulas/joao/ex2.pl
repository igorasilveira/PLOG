%PLOG - REPRESENTACAO DE CONHECIMENTO EM PROLOG 
% Por Joao Almeida, 12/10/2017

%RC2

pilot('Lamb').
pilot('Besenyei').
pilot('Chambliss').
pilot('MacLean').
pilot('Mangold').
pilot('Jones').
pilot('Bonhomme').

circuit('Istanbul').
circuit('Budapest').
circuit('Porto').

has_gates('Istanbul', 9).
has_gates('Budapest', 6).
has_gates('Porto', 5).

team('Lamb','Breitling').
team('Besenyei','Red Bull').
team('Chambliss','Red Bull').
team('MacLean','Mediterranean Racing Team').
team('Mangold','Cobra').
team('Jones','Matador').
team('Bonhomme','Matador').

plane('MX2','Lamb').
plane('Edge540','Besenyei').
plane('Edge540','Chambliss').
plane('Edge540','MacLean').
plane('Edge540','Mangold').
plane('Edge540','Jones').
plane('Edge540','Bonhomme').

won('Jones', 'Porto').
won('Mangold', 'Budapest').
won('Mangold', 'Istanbul').


won_team(X,Y)
	:- won(Z,Y), team(Z,X).
	











