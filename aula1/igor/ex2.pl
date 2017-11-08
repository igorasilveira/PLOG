pilot('Lamb').
pilot('Besenyei').
pilot('Chambliss').
pilot('MacLean').
pilot('Mangold').
pilot('Jones').
pilot('Bonhomme').

da_equipa('Lamb', 'Breitling').
da_equipa('Besenyei', 'Red Bull').
da_equipa('Chambliss', 'Red Bull').
da_equipa('MacLean', 'Mediterranean Racing Team').
da_equipa('Mangold', 'Cobra').
da_equipa('Jones', 'Matador').
da_equipa('Bonhomme', 'Matador').

tem_aviao('Lamb', 'MX2').
tem_aviao('Besenyei', 'Edge540').
tem_aviao('Chambliss', 'Edge540').
tem_aviao('MacLean', 'Edge540').
tem_aviao('Mangold', 'Edge540').
tem_aviao('Jones', 'Edge540').
tem_aviao('Bonhomme', 'Edge540').

circuito('Istanbul').
circuito('Budapest').
circuito('Porto').

vence_em('Jones', 'Porto').
vence_em('Mangold', 'Budapest').
vence_em('Mangold', 'Istanbul').

numero_gates('Istanbul', 9).
numero_gates('Budapest', 6).
numero_gates('Porto', 5).

equipa_ganha(X, Y) :- vence_em(Z, Y), da_equipa(Z, X).