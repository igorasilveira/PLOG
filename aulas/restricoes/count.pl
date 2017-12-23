count(_,[],0).
count(Val,[H|T],Cnt) :-
  (Val#=H) #<=> B,
  count(Val,T,Cnt2),
  Cnt #= Cnt2+B.
