:- use_module(library(clpfd)).

carros2 :-
  length(Carros,12),
  domain(Carros,1,4),
  global_cardinality(Carros,[1-3,2-2,3-4,4-3]),
