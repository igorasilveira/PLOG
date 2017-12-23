:- use_module(library(clpfd)).


carros :-
  length(Cores,4), domain(Cores,1,4), all_distinct(Cores),
  length(Tam, 4), domain(Tam,1,4), all_distinct(Tam),
  element(IdxVerde,Cores,3),
  element(IdxVerde,Tam,1),
  element(IdxAzul,Cores,1),
  IdxVerde #> IdxAzul,
  AntesAzul#=IdxAzul-1,
  DepoisAzul#=IdxAzul+1,
  element(AntesAzul,Tam,Peq),
  element(DepoisAzul,Tam,Gr),
  Peq #< Gr,
  labeling([],Cores),
  write(Cores).
