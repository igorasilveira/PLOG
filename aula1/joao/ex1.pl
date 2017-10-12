%PLOG - REPRESENTACAO DE CONHECIMENTO EM PROLOG 
% Por Joao Almeida, 12/10/2017

%RC1 

male('Aldo Burrows').
female('Christina Rose Scofield').
female('Lisa Rix').
male('Lincoln Burrows').
male('LJ Burrows').
male('Michael Scofield').
female('Sara Tancredi').
female('Ella Scofield').

parent('Aldo Burrows','Lincoln Burrows').
parent('Christina Rose Scofield','Lincoln Burrows').

parent('Aldo Burrows','Michael Scofield').
parent('Christina Rose Scofield','Michael Scofield').

parent('Lisa Rix','LJ Burrows').
parent('Lincoln Burrows','LJ Burrows').

parent('Michael Scofield','Ella Scofield').
parent('Sara Tancredi','Ella Scofield').
 
%a | ?- parent(X,'Michael Scofield').
%b | ?- parent('Aldo Burrows', X).

